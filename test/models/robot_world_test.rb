require_relative "../test_helper"

class RobotWorldTest < Minitest::Test
  include TestHelpers

  def current_robot_id
    robot_world.all.last.id
  end

  def create_robot
    robot_world.create({
      :name => "Cyborg",
      :city => "Trenton",
      :state => "New Jersey",
      :avatar => "cyborg1",
      :birthdate => "5/12/1990",
      :date_hired => "11/7/2016",
      :department => "Law Enforcement"
      })
  end

  def number_of_robots
    robot_world.all.count
  end

  def test_it_creates_a_robot
    assert_equal(0, number_of_robots)

    create_robot

    assert_equal(1, number_of_robots)
  end

  def test_it_returns_all_robots
    2.times {create_robot}

    assert_equal(2, number_of_robots)
    assert_instance_of(Robot, robot_world.all.first)
  end

  def test_it_finds_a_robot
    create_robot

    robot = robot_world.find(current_robot_id)
    assert_instance_of(Robot, robot)
  end

  def test_it_deletes_a_robot
    create_robot

    assert_equal(1, number_of_robots)

    robot_world.destroy(current_robot_id)

    assert_equal(0, number_of_robots)
  end

  def test_it_updates_a_robot
    create_robot

    params = {robot: {name: "Jesus"}}
    robot_world.update(current_robot_id, params[:robot])

    robot = robot_world.find(current_robot_id)
    assert_equal("Jesus", robot.name)
  end
end
