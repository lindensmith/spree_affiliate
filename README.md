Spree Affiliate
===============
Allows customers to refer friends and earn store credit for each user who registers and/or orders.

You can also give store credit to the referred friends on signup and after first order.

Registration credits are a flat amount.
Purchase credits can be a flat amount or a percentage of the purchase price, or a combination of the two.

It sends the affiliate information as a param that's captured before further routing, so the affiliate-id
can be sent alone, like:
http://localhost:3000/?ref_id=4656257501
or attached to a product URL, like: 
http://localhost:3000/products/spree-tote?ref_id=0656257501

The invite link is shown on the user's "My Account" page.

Installation
============

1. Add to Gemfile:

        gem "spree_store_credits"
        gem "spree_affiliate"

1. Run `bundle install`
1. Run install rake task for all extensions:

        rake spree_store_credits:install
        rails g spree_affiliate:install

1. Run `rake db:migrate`


Testing
=======

bundle exec rake test_app