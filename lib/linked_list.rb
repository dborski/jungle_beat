class LinkedList
  attr_reader :head

  def initialize
    @head = nil 
  end

  def append(data)
    @head = Node.new(data) if !@head
    data
  end

  def count
    return 0 if !@head
    return 1 if @head 
  end
  
end