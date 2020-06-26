class LinkedList
  attr_reader :head

  def initialize
    @head = nil 
  end

  def append(data)
    if !@head
      @head = Node.new(data)
    else 
      current_node = @head
      while current_node.next_node
        current_node = current_node.next_node
      end 
      current_node.add_next_node(data)
    end 
  end

  def prepend(data)
    current_node = @head
    new_node = Node.new(data)

    @head = new_node
    new_node.next_node = current_node
  end 

  def insert_index_one(new_index, new_data)
    current_node = @head
    old_node = current_node.next_node
    
    current_node.add_next_node(new_data)
    current_node.next_node.next_node = old_node
  end 

  def insert_past_index_one(new_index, new_data)
    current_node = @head

    index = 1
    while current_node.next_node
      current_node = current_node.next_node
      break if index == new_index - 1
      index += 1 
    end 
    old_node = current_node.next_node
    current_node.add_next_node(new_data)
    current_node.next_node.next_node = old_node
  end 

  def insert(new_index, new_data)
   return prepend(new_data) if new_index < 1
   return insert_index_one(new_index, new_data) if new_index == 1
   return insert_past_index_one(new_index, new_data)
  end 

  def whole_list
    elements = []
    current_node = @head
    while current_node.next_node
      elements << current_node
      current_node = current_node.next_node
    end 
    elements << current_node
  end

  def find(find_index, count)
    nodes = []
    whole_list.each_with_index do |node, index|
      nodes << node if find_index == index || (index > find_index && (index < (find_index + count)))
    end
    nodes.map { |node| node.data.to_s }.join(" ") 
  end 

  def includes?(data)
    whole_list.any? { |node| node.data == data }
  end 

  def count
    return 0 if !@head
    whole_list.count
  end

  def to_string
    whole_list.map { |node| node.data.to_s }.join(" ")
  end

  def pop
    current_node = @head
    while current_node.next_node
      current_node = current_node.next_node
      break if !current_node.next_node.next_node
    end 
    current_node.next_node = nil
  end 
end