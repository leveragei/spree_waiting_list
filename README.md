SpreeWaitingList
================

A waiting list extension for Spree.

Users and guests can request to be notified via email when a product/variant comes back in stock.


Usage
=======

Add logic to your view to determine if the product is out of stock, then
Trigger stock_requests/new via the browser 
Or use post stock_requests/create to create the request

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.


      Run `bundle exec rake test_app`
      Run `bundle exec rspec`

Copyright (c) 2014 Coryvines.com, released under the New BSD License
