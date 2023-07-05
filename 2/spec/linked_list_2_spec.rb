require './linked_list_2'

describe LinkedList do
  describe 'Linked List tests' do
    before do
      @linked_list = LinkedList.new('This is the head')
    end

    it 'creates a linked list with the provided value as the head node' do
      expect(@linked_list.head.value).to eql('This is the head')
    end

    it 'appends a node to the linked list and updates the tail node correctly' do
      @linked_list.append('This is the appended node 1')
      @linked_list.append('This is the appended node 2')
      @linked_list.append('This is the appended node 3')
      expect(@linked_list.head.next_node.next_node.next_node.value).to eql('This is the appended node 3')
    end

    it 'prepends a node to the linked list and updates the head node correctly' do

      @linked_list.prepend('This is the prepended node 1')
      @linked_list.prepend('This is the prepended node 2')
      @linked_list.prepend('This is the prepended node 3')
      expect(@linked_list.head.value).to eql('This is the prepended node 3')
    end

    it 'returns the correct size of the linked list' do
      @linked_list.append('append')
      @linked_list.prepend('prepend')
      expect(@linked_list.size).to eql(3)
    end

    it 'retrieves the head node correctly' do
      expect(@linked_list.head.value).to eql('This is the head')
    end

    it 'retrieves the head node correctly' do
      @linked_list.append('append 1')
      @linked_list.prepend('prepend 1')
      @linked_list.append('append 2')
      @linked_list.prepend('prepend 2')
      @linked_list.append('This is the tail')
    end

    it 'retrieves the node at the specified index' do
      @linked_list.append('append 1')
      @linked_list.prepend('prepend 1')
      @linked_list.append('append 2')
      @linked_list.prepend('prepend 2')
      @linked_list.append('This is the tail')
      expect(@linked_list.index_at(3).value).to eql('append 1')
    end

    it 'pops the tail node and updates the tail node correctly' do
      @linked_list.append('append 1')
      @linked_list.prepend('prepend 1')
      @linked_list.append('append 2')
      @linked_list.prepend('prepend 2')
      @linked_list.append('This is the tail')
      expect(@linked_list.tail_node.value).to eql('This is the tail')
      @linked_list.pop
      expect(@linked_list.tail_node.value).to eql('append 2')
      @linked_list.pop
      expect(@linked_list.tail_node.value).to eql('append 1')
    end

    it 'checks if the value is contained in the linked list' do
      @linked_list.append('append 1')
      @linked_list.prepend('prepend 1')
      @linked_list.append('append 2')
      @linked_list.prepend('prepend 2')
      @linked_list.append('This is the tail')
      expect(@linked_list.contains('prepend 1')).to eql(true)
      expect(@linked_list.contains('This is the tail')).to eql(true)
      @linked_list.pop
      expect(@linked_list.contains('This is the tail')).to eql(false)
    end

    it 'returns the index of a value in the linked list' do
      @linked_list.append('append 1')
      @linked_list.prepend('prepend 1')
      @linked_list.append('append 2')
      @linked_list.prepend('prepend 2')
      @linked_list.append('This is the tail')
      expect(@linked_list.find('prepend 1')).to eql(1)
      expect(@linked_list.find('append 2')).to eql(4)
      expect(@linked_list.find('not included')).to eql(nil)

    end

    it 'converts the linked list to a string representation' do
      @linked_list.append('append 1')
      @linked_list.prepend('prepend 1')
      @linked_list.append('append 2')
      @linked_list.prepend('prepend 2')
      @linked_list.append('This is the tail')
      expect(@linked_list.to_s).to eql('( prepend 2 ) -> ( prepend 1 ) -> ( This is the head ) -> ( append 1 ) -> ( append 2 ) -> ( This is the tail )')
    end

    it 'inserts a node at the specified index and updates the linked list correctly' do
      @linked_list.append('append 1')
      @linked_list.prepend('prepend 1')
      @linked_list.append('append 2')
      @linked_list.prepend('prepend 2')
      @linked_list.append('This is the tail')
      @linked_list.insert_at('This is the inserted node 1', 4)
      expect(@linked_list.find('This is the inserted node 1')).to eql(4)
      @linked_list.insert_at('This is the inserted node 2', 2)
      expect(@linked_list.find('This is the inserted node 2')).to eql(2)
    end

    it 'removes a node at the specified index and updates the linked list correctly' do
      @linked_list.append('append 1')
      @linked_list.prepend('prepend 1')
      @linked_list.append('append 2')
      @linked_list.prepend('prepend 2')
      @linked_list.append('This is the tail')
      @linked_list.insert_at('This is the inserted node 1', 4)
      expect(@linked_list.find('This is the inserted node 1')).to eql(4)
      expect(@linked_list.index_at(4).value).to eql('This is the inserted node 1')
      @linked_list.remove_at(4)
      expect(@linked_list.find('append 2')).to eql(4)
    end

    it 'returns the list of values in the linked list' do
      @linked_list.append('append 1')
      @linked_list.prepend('prepend 1')
      @linked_list.append('append 2')
      @linked_list.prepend('prepend 2')
      @linked_list.append('This is the tail')
      @linked_list.insert_at('This is the inserted node 1', 4)
      expect(@linked_list.list_values).to eql(["prepend 2", "prepend 1", "This is the head", "append 1", "This is the inserted node 1", "append 2", "This is the tail"])
    end
  end
end
