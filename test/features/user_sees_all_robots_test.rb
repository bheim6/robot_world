require_relative '../test_helper'

class UserSeesAllRobotsTest < FeatureTest
  def test_user_can_see_all_robots
    robot_world.create({
      :name => "Cyborg",
      :city => "Trenton",
      :state => "New Jersey",
      :avatar => "cyborg1",
      :birthdate => "1990-5-12",
      :date_hired => "2016-7-11",
      :department => "Law Enforcement"
      })
    robot_world.create({
      :name => "Steve",
      :city => "Long Beach",
      :state => "California",
      :avatar => "steveo",
      :birthdate => "1980-11-12",
      :date_hired => "2016-7-9",
      :department => "Surfing"
      })

      visit '/robots'

      save_and_open_page

      assert page.has_content?("Cyborg")
      assert page.has_content?("Steve")
  end
end
