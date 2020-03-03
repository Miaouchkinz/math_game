class Player
  attr_accessor :score, :name

  def initialize(name)
    @score = 3
    @name = name
  end

  def lost?
    @score <= 0
  end

end