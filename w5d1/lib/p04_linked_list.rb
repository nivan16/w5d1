class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
include Enumerable
attr_accessor :head, :tail
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    return @head.next == @tail
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    node = Node.new(key, val)
    queue = [@head]
    until queue.empty?
      c_node = queue.shift
      if c_node.next != @tail
        queue << c_node.next       
      else
        node.prev = c_node
        node.next = @tail
        @tail.prev = node
        c_node.next = node
      end
    end
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each(&prc)
    vals = []
    queue = [@head]
     until queue.empty? || queue.first.val == nil
      c_node = queue.shift
      yield prc.call(c_node.val)
      queue << c_node.next      
    end
    vals
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
