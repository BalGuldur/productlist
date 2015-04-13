#task :uploadmaltima => :environment do
#  pricelist = File.new("PriceLists/PriceListMaltima.csv")
#  @products = Product.where{distributor.eq 'maltima'}
#  @products.delete_all
#  pricelist.each do |line|
#    line.encode!('UTF-8', invalid: :replace, undef: :replace, replace: '')
#    line.chomp!
#    line.tr_s!("\"",'')
#    line.gsub!(/,\s/,";")
#    line.gsub!(/,"/,";")
#    # попробовать line.gsub!(/,[\s"]/,";")
#    line.scan(/[[:print:]]/).join
#    linehash = line.split(',')
#    if linehash[1]!= nil && linehash[1]!=""
#      product = Product.new(productname: linehash[1], distributor: "maltima", pricedoll: linehash[2], pricerub: linehash[7])
#      # Комментарий
#      # В таблице нет артикула
#      product.save
#    end
#  end
#end


task :uploadmarvel => :environment do
  status = `../../xlsx2csv/xlsx2csv.py -d ';' PriceLists/Marvel.xlsx > PriceLists/Marvel.csv`
  # print status3+"\n"
  pricelist = File.new("PriceLists/Marvel.csv")
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

#task :uploadelko => :environment do
#  pricelist = File.new("PriceLists/PriceListElko.csv")
#  @products = Product.where{distributor.eq 'elko'}
#  @products.delete_all
#  pricelist.each do |line|
#    line.encode!('UTF-8', invalid: :replace, undef: :replace, replace: '')
#    line.chomp!
#    line.tr_s!("\"",'')
#    line.scan(/[[:print:]]/).join
#    linehash = line.split(';')
#    if linehash[7]!= nil && linehash[7]!=""
#      product = Product.new(productarticul: linehash[4], productname: linehash[5], distributor: "elko", pricerub: linehash[7], nalichie: linehash[8])
#      # Наличие взято по полю В наличии MOS. Есть еще поле наличие SPB.
#      product.save
#    end
#  end
#end

task :uploadmerlion => :environment do
  #status = `xlhtml -xp:0 -csv PriceLists/Merlion.xls > PriceLists/Merlion.csv`
  status = `../../xlsx2csv/xlsx2csv.py -d ',' -s 1 PriceLists/Merlion.xlsx > PriceLists/Merlion1.csv`
  status2 = `../../xlsx2csv/xlsx2csv.py -d ',' -s 2 PriceLists/Merlion.xlsx > PriceLists/Merlion2.csv`
  # print status3+"\n"
  pricelist1 = File.new("PriceLists/Merlion1.csv")
  pricelist2 = File.new("PriceLists/Merlion2.csv")
  @products = Product.where{distributor.eq 'merlion'}
  @products.delete_all
  pricelist1.each do |line|
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
  end
  pricelist2.each do |line|
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
  status = `../../xlsx2csv/xlsx2csv.py -d ';' PriceLists/Treolan.xlsx > PriceLists/Treolan.csv`
  # print status3+"\n"
  pricelist = File.new("PriceLists/Treolan.csv")
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

task :uploadocs => :environment do
  status = `xlhtml -xp:2 -csv PriceLists/Ocs.xls > PriceLists/Ocs.csv`
  # print status3+"\n"
  pricelist = File.new("PriceLists/Ocs.csv")
  @products = Product.where{distributor.eq 'ocs'}
  @products.delete_all
  pricelist.each do |line|
    line.encode!('UTF-8', invalid: :replace, undef: :replace, replace: '')
    line.chomp!
    #print line + "\n"
    # line.gsub!(/, /,'; ')
    line.gsub!(/,",/,';",')
    line.gsub!(/,"[^"]+?,[^"]+?",/) {|match1|match1.gsub!(/"[^"]*"/) {|match2|'"'+match2.tr_s!(",",";")+'"'}}
    line.tr_s!("\"",'')
    line.scan(/[[:print:]]/).join
    #print line + "\n"
    linehash = line.split(',')
    if linehash[4]!=nil && linehash[4]!=""
      product = Product.new(productarticul: linehash[4], productname: linehash[5], distributor: "ocs", nalichie: linehash[11])
      if linehash[8]=='RUR'
        product.pricerub = linehash[7]
      else
        product.pricedoll = linehash[7]
      end
      #print linehash[3]
      product.save
    end
  end
end


task :uploadkoodoo => :environment do
  status = `xlhtml -xp:0 -csv PriceLists/Koodoo.xls > PriceLists/Koodoo.csv`
  # print status3+"\n"
  pricelist = File.new("PriceLists/Koodoo.csv")
  @products = Product.where{distributor.eq 'koodoo'}
  @products.delete_all
  pricelist.each do |line|
    line.encode!('UTF-8', invalid: :replace, undef: :replace, replace: '')
    line.chomp!
    #print line + "\n"
    # line.gsub!(/, /,'; ')
    line.gsub!(/,",/,';",')
    line.gsub!(/,"[^"]+?,[^"]+?",/) {|match1|match1.gsub!(/"[^"]*"/) {|match2|'"'+match2.tr_s!(",",";")+'"'}}
    line.tr_s!("\"",'')
    line.scan(/[[:print:]]/).join
    #print line + "\n"
    linehash = line.split(',')
    if linehash[6]!=nil && linehash[6]!="" && linehash[6]!="Описание"
      product = Product.new(productarticul: linehash[6], productname: linehash[7], distributor: "koodoo", pricedoll: linehash[8], nalichie: linehash[10])
      #print linehash[3]
      product.save
    end
  end
end

task :uploadall => :environment do
  #status = `cd /home/krulov/grive/`
  #status = `grive`
  #status = `cd /home/krulov/RoRapp/productlist/`
  status = `bash grive.sh`
  status = `mv log/* bak/log/ -f`
  status = `mv PriceLists/* bak/PriceLists/ -f`
  status = `mv ../../grive/MiraclePrices/* PriceLists`
  status = `bash grive.sh`
 
  status = `ls PriceLists`
  prices = status.split("\n")
  prices.each {|price| price.gsub!(/\.xls.*/) {|match| match=""}}
  if prices.include?("Treolan")
    status2 = `rake uploadtreolan > log/uploadtreolan.log &`
  end
  if prices.include?("Ocs")
    status2 = `rake uploadocs > log/uploadocs.log &`
  end
  if prices.include?("Marvel")
    status2 = `rake uploadmarvel > log/uploadmarvel.log &`
  end
  if prices.include?("Koodoo")
    status2 = `rake uploadkoodoo > log/uploadkoodoo.log &`
  end
  if prices.include?("Merlion")
    status2 = `rake uploadmerlion > log/uploadmerlion.log &`
  end

  #status2 = `rake uploadtreolan > log/uploadtreolan.log &`
  #print "uploadtreolan process start"+status2+"\n"
  #status2 = `rake uploadkoodoo > log/uploadkoodoo.log &`
  #print "uploadkoodoo process start"+status2+"\n"
  #status2 = `rake uploadocs > log/uploadocs.log &`
  #print "uploadocs process start"+status2+"\n"
  #status2 = `rake uploadmarvel > log/uploadmarvel.log &`
  #print "uploadmarvel process start"
  #status2 = `rake uploadmerlion > log/uploadmerlion.log &`
  #print "uploadmerlion process start"
  #dobavit print vremia zapuska
end

task :destroyall => :environment do
  Product.delete_all
  puts "all products destroy/n"
end
