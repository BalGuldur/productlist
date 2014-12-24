class Product < ActiveRecord::Base
  def uploadcsvmerlion
    pricelist = File.new("price_merlion.csv")
    pricelist.each do |line|
      puts line
      line.chomp!
      line.tr_s!("\"",'')
      linehash = line.split(',')
      if linehash[3]!=nil
        product = Product.new(productarticul: linehash[6], productname: linehash[7], distributor: "merlion", price: linehash[9], nalichie: linehash[13])
        product.save
      end
    end
  end
end
