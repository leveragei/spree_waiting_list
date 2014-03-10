#Admin::ReportsController::AVAILABLE_REPORTS[:stock_requests] = {:name => 'Stock Requests', :description => 'Out of stock product requests'}

# UPGRADE_CHECK https://github.com/spree/spree/issues/1863
    
#updsate check https://github.com/spree/spree/pull/4087

Spree::Admin::ReportsController.class_eval do
   add_available_report!(:stock_requests , :out_of_stock_product_requests)
#    (ADVANCED_REPORTS ||= {}).merge!({:stock_requests => {:name => 'Stock Requests', :description => 'Out of stock product requests'}
#
#    })
  def stock_requests
    @search = Spree::StockRequest.ransack(params[:search])
    @stock_requests = @search.result
  end
end

