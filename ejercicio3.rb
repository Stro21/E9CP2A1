# This class use a random number from array to se if you can win
class Roulette
  attr_reader :random, :winner
  def initialize(random)
    @random = random
    @winner = random.sample
  end

  def win(num)
    num == winner
  end
end

r = (1..10).to_a
roulette = Roulette.new(r)
puts roulette.win(4)
