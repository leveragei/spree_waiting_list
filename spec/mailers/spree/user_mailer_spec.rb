require 'rails_helper'

describe Spree::UserMailer, type: :mailer do
  context "back in stock" do
    let(:request) { mock_model(Spree::StockRequest, email: 'test@123.com', variant: nil, product: mock_model(Spree::Product, name: 'Widget')) }
    before do
      Spree::Config.set order_from: 'admin@mysite.com'
      @mail = Spree::UserMailer.back_in_stock(request)
    end

    specify { expect(@mail.subject).to eq("Hey! Widget is back in stock") }
    specify { expect(@mail.to).to include("test@123.com") }
    specify { expect(@mail.from).to include("admin@mysite.com") }
  end
end
