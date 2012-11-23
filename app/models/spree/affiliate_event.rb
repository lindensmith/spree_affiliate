class Spree::AffiliateEvent < ActiveRecord::Base
  
  attr_accessible :reward, :name, :user, :order_id
  
  belongs_to :affiliate, :class_name => 'Spree::Affiliate'
  belongs_to :reward, :polymorphic => true
  belongs_to :user, :class_name => Spree.user_class.to_s
end
