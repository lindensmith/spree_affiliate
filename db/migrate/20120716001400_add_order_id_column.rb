class AddOrderIdColumn < ActiveRecord::Migration
  def change
    add_column ::spree_affiliate_events, :order_id, :int
  end
end