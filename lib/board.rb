class Board

  attr_accessor :boardcase_array_hash, :row_win, :game_draw, :play_turn

  def initialize
    @A1 = BoardCase.new(" ","a1")
    @A2 = BoardCase.new(" ","a2")
    @A3 = BoardCase.new(" ","a3")
    @B1 = BoardCase.new(" ","b1")
    @B2 = BoardCase.new(" ","b2")
    @B3 = BoardCase.new(" ","b3")
    @C1 = BoardCase.new(" ","c1")
    @C2 = BoardCase.new(" ","c2")
    @C3 = BoardCase.new(" ","c3")

    @boardcase_array_hash = [@A1, @A2, @A3, @B1, @B2, @B3, @C1, @C2, @C3]
    @row_win = false
    @game_draw = false
  end

  def write_on_case (case_choice, play_symbol)
    #si case_choice correspond à un des item du tableau alors il y met le play_symbol.
    @boardcase_array_hash.map do |item|
      if item.value_case == case_choice
          item.string_symb = play_symbol
      else
        item
      end
    end
  end

  def show_board
    #Permet d'afficher le morpion.
    puts "Voici le plus beau des Morpions!!"
    puts  "="*50
    puts " "
    puts "            1   2   3"
    print "           "
    puts "-" * 11
    puts "        a | #{@A1.string_symb} | #{@A2.string_symb} | #{@A3.string_symb} |"
    print "           "
    puts "-" * 11
    puts "        b | #{@B1.string_symb} | #{@B2.string_symb} | #{@B3.string_symb} |"
    print "           "
    puts "-" * 11
    puts "        c | #{@C1.string_symb} | #{@C2.string_symb} | #{@C3.string_symb} |"
    print "           "
    puts "-" * 11
  end

  def victory?
    #Permet de mettre des conditions si il y a un gagnant pour que la partie se termine.
    if @A1.string_symb == "O" && @A2.string_symb == "O" && @A3.string_symb == "O" || @A1.string_symb == "X" && @A2.string_symb == "X" && @A3.string_symb == "X"
     @row_win = true
    end

    if @B1.string_symb == "O" && @B2.string_symb == "O" && @B3.string_symb == "O" || @B1.string_symb == "X" && @B2.string_symb == "X" && @B3.string_symb == "X"
     @row_win = true
    end

    if @C1.string_symb == "O" && @C2.string_symb == "O" && @C3.string_symb == "O" || @C1.string_symb == "X" && @C2.string_symb == "X" && @C3.string_symb == "X"
    @row_win = true
    end

    if @A1.string_symb == "O" && @B1.string_symb == "O" && @C1.string_symb == "O" || @A1.string_symb == "X" && @B1.string_symb == "X" && @C1.string_symb == "X"
     @row_win = true
    end

    if @A2.string_symb == "O" && @B2.string_symb == "O" && @C2.string_symb == "O" || @A2.string_symb == "X" && @B2.string_symb == "X" && @C2.string_symb == "X"
     @row_win = true
    end

    if @A3.string_symb == "O" && @B3.string_symb == "O" && @C3.string_symb == "O" || @A3.string_symb == "X" && @B3.string_symb == "X" && @C3.string_symb == "X"
     @row_win = true
    end

    if @A1.string_symb == "O" && @B2.string_symb == "O" && @C3.string_symb == "O" || @A1.string_symb == "X" && @B2.string_symb == "X" && @C3.string_symb == "X"
     @row_win = true
    end

    if @A3.string_symb == "O" && @B2.string_symb == "O" && @C1.string_symb == "O" || @A3.string_symb == "X" && @B2.string_symb == "X" && @C1.string_symb == "X"
     @row_win = true
    end
  end

  def draw
    #Permet de mettre une condition si la partie est nulle pour que la partie se termine.
    @boardcase_array_hash.each { |item| item.string_symb == /[:SPACE:]/ ? @game_draw = true : @game_draw = false }
  end

end