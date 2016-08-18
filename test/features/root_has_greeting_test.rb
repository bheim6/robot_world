require_relative '../test_helper'

class GreetingPageTest < FeatureTest
  def test_root_has_proper_greeting
    visit '/'

    within('header') do
      assert page.has_content?("Welcome to Robot World")
    end
  end
end
