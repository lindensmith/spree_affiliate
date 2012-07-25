Spree::UserRegistrationsController.class_eval do
  include AffiliateCredits

  after_filter :check_affiliate, :only => :create

  private

  def check_affiliate
    return if cookies[:ref_id].blank? || @user.invalid?
    sender = Spree::User.find_by_ref_id(cookies[:ref_id])

    if sender
      sender.affiliates.create(:user_id => @user.id)

      #create credit (if required)
      #sends a zero for product number and order value since it's on registration
      create_affiliate_credits(sender, @user, "register", 0,0)
    end

    #destroy the cookie, as the affiliate record has been created.
    cookies[:ref_id] = nil
  end
end
