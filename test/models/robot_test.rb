require_relative '../test_helper'

class RobotTest < Minitest::Test
  def test_it_assigns_attributes_correctly
    robot = Robot.new({ "id" => 1,
                        "name" => "Bob",
                        "city" => "Denver",
                        "state" => "Colorado",
                        "avatar" => "bob",
                        "birthdate" => "12/18/1989",
                        "date_hired" => "3/15/2016",
                        "department" => "awesome"
                        })
    assert_equal("Bob", robot.name)
    assert_equal("Denver", robot.city)
    assert_equal("12/18/1989", robot.birthdate)
    assert_equal("3/15/2016", robot.date_hired)
    assert_equal("Colorado", robot.state)
    assert_equal(1, robot.id)
  end
end
