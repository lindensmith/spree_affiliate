module AffiliateCredits
  private

  def create_affiliate_credits(sender, recipient, event, order, item_total)
    #check if sender should receive credit on affiliate register
    if event=="purchase" and sender_credit_percent=SpreeAffiliate::Config["sender_credit_on_#{event}_percent".to_sym]
      sender_credit_percent.to_f
    else
      sender_credit_percent=0
    end
    if event=="purchase" and recipient_credit_percent=SpreeAffiliate::Config["recipient_credit_on_#{event}_percent".to_sym]
      recipient_credit_percent.to_f
    else
      recipient_credit_percent=0
    end
    if sender_credit_amount = SpreeAffiliate::Config["sender_credit_on_#{event}_amount".to_sym]
      sender_credit_amount.to_f
    end
    if recipient_credit_amount=SpreeAffiliate::Config["recipient_credit_on_#{event}_amount".to_sym]
      recipient_credit_amount.to_f
    else
      recipient_credit_amount=0
    end
    
    if sender_credit_percent > 0 or sender_credit_amount > 0
      credit = Spree::StoreCredit.create(:amount => sender_credit_amount +  item_total*sender_credit_percent/100,
                         :remaining_amount => sender_credit_amount+item_total*sender_credit_percent/100,
                         :reason => "Affiliate: #{event} Order: #{order}", :user_id => sender.id)

      log_event recipient.affiliate_partner, sender, credit, event, order
    end

    #check if affiliate should recevied credit on sign up
    if recipient_credit_percent > 0 or recipient_credit_amount > 0
      credit = Spree::StoreCredit.create(:amount => recipient_credit_amount+ item_total* recipient_credit_percent/100,
                         :remaining_amount => recipient_credit_amount+item_total*recipient_credit_percent/100,
                         :reason => "Affiliate: #{event} Order: #{order}", :user_id => recipient.id)

      log_event recipient.affiliate_partner, recipient, credit, event, order
    end

  end

  def log_event(affiliate, user, credit, event, order)
    affiliate.events.create(:reward => credit, :name => event, :user => user, :order_id=>order)
  end

end
