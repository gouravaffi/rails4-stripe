require 'spec_helper'

# Feature: Product Acquisition
#   As a user
#   I want to use my credit card
#   So I can download the product
feature 'Product Purchase' do

  # Scenario: With valid card data
  #   Given I am a visitor
  #   And I visit the home page
  #   When I click the "Buy the Book" button
  #   Then I see a credit card payment form
  #   When I fill in the following:
  #     | Email | testy@testing.com |
  #     | Credit Card Number | 4242424242424242 |
  #     | card_code | 111 |
  #   And I select "5 - May" as the "month"
  #   And I select "2015" as the "year"
  #   And I click "Submit"
  #   Then I see "Account Created" on the "User Account" page

  scenario 'With valid card data', js: true do
    visit root_path
    click_button('Pay with Card')
    within_frame('stripe_checkout_app') do
      fill_in 'Email', with: "visitor@example.com"
      fill_in 'Card number', :with => '4242424242424242'
      fill_in 'MM / YY', :with => '12/2019'
      fill_in 'CVC', :with => '125'
      click_button('Pay $5.00')
    end
    expect(page).to have_text('Thanks, you paid $5.00!')
  end

  # Scenario: With invalid card number
  #   Given I am a visitor
  #   And I visit the home page
  #   When I click the "Buy the Book" button
  #   Then I see a credit card payment form
  #   When I fill in the following:
  #     | Email | testy@testing.com |
  #     | Credit Card Number | 5555555555555 |
  #     | card_code | 111 |
  #   And I select "1 - January" as the "month"
  #   And I select "2016" as the "year"
  #   And I click "Submit"
  #   Then I see "Your card number is incorrect"
  scenario 'With invalid card number', js: true do
    visit root_path
    click_button('Pay with Card')
    within_frame('stripe_checkout_app') do
      fill_in 'Email', with: "visitor@example.com"
      fill_in 'Card number', :with => '5555555555555'
      fill_in 'MM / YY', :with => '01/2016'
      fill_in 'CVC', :with => '111'
      click_button('Pay $5.00')
      expect(page).to have_css("input.invalid")
    end
  end

  #   Scenario: With invalid card security code
  #   Given I am a visitor
  #   And I visit the home page
  #   When I click the "Buy the Book" button
  #   Then I see a credit card payment form
  #   When I fill in the following:
  #     | Email | testy@testing.com |
  #     | Credit Card Number | 4242424242424242 |
  #     | card_code | 6 |
  #   And I select "10 - October" as the "month"
  #   And I select "2016" as the "year"
  #   And I click "Submit"
  #   Then I see "Your card's security code is invalid"
  scenario 'With invalid card security code', js: true do
    visit root_path
    click_button('Pay with Card')
    within_frame('stripe_checkout_app') do
      fill_in 'Email', with: "visitor@example.com"
      fill_in 'Card number', :with => '4242424242424242'
      fill_in 'MM / YY', :with => '01/2016'
      fill_in 'CVC', :with => '6'
      click_button('Pay $5.00')
      expect(page).to have_css("input.invalid")
    end
  end

  #   Scenario: With declined card
  #   Given I am a visitor
  #   And I visit the home page
  #   When I click the "Buy the Book" button
  #   Then I see a credit card payment form
  #   When I fill in the following:
  #     | Name | Testy McDecline |
  #     | Email | testy@testing.com |
  #     | user_password | secret_password |
  #     | user_password_confirmation | secret_password |
  #     | Credit Card Number | 4000000000000002 |
  #     | card_code | 111 |
  #   And I select "10 - October" as the "month"
  #   And I select "2016" as the "year"
  #   And I click "Submit"
  #   Then I see "declined"

end
