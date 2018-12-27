# rubocop:disable LineLength
# rubocop:disable AbcSize
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

  def most_winning_number
    winners = []
    data = File.open('roulette_history.txt', 'r') { |file| file.readlines.map(&:chomp) }
    data.each { |d| winners.push(d.to_i) }
    hash = winners.group_by(&:itself).map { |k, v| [k, v.count] }.to_h
    repeat = 0
    hash.each { |k, v| repeat = k if v == hash.values.max }
    puts repeat
  end
end

r = (1..10).to_a
roulette = Roulette.new(r)
roulette.play(1)
roulette.play(5)
roulette.play(7)
roulette.play(10)
roulette.most_winning_number

# rubocop:enable LineLength
# rubocop:enable AbcSize
