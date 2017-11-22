class Stock < ApplicationRecord
  
  def self.new_from_lookup(ticker_symbol)
    begin 
      looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
      
    
      price = strip_commas(looked_up_stock.l)
      new(name: looked_up_stock.name, ticker: looked_up_stock.symbol, last_price: price)
    rescue Exception => e 
      return nil
    end
  end
  
  def self.strip_commas(number)
    number.gsub(",", "")   
  end
  
end
