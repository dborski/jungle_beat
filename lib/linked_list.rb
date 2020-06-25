class LinkedList
  attr_reader :head

  def initialize
    @head = nil 
  end

  def append(data)
    if !@head
      @head = Node.new(data)
    else 
      @head.add_next_node(data)
    end 
    data
  end

  def count
    return 0 if !@head
    return 1 if @head 
  end

  def to_string
    @head.data.to_s
  end
end