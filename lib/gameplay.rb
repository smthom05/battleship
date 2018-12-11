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
    p "Game Plays"

  end
end
