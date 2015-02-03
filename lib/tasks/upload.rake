task :upload => :environment do
  pricelist = File.new("/home/krulov/RoRapp/productlist/price_merlion.csv")
#  i=0
#  puts "start/n"
  pricelist.first(300).each do |line|
    line.encode!('UTF-8','binary', invalid: :replace, undef: :replace, replace: '')
    line.chomp!
    line.tr_s!("\"",'')
    line.scan(/[[:print:]]/).join
    linehash = line.split(',')
    if linehash[7]!= nil
      product = Product.new(productarticul: linehash[6], productname: linehash[7], distributor: "merlion", price: linehash[9], nalichie: linehash[13])
      product.save
#      puts "add product/n"
#      i+=1
    end
#    break if i==10
  end
end

task :destroyall => :environment do
  Product.delete_all
  puts "all products destroy/n"
end
