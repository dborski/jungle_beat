require_relative 'test_helper'
require './lib/node'

class NodeTest < Minitest::Test

  def setup
    @node = Node.new("plop")
  end

  def test_it_exists
    assert_instance_of Node, @node
  end

  def test_it_has_readable_attributes
    assert_equal "plop", @node.data
  end

  def test_next_node_is_nil
    assert_nil @node.next_node
  end

  def test_can_add_new_node
    @node.add_next_node("deep")
    assert_instance_of Node, @node.next_node
  end
end 

