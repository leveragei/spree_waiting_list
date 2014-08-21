require 'rails_helper'

describe Spree::StockRequest, type: :model do

  context "#create" do
    it "has an initial new status" do
      expect(create_stock_request.status).to eq('new')
    end

    it "is invalid with the wrong params" do
      mail = create_stock_request(email: 'garbage')
      expect(mail.valid?).to be_falsey
      expect(mail.errors[:email].size).to eq(1)
    end

    it "is valid with the right params" do
      expect(create_stock_request).to be_valid
    end
  end

  context "notification" do
    before do
      mail     = double(:mail)
      @request = create_stock_request
      expect(Spree::UserMailer).to receive(:back_in_stock).with(@request).and_return(mail)
      expect(mail).to receive(:deliver)
      @request.notify!
    end

    it "has a notified status" do
      expect(@request.status).to eq('notified')
    end

    specify { expect(Spree::StockRequest.notified(false).size).to eq(0) }
    specify { expect(Spree::StockRequest.notified(true).size).to eq(1) }
  end

  def create_stock_request(fields={})
    Spree::StockRequest.create({ variant_id: 1, product_id: 1, email: 'test@home.org' }.merge(fields))
  end
end
