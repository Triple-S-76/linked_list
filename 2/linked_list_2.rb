require 'pry-byebug'

# Main list
class LinkedList
  attr_accessor :head

  def initialize(data = nil)
    @head = Node.new(data)
  end

  def list_values
    array = [head.value]
    current_node = head

    until current_node.next_node.nil?
      current_node = current_node.next_node
      array << current_node.value
    end
    array

  end

  def append(data)
    new_node = Node.new(data)
    current_node = head
    if head.value.nil?
      head.value = data
    else
      current_node = current_node.next_node until current_node.next_node.nil?
      current_node.next_node = new_node
    end
  end

  def prepend(data)
    new_node = Node.new(data)
    if head.value.nil?
      self.head = new_node
      return
    end
    new_node.next_node = head
    self.head = new_node
  end

  def size
    count = 0
    current = head
    until current.nil?
      count += 1
      current = current.next_node
    end
    # p count == 1 ? 'There is 1 node in the tree.' : "There are #{count} nodes in the tree."
    count
  end

  def head_node
    head
  end

  def tail_node
    current = head
    current = current.next_node until current.next_node.nil?
    current
  end

  def index_at(index)
    count = 0
    current = head
    until count == index
      current = current.next_node
      count += 1
      return nil if current.nil?
    end
    current
  end

  def pop
    current = head
    current = current.next_node until current.next_node.next_node.nil?
    popped = current.next_node
    current.next_node = nil
    popped
  end

  def contains(data)
    current = head
    until current.nil?
      # p "#{data} is in the tree." if current.value == data
      return true if current.value == data

      current = current.next_node
    end
    # p "#{data} is not in the tree."
    false
  end

  def find(data)
    count = 0
    current = head
    until current.nil?
      return count if current.value == data

      count += 1
      current = current.next_node
    end
  end

  def to_s
    string = ''
    current = head
    until current.nil?
      string << ' -> ' if current != head
      string << "( #{current.value} )"
      current = current.next_node
    end
    string
  end

  def insert_at(data, index)
    new_node = Node.new(data)
    if index.zero?
      new_node.next_node = head
      self.head = new_node
    else
      count = 1
      current = head
      until count == index || current.next_node.nil?
        current = current.next_node
        count += 1
      end
      new_node.next_node = current.next_node
      current.next_node = new_node
    end
  end

  def remove_at(index)
    return p "There is no node at index: #{index}." if index + 1 > size

    if index.zero?
      self.head = head.next_node
    else
      count = 0
      current = head
      until count == index - 1
        current = current.next_node
        count += 1
      end
      current.next_node = current.next_node.next_node
    end
  end

end

# Node creator
class Node
  attr_accessor :value, :next_node

  def initialize(data = nil)
    @value = data
    @next_node = nil
  end
end
