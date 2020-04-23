class BoardCase
#TO DO : la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), ainsi que son identifiant de case
    attr_accessor :string_symb, :value_case

    def initialize(string_symb, value_case)
    #Permet de régler sa valeur, ainsi que son numéro de case
      @string_symb = string_symb
      @value_case = value_case
    end

end

