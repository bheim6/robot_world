require_relative '../test_helper'

class CreateNewRobotTest < FeatureTest
  def test_user_can_create_robot
    visit '/'
    click_link('New Robot')

    assert '/robots/new', current_path

    fill_in('name', :with => 'Leeroy')
    fill_in('city', :with => 'Stormforge')
    fill_in('state', :with => 'Iron Hills')
    fill_in('avatar', :with => 'mrjenkins')
    fill_in('birthdate', :with => '6/6/1999')
    fill_in('date_hired', :with => '9/9/2001')
    fill_in('department', :with => 'Raids')
    click_on('Submit')

    save_and_open_page

    assert '/robots', current_path

    assert page.has_content?('Leeroy')
  end


end
