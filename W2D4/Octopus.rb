#Sluggish Octopus

def sluggish(fish_array)
  fish_array.each do |fish|
    return fish if fish_array.all? {|other_fish| other_fish.length <= fish.length}
  end
end

#Dominant Octopus

class Array
  #this should look familiar
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

def dominant(fish_array)
  fish_array_sorted = fish_array.merge_sort {|x, y| x <=> y} #obviously need to import over merge_sort

  fish_array_sorted.last
end

#Clever Octopus

def clever(fish_array)
  largest_fish = fish_array.first

  fish_array[1..-1].each do |other_fish|
    largest_fish = other_fish if other_fish.length > largest_fish.length
  end

  largest_fish
end

###########################

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, tiles_array)
  tiles_array.each_with_index do |tile, tile_idx|
    return tile_idx if dir == tile
  end

  nil
end

tiles_hash = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7 }

def fast_dance(dir, tiles_hash)
  tiles_hash[dir]
end
