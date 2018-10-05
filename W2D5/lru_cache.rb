class LRUCache

  attr_accessor :cache, :size
  def initialize(size)
    @cache = []
    @size = size
  end

  def count
    # returns number of elements currently in cache
    cache.count
  end

  def add(el)
    # adds element to cache according to LRU principle
    if cache.include?(el)
      cache.delete(el)
    end

    if count == size
      cache.shift
      cache.push(el)
    else
      cache.push(el)
    end
  end

  def show
    # shows the items in the cache, with the LRU item first
    cache
  end

  private
  # helper methods go here!

end
