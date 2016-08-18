require_relative '../test_helper'

class UserSeesAllRobotsTest < FeatureTest
  def test_user_can_see_all_robots
    robot_world.create({
      :name => "Cyborg",
      :city => "Trenton",
      :state => "New Jersey",
      :avatar => "cyborg1",
      :birthdate => "5/12/1990",
      :date_hired => "11/7/2016",
      :department => "Law Enforcement"
      })
    robot_world.create({
      :name => "Steve",
      :city => "Long Beach",
      :state => "California",
      :avatar => "steveo",
      :birthdate => "11/12/1980",
      :date_hired => "7/9/2016",
      :department => "Surfing"
      })

      visit '/robots'

      save_and_open_page

      assert page.has_content?("Cyborg")
      assert page.has_content?("Steve")
  end
end
