require_relative 'node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      current = @head
      current = current.next_node until current.next_node.nil?
      current.next_node = new_node
    end
  end

  def insert_at(value, index)
    new_node = Node.new(value)

    if index.zero?
      new_node.next_node = @head
      @head = new_node
      return
    end

    current = @head
    count = 0

    while current
      if count == index - 1
        new_node.next_node = current.next_node
        current.next_node = new_node
        return
      end

      count += 1
      current = current.next_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
  end

  def remove_at(index)
    return if @head.nil?

    if index.zero?
      @head = @head.next_node
      return
    end

    current = @head
    count = 0

    while current
      if count == index - 1
        if current.next_node.nil?
          puts 'Index out of bounds'
          return
        end

        current.next_node = current.next_node.next_node
        return
      end

      count += 1
      current = current.next_node
    end
  end

  def size
    count = 0
    current = @head
    while current
      count += 1
      current = current.next_node
    end
    count
  end

  def head
    @head.value
  end

  def tail
    current = @head
    return nil if current.nil?

    current = current.next_node until current.next_node.nil?
    current.value
  end

  def at(index)
    current = @head
    count = 0
    while current
      return current if count == index

      count += 1
      current = current.next_node
    end
    nil
  end

  def pop
    return nil if @head.nil?

    if @head.next_node.nil?
      @head = nil
      return
    end

    current = @head
    current = current.next_node until current.next_node.next_node.nil?
    current.next_node = nil
  end

  def contains?(value)
    current = @head
    while current
      return true if current.value == value

      current = current.next_node
    end
    false
  end

  def find(value)
    current = @head
    index = 0
    while current
      return index if current.value == value

      current = current.next_node
      index += 1
    end
    nil
  end

  def to_s
    current = @head
    result = ''
    while current
      result += "( #{current.value} ) -> "
      current = current.next_node
    end
    result += 'nil'
    result
  end
end
