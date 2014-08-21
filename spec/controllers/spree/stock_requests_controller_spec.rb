require 'rails_helper'

describe Spree::StockRequestsController, type: :controller do
  let!(:user)    { create(:user) }
  let!(:variant) { create(:variant) }
  let!(:stock_request_params) { { email: user.email, variant_id: variant.id, product_id: variant.product.id } }

  context "GET /new" do
    before { spree_get :new }

    it "assigns @stock_request" do
      expect(assigns(:stock_request)).to be_kind_of(Spree::StockRequest)
    end

    it "has a success response" do
      expect(response).to be_success
    end
  end

  context "POST /create" do
    context "valid data" do

      context "html format" do
        before { spree_post :create, stock_request: stock_request_params }

        it "redirects to root_path" do
          expect(response).to redirect_to(spree.root_path)
        end

        it "sets the right flash notice message" do
          expect(flash[:notice]).to eq(I18n.t(:successful_stock_request))
        end
      end

      context "js format" do
        before { xhr :post, :create, use_route: spree, stock_request: stock_request_params }

        it "has a success response" do
          expect(response).to be_success
        end

        it "renders the create template" do
          expect(response).to render_template('create')
        end
      end

      context "logged in" do
        stub_authorization!

        before do
          allow(controller).to receive_messages spree_current_user: user
          user.spree_roles << Spree::Role.find_or_create_by(name: 'admin')
          spree_post :create, stock_request: stock_request_params
        end

        it "sets the email" do
          expect(assigns(:stock_request).email).to eq(user.email)
        end

        it "sets the right product and variants" do
          expect(assigns(:stock_request).variant).to eq(variant)
          expect(assigns(:stock_request).product).to eq(variant.product)
        end
      end
    end

    context "invalid data" do
      before { spree_post :create, stock_request: { email: '', variant_id: '', product_id: '' } }

      it "assigns @stock_request" do
        expect(assigns(:stock_request)).to be_kind_of(Spree::StockRequest)
      end

      it "has a success response" do
        expect(response).to be_success
      end

      it "renders the new template" do
        expect(response).to render_template('new')
      end
    end
  end
end
