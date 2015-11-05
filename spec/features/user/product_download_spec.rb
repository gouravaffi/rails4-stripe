require 'spec_helper'

# Feature: Product Download
#   As a user
#   I want to download the product
#   So I can complete my purchase
feature 'Product Download' do

  # Scenario: Download the Product
  #   Given I am a user
  #   And I am redirected to the "User Account" page when I log in
  #   When I click the "Download the Book" button
  #   Then I should receive a PDF file
  scenario 'Download the Product', js: true do
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
    click_link_or_button('Download PDF')
    #expect(page.response_headers['Content-Type']).to have_content 'application/pdf'
    #TODO: Selenium webdriver is not supporting file download testing.
  end

end
