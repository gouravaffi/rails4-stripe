require 'spec_helper'

# Spec: Stripe Configuration Variables
#   As a developer
#   I want to be sure Stripe configuration variables are set
#   So I can troubleshoot if the application fails
describe "Stripe Configuration Variables" do

  describe "STRIPE_API_KEY" do

    it "should be set" do
      expect(Stripe.api_key).not_to eq nil
    end

  end

  describe "STRIPE_PUBLIC_KEY" do

    it "should be set" do
      expect(Rails.application.secrets.stripe_publishable_key).not_to eq nil
    end

  end

end
