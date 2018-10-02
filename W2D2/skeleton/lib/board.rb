require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0..5).each {|idx| 4.times {cups[idx] << :stone}}
    (7..12).each {|idx| 4.times {cups[idx] << :stone}}
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless [0..5, 7..12].include?(start_pos)
    raise "Starting cup is empty" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stone_count = cups[start_pos].length
    cups[start_pos] = []
    pos = start_pos

    until stone_count == 0
      pos += 1
      pos = 0 if pos > 13
      cups[pos] << :stone unless pos == (current_player_name == @name1 ? 13 : 6)
      stone_count -= 1
    end

    render
    sleep 2
    next_turn(pos, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == (current_player_name == @name1 ? 6 : 13)
      return :prompt
    elsif cups[ending_cup_idx].length > 1
      return ending_cup_idx
    else
      return :switch
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all? {|cup| cup.empty?} || cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    case cups[6] <=> cups[13]
    when -1
      return @name2
    when 0
      return :draw
    when 1
      return @name1
    end
  end
end
