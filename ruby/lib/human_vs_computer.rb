module HumanVsComputer

  def human_vs_computer_input
    puts "Player 1, enter Name"
    name = gets.strip
    puts "#{name} Select your symbol: 'X' or 'O'"
    input = gets.strip
    puts "#{name} vs Bob the Computer"
    display_board
  end

end
