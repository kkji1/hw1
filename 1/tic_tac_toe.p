import random
from random import randint

board = list("-" * 9)

def draw_board(board):
    for i in range(0, 3):
        print("|", board[0 + i * 3], "|", board[1 + i * 3], "|", board[2 + i * 3], "|")
        print(" ")

def get_player_move(board):
    symbol = "Х"
    print("Ты играешь за Х")
    while True:
        move = int(input("Куда ходишь? Введите число от 1 до 9, чтобы походить: "))
        if move >= 1 and move <= 9:
            if (board[move - 1] != "О") and (board[move - 1] != "Х"):
                board[move - 1] = symbol
                break
            else:
                print("Эта клеточка уже занята. Попробуйте еще раз.")
        else:
            print("Некорректный ход. Попробуйте еще раз.")

def get_computer_move(board):
    print("Мой ход!")
    comp_symbol = "О"
    while True:
        comp_move = randint(1, 9)
        if (board[comp_move - 1] != "О") and (board[comp_move - 1] != "Х"):
            board[comp_move - 1] = comp_symbol
            break

def check_win(board):
    win_resepie = [(1, 2, 3), (4, 5, 6), (7, 8, 9), (1, 4, 7), (2, 5, 8), (3, 6, 9), (1, 5, 9), (3, 5, 7)]
    for each in win_resepie:
        if board[each[0] - 1] == board[each[1] - 1] == board[each[2] - 1] == "Х":
            return 1
        elif board[each[0] - 1] == board[each[1] - 1] == board[each[2] - 1] == "О":
            return 2
    return 3

def main(board):
    count = 0
    win = False
    while True:
        draw_board(board)
        if count % 2 == 0:
            get_player_move(board)
        else:
            get_computer_move(board)
        count += 1
        if count > 4:
            res = check_win(board)
            if res == 1:
                draw_board(board)
                print("Ты выйграл!")
                break
            elif res == 2:
                draw_board(board)
                print("Ты проиграл =.=")
                break
        if count == 9:
            print("Ничья!")
            break

def review(board):
    board = list(range(1,10))
    for i in range(0,3):
        print ("|", board[0+i*3], "|", board[1+i*3], "|", board[2+i*3], "|")
        print(" ")
