input = File.read("input.txt").split("\n")

bingo_numbers = input.first
nums = bingo_numbers.split(",")

bingo_boards = input[1..-1]

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

def call_a_number(nums, board)
  
  board_one = get_first_bingo_board(board).map {|str| str.split(" ")}
  board_two = get_second_bingo_board(board).map {|str| str.split(" ")}
  board_three = get_third_bingo_board(board).map {|str| str.split(" ")}

  boards = [board_one, board_two, board_three]

    nums.each do |num|
      boards.each do |board|
        board = board.reduce([]) do |new_board, arr|
          if arr.include?(num.to_s)
            new_arr = arr - [num.to_s] 
            idx = board.index(arr)
            board[idx] = new_arr
            new_board = board
            
            if board.any? {|b| b.empty? }
              return [num, board]
            end
          end
        end
      end
  end
end

board_one = get_first_bingo_board(bingo_boards).map {|str| str.split(" ")}
board_two = get_second_bingo_board(bingo_boards).map {|str| str.split(" ")}
board_three = get_third_bingo_board(bingo_boards).map {|str| str.split(" ")}

boards = [board_one, board_two, board_three]

def calculate_final_score(nums, bingo_boards)
  winner = call_a_number(nums, bingo_boards)
  multiplier = winner.first.to_i
  sum = winner.last.reject {|w| w.empty? }.reduce(0) do |total, arr|
    total += arr.map {|n| n.to_i }.reduce(:+)
    total
  end
  multiplier * sum
end

p calculate_final_score(nums, bingo_boards)

# p check_boards(boards, bingo_boards, nums)