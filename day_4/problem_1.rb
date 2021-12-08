input = File.read("input.txt").split("\n")

bingo_numbers = input.first
nums = bingo_numbers.split(",")

bingo_boards = input[1..-1]

# p "These are all the boards:"
# p bingo_boards

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
  # the idea here is to pass in the number called
  # and then delete any instance of that number from every board
  # so suppose num = 22
  # we need to remove 22 from every board
  # the boards themselves are arrays or strings, so I can gsub out the num on those
  # and then call get_rows and get_columns to check if there are any that are EMPTY
  # that's the win condition
#   nums = nums.map {|n| n.to_i }
  
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
            # p board
            if board.any? {|b| b.empty? }
            #   p board.find {|bd| bd.last == board.last}
            #   puts "WE FOUND IT"
            #   puts "IT'S THIS BOARD: #{board}"
              return [num, board]
              # COOL SO THIS WILL RETURN THE UPDATED BOARD
              # NOW I HAVE TO PAIR IT WITH THE ONE IT CAME FROM
            end
            board
          end
        end
      end
    # p board
    # end
    # p board
    # p board.length
    # p get_rows(board)
    # p get_rows(board).any? {|b| b.empty? }
  end
    
#   until boards.any? {|board| board.any? {|b| b.empty?} }
#     nums.each do |num|
#         new_boards = boards.each do |board|
#             board.map do |arr|
#               arr = arr - [num.to_s] if arr.include?(num.to_s)
#               arr
#             end
#         end
#     end
#   end
      
    
  
#   p "Here is the first board before anything happens:"
#   p get_first_bingo_board(board).map {|str| str.split(" ")}
#   # remove num from first bingo board:
#   # OKAY THIS WORKS
#   new_first_board = get_first_bingo_board(board).map {|str| str.split(" ")}.map do |arr|
#     arr = arr - [num.to_s] if arr.include?(num.to_s)
#     arr
#   end
# #   new_second_board = get_second_bingo_board(board).map {|str| str.gsub(/num/, "")}
# #   new_third_board = get_third_bingo_board(board).map {|str| str.gsub(/num/, "")}
#   p "And here is that same board after num is removed:"
#   p new_first_board
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

# nums = [22, 13, 17, 11, 0]
# p bingo_boards

# p get_first_bingo_board(bingo_boards).map {|str| str.split(" ")}
# p get_second_bingo_board(bingo_boards).map {|str| str.split(" ")}
# p get_third_bingo_board(bingo_boards).map {|str| str.split(" ")}

board_one = get_first_bingo_board(bingo_boards).map {|str| str.split(" ")}
board_two = get_second_bingo_board(bingo_boards).map {|str| str.split(" ")}
board_three = get_third_bingo_board(bingo_boards).map {|str| str.split(" ")}

boards = [board_one, board_two, board_three]

p "This is the winner: "
p call_a_number(nums, bingo_boards)

# def check_boards(formatted_boards, bingo_boards, nums)
#   winner = formatted_boards.find {|board| board.last == call_a_number(nums, bingo_boards).last}
#   # NOW I HAVE TO RECOVER WHICH ROW OR COLUMN WON
#   new_nums = winner.find {|w| w.all? {|n| nums.include?(n.to_i)}}
# end

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