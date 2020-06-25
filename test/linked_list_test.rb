require_relative 'test_helper'
require './lib/linked_list'
require './lib/node'

class LinkedListTest < Minitest::Test

  def setup 
    @list = LinkedList.new
  end 

  def test_it_exists 
    assert_instance_of LinkedList, @list
  end

  def test_head_is_nil_by_default
    assert_equal nil, @list.head
  end

  def test_append_creates_node_and_adds_to_head
    
    assert_equal "doop", @list.append("doop")
    assert_instance_of Node, @list.head
    assert_equal nil, @list.head.next_node
  end
end 