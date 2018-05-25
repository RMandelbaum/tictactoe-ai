require_relative "user_input"

class BoardBuilder

  def initialize
    @board_size = UserInput.get_board_type
    self.build_board
  end

  def print_pipe
     print "  |  "
   end

  def print_row_divider
    print "-----"
  end

   def build_board
     row = 0
     while row < @board_size do
       column = 0
       row_line = 0
       while column < @board_size - 1 do
         self.print_pipe
         column += 1
         if column == @board_size - 1
           puts "\n"
         end
       end
       puts "\n"
       if row < @board_size - 1
         while row_line < @board_size do
           self.print_row_divider
           row_line += 1
           if row_line == @board_size
             puts "\n"
           end
         end
       end
       row += 1
     end

   end

 end
