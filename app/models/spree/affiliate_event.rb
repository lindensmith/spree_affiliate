class Spree::AffiliateEvent < ActiveRecord::Base
  
  attr_accessible :reward, :name, :user
  
  belongs_to :affiliate, :class_name => 'Spree::Affiliate'
  belongs_to :reward, :polymorphic => true
  belongs_to :user, :class_name => 'Spree::User'
  belongs_to :order, :class_name => 'Spree::Order'
end
