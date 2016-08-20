require_relative '../test_helper'

class UserCanEditRobotTest < FeatureTest

  def test_user_can_edit_robot
    visit '/'
    click_link('New Robot')

    fill_in('name', :with => 'Leeroy')
    fill_in('city', :with => 'Stormforge')
    fill_in('state', :with => 'Iron Hills')
    fill_in('avatar', :with => 'mrjenkins')
    fill_in('birthdate', :with => '6/6/1999')
    fill_in('date_hired', :with => '9/9/2001')
    fill_in('department', :with => 'Raids')
    click_on('Submit')

    click_on('Leeroy')

    assert 'robots/1', current_path

    click_on('Edit Robot')

    assert 'robots/1/edit', current_path

    fill_in('robot[name]', :with => 'Leeroy Jenkins')
    click_on('Submit')

    save_and_open_page

    assert 'robots/1', current_path

    assert page.has_content?('Leeroy Jenkins')
  end
end
