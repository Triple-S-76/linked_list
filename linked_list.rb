# frozen_string_literal: true

# the Node class is to create a new node to add to the Linked List
class Node
  attr_accessor :next_node
  attr_reader :value

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

# the LinkedList class is for the entire linked list
class LinkedList
  attr_accessor :head, :next_node
  attr_reader :value

  def initialize(new_node = nil)
    @head = Node.new(new_node)
  end

  def prepend(node_value)
    new_node = Node.new(node_value)
    if head.value.nil?
      empty_list(new_node)
    else
      new_node.next_node = head
      self.head = new_node
    end
  end

  def append(node_value)
    new_node = Node.new(node_value)
    if head.value.nil?
      empty_list(new_node)
    else
      last_node = tail
      last_node.next_node = new_node
    end
  end

  def empty_list(node)
    self.head = node
  end

  def tail(value = head)
    return value if value.next_node.nil?

    tail(value.next_node)
  end

  def size(node = head, count = 1)
    return 0 if head.value.nil?

    return count if node.next_node.nil?

    count += 1
    size(node.next_node, count)
  end

  def at(index)
    if index.zero?
      return head
    elsif index > size
      return 'There are not that many elements in the list'
    end

    node = head
    index.times do
      node = node.next_node
    end
    node
  end

  def pop
    second_to_last_node = at(size - 2)
    second_to_last_node.next_node = nil
  end

  def contains(value)
    list = head
    size.times do
      return true if list.value == value

      list = list.next_node
    end
    false
  end

  def find(value)
    index = 0
    list = head
    size.times do
      return index if list.value == value

      index += 1
      list = list.next_node
    end
    nil
  end

  def to_s
    return nil if head.value.nil?

    concatenation_of_values
  end

  def concatenation_of_values
    return "( #{head.value} ) -> nil" if size(head) == 1

    list = head
    sentence = "( #{list.value} )"
    list = list.next_node

    (size - 2).times do
      sentence += " -> ( #{list.value} )"
      list = list.next_node
    end
    sentence += " -> ( #{list.value} ) -> nil"
  end

  def insert_at(value, index)
    new_node = Node.new(value)
    return prepend(value) if index.zero?

    return append(value) if index == size

    insert_too_many(index - size) if index > size

    list = head
    (index - 1).times do
      list = list.next_node
    end
    new_node.next_node = list.next_node
    list.next_node = new_node
  end

  def insert_too_many(amount_over)
    amount_over.times do
      empty_node = Node.new
      append(empty_node)
    end
  end

  def remove_at(index)
    first_node = head
    second_node = head.next_node
    if index.zero?
      self.head = second_node
    else
      (index - 1).times do
        first_node = second_node
        second_node = second_node.next_node
      end
      first_node.next_node = second_node.next_node
    end
  end
end

node_info1 = 'String 1'
node_info2 = 'String 2'
node_info3 = 'String 3'
node_info4 = 'String 4'
node_info5 = 'String 5'

test = LinkedList.new
p test.size

test.append(node_info4)
test.append(node_info5)
puts test

test.prepend(node_info2)
puts test

test.prepend(node_info1)
puts test

puts test.size

p test.at(2)

p test.head
p test.tail

p test.pop

p test.tail
puts test

p test.contains(node_info2)

p test.find(node_info4)
puts test

test.insert_at("NEW INFO", 1)
puts test

test.remove_at(1)
puts test

test.insert_at(node_info3, 2)
puts test

test.insert_at(node_info5, 4)
puts test
