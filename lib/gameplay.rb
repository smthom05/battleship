class Gameplay


  def start
    greeting = "Welcome to BATTLESHIP\n Enter p to play. Enter q to quit. "
    p greeting
    user_input = gets.chomp
      if user_input == "p"
        setup
      elsif user_input == "q"
        p "You suck for not playing"
      else
        p "Please enter p or q"
        start
      end
  end

  def setup
    cpu_player_board
  end

  def cpu_player_board
    board = Board.new
    random_coordinates_sub = board.cells.keys.sample(2)
    random_coordinates_cruiser = board.cells.keys.sample(3)
    # board.validate(random_coordinates_sub)
    #   if board.validate(random_coordinates_sub) == true
    #     #game continues
    #   elsif board.validate(random_coordinates_sub) != true
    #     cpu_player_board
    #   end
    #
    # board.validate(random_coordinates_cruiser)
    #   if board.validate(random_coordinates_sub) == true
    #     #game continues
    #   elsif board.validate(random_coordinates_sub) != true
    #     cpu_player_board
    #   end



  end
end
