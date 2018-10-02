WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  
  ]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0 
  board.each do |symbol|
  if symbol == "X" or symbol == "O"
    counter += 1 
  end 
end
return counter
end

def current_player(board)
<<<<<<< HEAD
  if turn_count(board) == 0 
    return "X"
  elsif turn_count(board) % 2 == 0
    return "X"
  else 
=======
  if turn_count(board) % 2 
    return "X"
  elsif 
>>>>>>> 6160dfeea255e1fbf84e5618e40282765a3ed8cd
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if (board[win_combination[0]]==board[win_combination[1]] && board[win_combination[1]]==board[win_combination[2]])&& position_taken?(board,win_combination[0])
      return win_combination
    end
  end
  return false
end

def full?(board)
  if board.include?(" ") || board.include?(nil) 
    return false
  else
    return TRUE
  end
end

def draw?(board)
  if full?(board)
    if won?(board) == nil || won?(board) == false
      return true
    else
      return false
    end
  else
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board) || full?(board)
    return true
  else
    return false
  end
end
def winner(board)
  if won?(board) != false
    return board[won?(board)[0]]
  else
    return nil
  end
end