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

  def insert(new_index, new_data)
    current_node = @head
    
    if new_index < 1
      prepend(new_data)
    elsif new_index == 1
      current_node = @head
      old_node = current_node.next_node
      current_node.add_next_node(new_data)
      current_node.next_node.next_node = old_node
    else 
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

  def count
    return 0 if !@head
    whole_list.count
  end

  def to_string
    whole_list.map { |node| node.data.to_s }.join(" ")
  end
end