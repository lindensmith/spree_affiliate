module SpreeAffiliate
  class Configuration < Spree::Preferences::Configuration
    preference :sender_credit_on_purchase_amount, :decimal, :default => 0.0
    preference :sender_credit_on_register_amount, :decimal, :default => 0.0
    preference :sender_credit_on_purchase_percent, :decimal, :default => 0.0
    preference :sender_credit_on_order_paid_amount,  :decimal, :default => 0.0
    preference :recipient_credit_on_register_amount, :decimal, :default => 0.0
    preference :recipient_credit_on_purchase_amount, :decimal, :default => 0.0
    preference :recipient_credit_on_purchase_percent, :decimal, :default =>0.0
  end
end
