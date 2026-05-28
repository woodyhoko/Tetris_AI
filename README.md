# Tetris AI — Written in x86 Assembly

*A fully playable Tetris game with a self-learning heuristic AI, an adversarial "Hell Mode" engine, and a training loop — all implemented in x86 Assembly.*

[![Tetris AI Demo](https://raw.githubusercontent.com/woodyhoko/Tetris_AI/main/tetris.gif)](https://youtu.be/qrmSmP2yMEo)

🎥 **[Watch Full Demo on YouTube](https://youtu.be/qrmSmP2yMEo)** | **[▶ Browser AI Demo](demo.html)**

---

## 1. Why x86 Assembly?

Implementing a non-trivial AI system in x86 Assembly is a deliberate constraint that builds deep understanding of how high-level algorithms map to hardware operations. Every array access, loop, and conditional in the AI evaluation function is manually translated to register operations, addressing modes, and jump instructions — with no compiler optimizations to hide the cost structure. The result is a complete, working AI system in ~2,000 lines of hand-written ASM.

---

## 2. Game modes

| Mode | Description |
|---|---|
| **Normal** | Classic Tetris with speed scaling. Human player. |
| **Auto** | AI plays autonomously, placing pieces optimally using the heuristic. |
| **Hell Mode** | The piece generator runs the *inverse* heuristic — deliberately selecting the worst possible piece for the current board state. |
| **Train** | Start from Auto, press `T` to run the training loop — the AI self-plays and adjusts weights. |

The current trained model sustains an average of **50,000 lines** without next-piece preview or the hold function.

---

## 3. AI design

### 3.1 Board representation

The board is a 10×20 binary matrix stored as 20 16-bit words (one bit per cell per row, packed). This lets row-completeness be checked with a single `CMP reg, 0x3FF` instruction (all 10 bits set).

### 3.2 Heuristic evaluation function

For each candidate placement (all rotations × all columns), the AI evaluates the resulting board state by computing four features:

```
score = w₁ · lines_cleared
      − w₂ · holes
      − w₃ · bumpiness
      − w₄ · aggregate_height

where:
    lines_cleared  = number of complete rows (reward)
    holes          = cells with an occupied cell somewhere above them (penalty)
    bumpiness      = Σ |height[c] − height[c+1]|  for c in 0..8 (penalty)
    aggregate_height = Σ height[c]  for c in 0..9 (penalty)
```

The trained weights (from the paper by Dellacherie and later formalized by El-Tetris, Fahey 2003) are:

```asm
w1 dw 76    ; lines_cleared weight  × 100
w2 dw 36    ; holes penalty         × 100
w3 dw 18    ; bumpiness penalty     × 100
w4 dw 51    ; height penalty        × 100
```

Each feature is computed with a tight register loop in ASM. The multiply-accumulate is done in integer arithmetic (weights × 100 to avoid floating-point), with a final comparison across all candidates selecting the maximum score.

### 3.3 Piece placement search

```asm
; Outer loop: try each rotation
try_rotations:
    call rotate_piece
    ; Inner loop: slide across all valid column positions
    try_columns:
        call drop_piece       ; fast-drop the piece in this column
        call eval_board       ; compute heuristic score
        call restore_board    ; undo the drop
        ; compare score with current best → update if better
        loop try_columns
    loop try_rotations
```

The search is exhaustive over all (rotation, column) pairs — O(4 × 10) = 40 evaluations per piece. At x86 speeds this is sub-millisecond even without optimization.

### 3.4 Hell Mode — adversarial piece selection

Hell Mode inverts the objective: for each possible next piece, compute the best score the AI could achieve (as above), then select the piece that **minimizes** that best score. This is a one-level minimax: the game chooses the piece, the AI plays optimally given that piece.

```asm
hell_mode_select:
    xor esi, esi         ; worst_score = 0 (looking for minimum)
    mov ecx, 7           ; 7 piece types
    .loop:
        call best_placement_score   ; score the best move for this piece
        cmp eax, esi
        jg .not_worst
        mov esi, eax                ; new minimum found
        mov [worst_piece], ecx
    .not_worst:
        loop .loop
    mov eax, [worst_piece]
```

### 3.5 Training loop

The training procedure is a **gradient-free hill climber**: make a small random perturbation to one weight, run N self-play games, compare average score to the current baseline, and keep the change only if it improves performance. This is equivalent to a (1+1)-ES (Evolution Strategy).

```
repeat:
    pick random weight wᵢ
    δ ← random small perturbation
    wᵢ ← wᵢ + δ
    score ← mean(play N games with current weights)
    if score < baseline: wᵢ ← wᵢ − δ   (revert)
    else: baseline ← score
```

---

## 4. Files

| File | Description |
|---|---|
| `tetris.asm` | Complete game + AI in x86 Assembly (~2,000 lines) |
| `tetris.exe` | Prebuilt Windows executable |
| `tetris.gif` | Demo animation |
| `report.docx` | Technical report — architecture and AI design decisions |
| `slides.pptx` | Presentation slides |
| `demo.html` | Browser port of the heuristic AI (JavaScript) with tunable weights |

---

## 5. Run

```bash
# Windows — run the prebuilt executable directly
tetris.exe

# Or assemble from source (MASM syntax):
ml /coff tetris.asm /link /subsystem:windows kernel32.lib user32.lib gdi32.lib
```

The browser demo (`demo.html`) requires no installation — open it in any modern browser.

---

## 6. References

1. C. Fahey. "Tetris AI." colinfahey.com, 2003. (El-Tetris heuristic weights — direct inspiration for this project)
2. Y. Bjornsson and T. Marsland. "Multi-cut Pruning in Game-Tree Search." *CG 2000*, 2000.
3. H.-G. Beyer and H.-P. Schwefel. "Evolution Strategies — A Comprehensive Introduction." *Natural Computing*, 1:3–52, 2002. (background on (1+1)-ES training)
