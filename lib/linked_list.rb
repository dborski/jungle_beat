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