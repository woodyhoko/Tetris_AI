# Tetris AI — Written in x86 Assembly

A fully functional **Tetris game written in x86 Assembly** with a self-learning AI player, a "Hell Mode" adversarial engine, and a training loop — all in ASM.

[![Tetris AI Demo](https://raw.githubusercontent.com/woodyhoko/Tetris_AI/main/tetris.gif)](https://youtu.be/qrmSmP2yMEo)

🎥 **[Watch Full Demo on YouTube](https://youtu.be/qrmSmP2yMEo)**

---

## Game Modes

| Mode | Description |
|---|---|
| **Normal Mode** | Classic Tetris with progressively increasing speed |
| **Hell Mode** | The AI analyses your board and **deliberately serves you the worst possible piece** |
| **Auto Mode** | The AI plays by itself, placing pieces optimally |
| **Train Mode** | Start from Auto Mode, then press `T` to run the training loop |

> The currently trained model achieves an average score of **50,000 lines** — without using the "next piece" preview or the hold function.

---

## AI Design

The AI uses a **heuristic evaluation function** trained over many self-play games, scoring board states on:
- Number of completed lines
- Bumpiness (height variance across columns)
- Number of holes created
- Maximum column height

The Hell Mode engine inverts this — it finds and serves the piece that **maximizes** your board's badness score.

---

## Files

| File | Description |
|---|---|
| `tetris.asm` | Complete game + AI in x86 Assembly |
| `tetris.exe` | Prebuilt Windows executable |
| `tetris.gif` | Demo animation |
| `report.docx` | Technical report — architecture and AI design |
| `slides.pptx` | Presentation slides |

---

## Run

```bash
# Windows — run the prebuilt executable
tetris.exe

# Or assemble from source (MASM/NASM):
nasm -f win32 tetris.asm -o tetris.obj
link tetris.obj ...
```

