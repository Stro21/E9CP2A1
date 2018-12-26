# This class use a random number from array to se if you can win
class Roulette
  attr_reader :random, :winner
  def initialize(random)
    @random = random
    @winner = random.sample
    roulette_history
  end

  def win(num)
    num == winner
  end

  def play(num)
    if win(num)
      add_winner(num)
    else
      puts 'No gano.'
    end
    @winner = random.sample
    roulette_history
  end

  def roulette_history
    File.open('roulette_history.txt', 'a') { |file| file.puts winner }
  end

  def add_winner(num)
    File.open('winners.txt', 'a') { |file| file.puts num }
  end
end

r = (1..10).to_a
roulette = Roulette.new(r)
roulette.play(1)
roulette.play(5)
roulette.play(7)
roulette.play(10)
