require_relative 'test_helper'
require './lib/jungle_beat'
require './lib/linked_list'
require './lib/node'

class JungleBeatTest < Minitest::Test

  def setup 
    @jb = JungleBeat.new
  end 

  def test_it_exists 
    assert_instance_of JungleBeat, @jb
  end 

  def test_list
    assert_instance_of LinkedList, @jb.list
    assert_nil @jb.list.head
  end 

  def test_append 
    @jb.append("deep doo ditt")

    assert_equal "deep", @jb.list.head.data
    assert_equal "doo", @jb.list.head.next_node.data
  end 

  def test_count
    @jb.append("deep doo ditt")
    assert_equal 3, @jb.count
    
    @jb.append("woo hoo shu")
    assert_equal 6, @jb.count
  end 
end 