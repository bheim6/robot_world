require_relative "../test_helper"

class RobotWorldTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_robot
    robot_world.create({
      :name => "Cyborg",
      :city => "Trenton",
      :state => "New Jersey",
      :avatar => "cyborg1",
      :birthdate => "5/12/1990",
      :date_hired => "11/7/2016",
      :department => "Law Enforcement"
      })
      robot = robot_world.find(1)
      assert_equal("Cyborg", robot.name)
      assert_equal("Trenton", robot.city)
      assert_equal("cyborg1", robot.avatar)
      assert_equal("Law Enforcement", robot.department)
  end
end
