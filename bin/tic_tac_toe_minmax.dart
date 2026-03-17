import 'dart:io';
import 'dart:math';

List<List<String>> board = [
  [' ', ' ', ' '],
  [' ', ' ', ' '],
  [' ', ' ', ' '],
];

Map<int, List<int>> m = {
  7: [0, 0],
  8: [0, 1],
  9: [0, 2],
  4: [1, 0],
  5: [1, 1],
  6: [1, 2],
  1: [2, 0],
  2: [2, 1],
  3: [2, 2],
};

List<List<int>> checks = [
  [7, 8, 9],
  [4, 5, 6],
  [1, 2, 3],
  [1, 5, 9],
  [7, 5, 3],
  [7, 4, 1],
  [8, 5, 2],
  [9, 6, 3],
];

String checker(List<List<String>> board) {
  for (int i = 0; i < 8; i++) {
    List<int> c = checks[i];
    if (board[m[c[0]]![0]][m[c[0]]![1]] == board[m[c[1]]![0]][m[c[1]]![1]] &&
        board[m[c[1]]![0]][m[c[1]]![1]] == board[m[c[2]]![0]][m[c[2]]![1]]) {
      if (board[m[c[0]]![0]][m[c[0]]![1]] == 'X') {
        return 'human';
      } else if (board[m[c[0]]![0]][m[c[0]]![1]] == 'O') {
        return 'computer';
      }
    }
  }
  if (!exhaused(board)) {
    return 'noone';
  } else
    return 'draw';
}

bool exhaused(List<List<String>> board) {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[i][j] == " ") return false;
    }
  }
  return true;
}

void printBoard(List<List<String>> a) {
  print("""
   ${a[0][0]} | ${a[0][1]} | ${a[0][2]}
  -----------
   ${a[1][0]} | ${a[1][1]} | ${a[1][2]}
  -----------
   ${a[2][0]} | ${a[2][1]} | ${a[2][2]}
  """);
}

int op_row = -1;
int op_col = -1;
List<List<int>> op_res = [];

int solve1(List<List<String>> b, bool computerTurn, bool initital) {
  if (checker(b) == 'noone' && !exhaused(b)) {
    List<List<int>> res = [];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (b[i][j] == " ") {
          if (computerTurn) {
            b[i][j] = 'O';
            int result = solve1(b, !computerTurn, false);
            res.add([i, j, result]);
            b[i][j] = ' ';
          } else {
            b[i][j] = 'X';
            int result = solve1(b, !computerTurn, false);
            res.add([i, j, result]);
            b[i][j] = ' ';
          }
        }
      }
    }
    if (computerTurn) {
      int optimal_row = -1;
      int optimal_col = -1;
      int max_score = -1000;
      for (int i = 0; i < res.length; i++) {
        if (res[i][2] > max_score) {
          optimal_col = res[i][1];
          optimal_row = res[i][0];
          max_score = res[i][2];
        }
      }
      if (initital) {
        op_row = optimal_row;
        op_col = optimal_col;
        op_res = res;
      }
      return max_score;
    } else {
      int optimal_row = -1;
      int optimal_col = -1;
      int max_score = 1000; // this is actually min_score
      for (int i = 0; i < res.length; i++) {
        if (res[i][2] < max_score) {
          optimal_col = res[i][1];
          optimal_row = res[i][0];
          max_score = res[i][2];
        }
      }
      return max_score;
    }
  } else if (checker(b) == 'human') {
    return -1;
  } else if (checker(b) == 'computer') {
    return 1;
  } else if (exhaused(b) && checker(b) == 'noone') {
    return 0;
  }
  return 0;
}

void resetBoard(List<List<String>> board) {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      board[i][j] = ' ';
    }
  }
}

int get_input() {
  int n = -1;
  while (true) {
    print("Enter a number(1-9): ");
    String a = stdin.readLineSync() ?? "";
    n = int.tryParse(a) ?? -1;
    if (n == -1 || n > 9 || n < 1) {
      a = "";
      continue;
    } else {
      break;
    }
  }
  return n;
}

void main() {
  printBoard(board);
  print("You are X\nComputer is O");

  bool humanTurn = true;
  while (true) {
    // highest level loop;
    while (checker(board) == 'noone') {
      //loop for single game;
      if (humanTurn) {
        print('Your turn.');
        int n = get_input();
        while (board[m[n]![0]][m[n]![1]] != ' ') {
          print('Input Invalid. choose again.');
          n = get_input();
        }
        board[m[n]![0]][m[n]![1]] = 'X';
        printBoard(board);
        humanTurn = false;
      } else {
        // print('solving board');
        solve1(board, true, true);
        board[op_row][op_col] = 'O';
        // print(op_row);
        // print(op_col);
        printBoard(board);
        humanTurn = true;
      }
    }
    if (checker(board) == 'computer') {
      print("I win!");
      humanTurn = false;
    } else if (checker(board) == 'human') {
      print("You win!");
      humanTurn = true;
    } else if (checker(board) == 'draw') {
      print("Its a Draw!");
    }
    resetBoard(board);
    printBoard(board);
    print("Do you wanna continue?");
    String? d = stdin.readLineSync();
    if (d != "") {
      break;
    }
  }
}
