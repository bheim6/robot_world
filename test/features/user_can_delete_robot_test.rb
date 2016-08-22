require_relative '../test_helper'

class UserCanDeleteRobotTest < FeatureTest

  def test_user_can_delete_robot
  visit '/'
  click_link('New Robot')

  fill_in('name', :with => 'Leeroy')
  fill_in('city', :with => 'Stormforge')
  fill_in('state', :with => 'Iron Hills')
  fill_in('avatar', :with => 'mrjenkins')
  fill_in('birthdate', :with => '1999-6-6')
  fill_in('date_hired', :with => '2001-9-9')
  fill_in('department', :with => 'Raids')
  click_on('Submit')

  click_link('New Robot')

  fill_in('name', :with => 'Steve')
  fill_in('city', :with => 'Stormforge')
  fill_in('state', :with => 'Iron Hills')
  fill_in('avatar', :with => 'steve')
  fill_in('birthdate', :with => '1999-6-6')
  fill_in('date_hired', :with => '2001-9-9')
  fill_in('department', :with => 'Raids')
  click_on('Submit')

  assert page.has_content?('Leeroy')
  assert page.has_content?('Steve')

  click_on('Leeroy')

  assert 'robots/1', current_path

  click_on('Delete Robot')

  assert '/robots', current_path

  save_and_open_page

  assert_equal false, page.has_content?('Leeroy')
  assert page.has_content?('Steve')
  end
end
