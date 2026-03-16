# 🎯 Unbeatable Tic-Tac-Toe (Minimax AI)

A robust command-line implementation of Tic-Tac-Toe in Dart, featuring an **unbeatable AI** powered by the **Minimax Algorithm**.

---

## 🚀 Overview

This project is a demonstration of game theory in action. The computer opponent evaluates every possible move using a recursive Minimax search, ensuring it either wins or forces a draw. 

> **Challenge:** It is mathematically impossible to defeat this computer. If you manage to clone this repository and find a winning move against the algorithm, let me know! 🙃

## 🎮 How to Play

### 1. Prerequisites
Ensure you have the [Dart SDK](https://dart.dev/get-dart) installed on your machine.

### 2. Run the Game
From the root of the project, execute:
```bash
dart bin/tic_tac_toe_minmax.dart
```

### 3. Controls
The game uses a **Numpad-style** mapping for inputs. Enter a number between **1 and 9** to place your `X` on the board:

```text
  7 | 8 | 9 
 -----------
  4 | 5 | 6 
 -----------
  1 | 2 | 3 
```

## 🧠 The Algorithm: Minimax

The AI (`O`) uses a recursive strategy to find the optimal move:
- **Maximizing:** The computer tries to reach a state with a score of `+1` (Win).
- **Minimizing:** It assumes the human (`X`) will play perfectly to reach a score of `-1` (Loss).
- **Draw:** If no win is possible, it aims for a score of `0`.

The search tree explores every potential game state, making the AI's decision-making process flawless for a 3x3 grid.

## 🛠️ Project Structure

- `bin/tic_tac_toe_minmax.dart`: Contains the game loop, board state, and Minimax logic.
- `pubspec.yaml`: Project metadata and dependencies.
- `analysis_options.yaml`: Static analysis rules for clean Dart code.

## 🤝 Contributing

Found a bug or want to optimize the search with **Alpha-Beta Pruning**? 
1. Fork the repo.
2. Create your feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a Pull Request.

---
*Happy (and likely frustrating) gaming!*
