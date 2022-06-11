#!/usr/bin/env ruby

#

def get_change(money, price)
  currencies = [0.01, 0.05, 0.1, 0.25, 0.5, 1]
  money_returned = Array.new(6, 0)
  price_return = money - price
  5.downto(0).each do |currency|
    money_returned[currency], price_return = price_return.divmod(currencies[currency])
    price_return = price_return.ceil(2)
  end
  money_returned
end

puts get_change(5, 0.99).inspect
puts get_change(3.14, 1.99).inspect
puts get_change(3, 0.01).inspect
puts get_change(4, 3.14).inspect
puts get_change(0.45, 0.34).inspect
