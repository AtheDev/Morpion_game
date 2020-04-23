class Player

#TO DO : la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), ainsi que son identifiant de case
  attr_accessor :name, :symbol

  def initialize(name, symbol)
  #Permet de  régler sa valeur, ainsi que son numéro de case
    @name = name
    @symbol = symbol
  end

end