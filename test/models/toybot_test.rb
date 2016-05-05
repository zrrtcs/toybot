require 'test_helper'

class ToybotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @tb = Toybot.create
  end
  
  test "Toybot must have an original placement" do
    @tb.placement 1, 2, "NORTH"
    refute_nil @tb.pos_x
    refute_nil @tb.pos_y
    byebug
    refute_nil @tb.face
  end
  
  test "if toybot goes out of 5x5 dimension, it goes fallen" do
    @tb.placement 5, 5, "WEST"
    assert true, @tb.fallen?
  end
  
  test "toybot face movement" do
    @tb.facing "NORTH"
    assert "NORTH", @tb.face
  end
  
  test "toybot moves left" do
    @tb.placement 1, 2, "NORTH"
    assert "WEST", @tb.left
    assert "WEST", @tb.face
    assert "SOUTH", @tb.left
    assert "SOUTH", @tb.face
    assert "EAST", @tb.left
    assert "EAST", @tb.face
    assert "NORTH", @tb.left
    assert "NORTH", @tb.face
  end
  
  test "toybot moves right" do
    @tb.placement 1, 2, "NORTH"
    assert "EAST", @tb.right
    assert "EAST", @tb.face
    assert "NORTH", @tb.right
    assert "NORTH", @tb.face
    assert "WEST", @tb.right
    assert "WEST", @tb.face
    assert "SOUTH", @tb.right
    assert "SOUTH", @tb.face
    
  end
  
  test "when toybot does plain move, it moves accordingly" do
    @tb.placement 1, 2, "NORTH"
    @tb.move
  end  
end
