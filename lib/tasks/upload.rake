task :uploadmaltima => :environment do
  pricelist = File.new("PriceLists/PriceListMaltima.csv")
  @products = Product.where{distributor.eq 'maltima'}
  @products.delete_all
  pricelist.each do |line|
    line.encode!('UTF-8', invalid: :replace, undef: :replace, replace: '')
    line.chomp!
    line.tr_s!("\"",'')
    line.gsub!(/,\s/,";")
    line.gsub!(/,"/,";")
    # попробовать line.gsub!(/,[\s"]/,";")
    line.scan(/[[:print:]]/).join
    linehash = line.split(',')
    if linehash[1]!= nil && linehash[1]!=""
      product = Product.new(productname: linehash[1], distributor: "maltima", pricedoll: linehash[2], pricerub: linehash[7])
      # Комментарий
      # В таблице нет артикула
      product.save
    end
  end
end

task :uploadmarvel => :environment do
  pricelist = File.new("PriceLists/PriceListMarvel.csv")
  @products = Product.where{distributor.eq 'marvel'}
  @products.delete_all
  pricelist.each do |line|
    line.encode!('UTF-8', invalid: :replace, undef: :replace, replace: '')
    line.chomp!
    line.tr_s!("\"",'')
    line.scan(/[[:print:]]/).join
    linehash = line.split(';')
    if linehash[6]!= nil && linehash[6]!=""
      product = Product.new(productarticul: linehash[5], productname: linehash[6], distributor: "marvel", nalichie: linehash[11])
      # Комментарий
      # Цена может быть в рублях или в долларах за это отвечает поле "Валюта" 10
      if linehash[10]=='RUR'
        product.pricerub = linehash[9]
      else
        product.pricedoll = linehash[9]
      end
      product.save
    end
  end
end

task :uploadelko => :environment do
  pricelist = File.new("PriceLists/PriceListElko.csv")
  @products = Product.where{distributor.eq 'elko'}
  @products.delete_all
  pricelist.each do |line|
    line.encode!('UTF-8', invalid: :replace, undef: :replace, replace: '')
    line.chomp!
    line.tr_s!("\"",'')
    line.scan(/[[:print:]]/).join
    linehash = line.split(';')
    if linehash[7]!= nil && linehash[7]!=""
      product = Product.new(productarticul: linehash[4], productname: linehash[5], distributor: "elko", pricerub: linehash[7], nalichie: linehash[8])
      # Наличие взято по полю В наличии MOS. Есть еще поле наличие SPB.
      product.save
    end
  end
end

task :uploadmerlion => :environment do
  pricelist = File.new("PriceLists/price_merlion.csv")
#  i=0
#  puts "start/n"
  @products = Product.where{distributor.eq 'merlion'}
  @products.delete_all
  pricelist.each do |line|
    line.encode!('UTF-8', invalid: :replace, undef: :replace, replace: '')
    line.chomp!
    line.tr_s!("\"",'')
    line.scan(/[[:print:]]/).join
    linehash = line.split(',')
    if linehash[7]!= nil && linehash[7]!=""
      product = Product.new(productarticul: linehash[6], productname: linehash[7], distributor: "merlion", pricedoll: linehash[9], nalichie: linehash[13])
      product.save
#      puts "add product/n"
#      i+=1
    end
#    break if i==10
  end
end

task :uploadtreolan => :environment do
  pricelist = File.new("PriceLists/Treolancat.csv")
  @products = Product.where{distributor.eq 'treolan'}
  @products.delete_all
  pricelist.each do |line|
    line.encode!('UTF-8', invalid: :replace, undef: :replace, replace: '')
    line.chomp!
    # print line + "\n"
    line.gsub!(/; /,', ')
    line.gsub!(/;";/,',";')
    line.tr_s!("\"",'')
    line.scan(/[[:print:]]/).join
    # print line + "\n"
    linehash = line.split(';')
    if linehash[1]!=nil && linehash[1]!=""
      product = Product.new(productarticul: linehash[0], productname: linehash[1], distributor: "treolan", pricedoll: linehash[6],pricerub: linehash[7], nalichie: linehash[3])
      #print linehash[3]
      product.save
    end
  end
end

task :destroyall => :environment do
  Product.delete_all
  puts "all products destroy/n"
end
