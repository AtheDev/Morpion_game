class Game

  attr_accessor :players_array,  :board

  def initialize
    @players_array = []
    @board = Board.new
  end

  def name
  #Permet de céer 2 joueurs et leur symbole.
    puts "Joueur 1, quel est ton nom?"
    name1 = gets.chomp

    puts "#{name1} choisi un symbole entre X et O?"
    symbol1 = gets.chomp.to_s

      while symbol1 != "X" && symbol1 != "O"
        puts "Fait attention choisi bien un des deux symboles soit la lettre x soit la lettre o en majuscule."
        symbol1 = gets.chomp.to_s
        if symbol1 == "X" && symbol1 == "O"
          break
        end
      end

    puts "#{name1} tu as choisi le symbole #{symbol1}."
    @players_array << Player.new(name1, symbol1)

    puts "Joueur 2, quel est ton nom?"
    name2 = gets.chomp

    if symbol1 == "X"
      symbol2 = "O"
    else
      symbol2 = "X"
    end

    puts "#{name2} tu auras le symbole #{symbol2}."
    @players_array << Player.new(name2, symbol2)
    puts "\n"
  end


  def select_player
  #Permet de faire jouer les joueur 1 par 1.
    while @board.row_win == false
      @players_array.each {|item| play_turn(item)}
    end
  end

  def play_turn(play)
    puts "\n"
    puts "#{play.name} à toi de jouer. Entre la case de ton choix (Exemple: a1, b3, c2...)"
    case_choice = gets.chomp

    while case_choice != "a1" && case_choice != "a2" && case_choice != "a3" && case_choice != "b1" && case_choice != "b2" && case_choice != "b3" && case_choice != "c1" && case_choice != "c2" && case_choice != "c3"
      puts "Veuillez rentrer une valeur existante."
      case_choice = gets.chomp
        if case_choice == "a1" && case_choice == "a2" && case_choice == "a3" && case_choice == "b1" && case_choice == "b2" && case_choice == "b3" && case_choice == "c1" && case_choice == "c2" && case_choice == "c3"
          break
        end
    end

    @board.write_on_case(case_choice, play.symbol)
    @board.show_board
    @board.victory?

    if @board.row_win == true
      puts "YOUPI!!! #{play.name} tu as gagné!!!"
      new_round
    elsif @board.game_draw == true
      puts "LOOSER!!! La partie se termine en nul."
      new_round
    end
  end


  def new_round
    puts "Si tu veux refaire une partie de Morpion tape '1' ! Sinon une autre touche. "
    new_game = gets.chomp

    if new_game == "1"
      Game.new.perform
    end
  end

  def perform
    name
    @board.show_board
    select_player
  end

end








