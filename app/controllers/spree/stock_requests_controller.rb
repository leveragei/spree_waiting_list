class Spree::StockRequestsController < Spree::BaseController
  layout false
  def new
    @stock_request = Spree::StockRequest.new
    render "spree/stock_requests/new.html.haml" #TODO: not sure why i have to explicitly define .haml
  end

  def create
    @stock_request = Spree::StockRequest.new(stock_request_params)

    if @stock_request.save
      respond_to do |format|
        format.html { redirect_to root_path, :notice => t(:successful_stock_request) }
        format.js
      end
    else
      render "spree/stock_requests/new.html.haml" #TODO: not sure why i have to explicitly define .haml
    end
  end

  private
  def stock_request_params
    params.require(:stock_request).permit(:product_id, :variant_id, :email)
  end

end
