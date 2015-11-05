require 'spec_helper'

# Feature: Home Page
#   As a visitor
#   I want to visit a home page
#   So I can learn more about the website
feature 'Home Page' do

  # Scenario: Visit the Home Page
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see "Welcome"
  scenario 'Visit the Home Page' do
    visit root_path
    expect(page).to have_text('Welcome')
  end

  # Scenario: See a Product Offer
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see "About the Book"
  #   And a button "Buy the Book"
  scenario 'See a Product Offer', js: true do
    visit root_path
    expect(page).to have_text('Welcome')
    expect(page).to have_text('What is Ruby on Rails')
    expect(page).to have_text('5.00')
    expect(page).to have_button('Pay with Card')
  end

end
