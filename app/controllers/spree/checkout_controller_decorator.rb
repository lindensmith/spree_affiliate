Spree::CheckoutController.class_eval do
  include AffiliateCredits

  private

  def after_complete
    
    order=Spree::Order.find(session[:order_id])
    
    if current_user && current_user.affiliate_partner 
      sender = current_user.affiliate_partner.partner

      #create credit (if required)
      create_affiliate_credits(sender, current_user, "purchase", session[:order_id], order.item_total )
    end
    session[:order_id] = nil  # clear the order ID after we do the credit rather than before, so we can track what purchase the credit is for
  end
  
  def first_order?(user)
    user.orders.where(:state=>'complete'.count==1)
  end
end
