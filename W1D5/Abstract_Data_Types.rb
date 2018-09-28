class Stack
  def initialize
    @stack = []
  end

  def push(el)
    stack.push(el)
  end

  def pop
    stack.pop
  end

  def peek
    stack.last
  end

  private

  attr_accessor :stack
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    queue.push(el)
  end

  def dequeue
    queue.shift
  end

  def peek
    queue.first
  end

  private

  attr_accessor :queue
end

class Map

  def initialize
    @map = []
  end

  def set(key, value)
    match_index = map.index {|pair| pair.first == key}
    match_index.nil? ? map << [key, value] : map[match_index][1] = value
  end

  def get(key)
    match_index = map.index {|pair| pair.first == key}
    match_index.nil? ? nil : map[match_index][1]
  end

  def delete(key)
    match_index = map.index {|pair| pair.first == key}
    map.delete_at(match_index)
  end

  def show
    map
  end

  private

  attr_accessor :map
end
