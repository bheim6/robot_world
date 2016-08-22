require_relative '../test_helper'

class RobotTest < Minitest::Test
  def test_it_assigns_attributes_correctly
    robot = Robot.new({ "id" => 1,
                        "name" => "Bob",
                        "city" => "Denver",
                        "state" => "Colorado",
                        "avatar" => "bob",
                        "birthdate" => "1989-12-18",
                        "date_hired" => "2016-3-15",
                        "department" => "awesome"
                        })
    assert_equal("Bob", robot.name)
    assert_equal("Denver", robot.city)
    assert_equal("1989-12-18", robot.birthdate)
    assert_equal("2016-3-15", robot.date_hired)
    assert_equal("Colorado", robot.state)
    assert_equal(1, robot.id)
    assert_equal(27, robot.age)
  end
end
