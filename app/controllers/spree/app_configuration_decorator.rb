# These will be saved with key: spree/app_configuration/hot_salsa
Spree::AppConfiguration.class_eval do
  preference :order_from, :string, default: "hello@coryvines.com"
end