#Build a dynamic board based on user's input

class BoardBuilder

  attr_accessor :board_size

  def initialize(board_size)
    @board_size = board_size
    # self.build_board
  end

  def self.print_pipe(space)
     print " #{space}| "
   end

  def self.print_row_divider
    print "--"
  end

   def self.display_board(board_size)
     @board = Board.new(board_size)

     @board_size = board_size

     index = 0
     row = 0
     while row < @board_size do
       column = 0
       row_line = 0
       while column < @board_size && index < @board.spaces.length do
          space = @board.spaces[index]
          print_pipe(space)
          if column == @board_size - 1
            puts "\n"
          end
          index += 1
          column += 1
      end


        if row < @board_size -1
          while row_line < @board_size  do
            print_row_divider
            row_line += 1
            if row_line == @board_size
               puts "\n"
            end
          end
        end
        row += 1
     end
     end


   def self.calculate_amount_board_spaces(board_size)
     spaces_amount = board_size ** 2
     Array.new(spaces_amount) {|i| i+1 }
   end
 end
