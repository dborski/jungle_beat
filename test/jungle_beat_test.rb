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
    assert_equal nil, @jb.list.head
  end 
end 