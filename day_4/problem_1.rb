input = File.read("input.txt").split("\n")

bingo_numbers = input.first

bingo_boards = input[1..-1]

p "These are all the boards:"
p bingo_boards

def get_first_bingo_board(boards)
  boards[1..5]
end

def get_second_bingo_board(boards)
  boards[7..11]
end

def get_third_bingo_board(boards)
  boards[13..-1]
end

def get_rows(board)
  rows = board.map {|r| r.split(" ")}
end

def get_columns(board)
  rows = get_rows(board)
  columns = []

  5.times do |idx|
    rows.each do |row|
      columns << row[idx]
    end
  end

  column_1 = columns[0..4]
  column_2 = columns[5..9]
  column_3 = columns[10..14]
  column_4 = columns[15..19]
  column_5 = columns[20..24]

  columns = [column_1, column_2, column_3, column_4, column_5]
end

def call_a_number(num, board)
  # the idea here is to pass in the number called
  # and then delete any instance of that number from every board
  # so suppose num = 22
  # we need to remove 22 from every board
  # the boards themselves are arrays or strings, so I can gsub out the num on those
  # and then call get_rows and get_columns to check if there are any that are EMPTY
  # that's the win condition
  
  p "Here is the first board before anything happens:"
  p get_first_bingo_board(board)
  # remove num from first bingo board:
  # OKAY THIS WORKS
  new_first_board = get_first_bingo_board(board).map {|str| str.split(" ")}.map do |arr|
    arr = arr - [num.to_s] if arr.include?(num.to_s)
    arr
  end
#   new_second_board = get_second_bingo_board(board).map {|str| str.gsub(/num/, "")}
#   new_third_board = get_third_bingo_board(board).map {|str| str.gsub(/num/, "")}
  p "And here is that same board after num is removed:"
  p new_first_board
end

# p "Here is the first bingo board:"
# p get_first_bingo_board(bingo_boards)

# p "Here is the second bingo board:"
# p get_second_bingo_board(bingo_boards)

# p "Here is the third bingo board:"
# p get_third_bingo_board(bingo_boards)

# p "Here are the rows of the first board:"
# p get_rows(get_first_bingo_board(bingo_boards))

# p "Here are the columns of the first board:"
# p get_columns(get_first_bingo_board(bingo_boards))

call_a_number(22, bingo_boards)