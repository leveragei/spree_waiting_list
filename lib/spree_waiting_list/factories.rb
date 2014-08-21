FactoryGirl.define do
  # Define your Spree extensions Factories within this file to enable applications, and other extensions to use and override them.
  #
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'spree_waiting_list/factories'
  factory :stock_request, class: Spree::StockRequest do
    email { generate(:random_email) }
    product
    variant
    status 'new'
  end
end
