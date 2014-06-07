require 'test_helper'

class BibleControllerTest < ActionController::TestCase
  test "the truth" do
    assert true
  end

  test "not true" do
  	assert 1<0 == false
  end
end
