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

  def test_append_creates_node_and_adds_to_head_if_head_is_nil    
    @list.append("doop")

    assert_instance_of Node, @list.head
    assert_equal nil, @list.head.next_node
  end

  def test_append_creates_node_and_adds_to_next_node_if_already_head
    @list.append("doop")
    @list.append("deep")

    assert_instance_of Node, @list.head.next_node
    assert_equal nil, @list.head.next_node.next_node
  end

  def test_linked_list_in_array
    @list.append("doop")
    @list.append("deep")

    assert_instance_of Node, @list.whole_list.first
    assert_instance_of Node, @list.whole_list.last
  end 

  def test_can_count_elements_in_list
    assert_equal 0, @list.count

    @list.append("random")

    assert_equal 1, @list.count

    @list.append("hello")

    assert_equal 2, @list.count
  end

  def test_can_generate_string_from_elements
    @list.append("doop")
    @list.append("hello")

    assert_equal "doop hello", @list.to_string
  end

  def test_can_prepend_list
    @list.append("doop")
    @list.append("hello")
    @list.prepend("bop")

    assert_equal "bop", @list.head.data
    assert_equal 3, @list.count
    assert_equal "bop doop hello", @list.to_string
  end

  def test_can_insert_into_list
    @list.append("doop")
    @list.append("hello")
    @list.prepend("bop")
    @list.insert(1, "woo")
    
    assert_equal "woo", @list.head.next_node.data
    assert_equal 4, @list.count
    assert_equal "bop woo doop hello", @list.to_string

    @list.insert(2, "bebop")

    assert_equal 5, @list.count
    assert_equal "bop woo bebop doop hello", @list.to_string
  end
end 