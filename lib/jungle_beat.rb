class JungleBeat
  attr_reader :list

  def initialize
     @list = LinkedList.new
  end

  def append(data)
    new_data = data.split(" ")

    new_data.each do |beat|
      @list.append(beat)
    end 
  end 

  def count
    @list.count
  end 
end