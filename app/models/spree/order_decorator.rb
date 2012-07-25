Spree::Order.class_eval do

  #log the order_id with the credit for tracking
  has_many :affiliate_events, :class_name => 'Spree::AffiliateEvent', :foreign_key => "order_id"
  
end