require 'helper'

class TestPureFunction < Test::Unit::TestCase
  context "cache" do

    should "should return results" do
      return_val = PureFunction.cache do
        "hello"
      end
      assert_equal "hello", return_val
    end

    should "should return the same value whenever it's called at the same line" do
      a = [1,2]
      2.times do
        #the pure_function block will always return the same thing it returned the first time
        assert_equal [1,2], PureFunction.cache { a }
        a << 3
      end
      #a is still getting mutated. the PureFunction block just insulates us from it
      assert_equal [1,2,3,3], a
    end
  end
end
