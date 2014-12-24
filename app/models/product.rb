class Product < ActiveRecord::Base
  def uploadcsvmerlion
    pricelist = File.new("price_merlion.csv")
    pricelist.each do |line|
      puts line
      line.encode!('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
      line.chomp!
      line.tr_s!("\"",'')
      line.scan(/[[:print:]]/).join
      linehash = line.split(',')
      if linehash[3]!=nil
        product = Product.new(productarticul: linehash[6], productname: linehash[7], distributor: "merlion", price: linehash[9], nalichie: linehash[13])
        product.save
      end
    end
  end
  
  def destroyall
    Product.all.each {|prd|prd.destroy}
  end
end
