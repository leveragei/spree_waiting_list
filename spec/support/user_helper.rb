def create_user
  Spree::User.create(password: 'test123', password_confirmation: 'test123', email: 'john@example.com')
end
