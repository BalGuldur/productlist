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

task :uploadabn => :environment do
  status = `../../xlsx2csv/xlsx2csv.py -s 2 -d ';' PriceLists/Abn.xlsx > PriceLists/Abn.csv`
  # print status3+"\n"
  pricelist = File.new("PriceLists/Abn.csv")
  @products = Product.where{distributor.eq 'abn'}
  @products.delete_all
  pricelist.each do |line|
    line.encode!('UTF-8', invalid: :replace, undef: :replace, replace: '')
    line.chomp!
    line.gsub!(/""/,'inch')
    line.gsub!(/; /,', ')
    line.gsub!(/;";/,',";')
    line.tr_s!("\"",'')
    line.scan(/[[:print:]]/).join
    linehash = line.split(';')
    if linehash[5]!=nil && linehash[5]!=""
      product = Product.new(productarticul: linehash[7], productname: linehash[1], distributor: "abn", pricedoll: linehash[5], nalichie: linehash[2])
      # Наличие взято по полю В наличии MOS. Есть еще поле наличие SPB.
      product.save
    end
  end
end

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

task :uploadelko => :environment do
  status = `../../xlsx2csv/xlsx2csv.py -d ';' PriceLists/Elko.xlsx > PriceLists/Elko.csv`
  # print status3+"\n"
  pricelist = File.new("PriceLists/Elko.csv")
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
      product = Product.new(productarticul: linehash[0], productname: linehash[1], distributor: "treolan", pricedoll: linehash[4],pricerub: linehash[5], nalichie: linehash[2])
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
    print line + "\n"
    # line.gsub!(/, /,'; ')
    line.gsub!(/,",/,';",')
    line.gsub!(/ , /,' ; ')
    line.gsub!(/[a-z,A-Z,\d],/) {|match|match.gsub!(/,/,';')}
    line.gsub!(/,"[^"]+?,[^"]+?",/) {|match1|match1.gsub!(/"[^"]*"/) {|match2|'"'+match2.tr_s!(",",";")+'"'}}
    line.tr_s!("\"",'')
    line.scan(/[[:print:]]/).join
    print line + "\n"
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

task :uploadsofttronic => :environment do
  status = `xlhtml -xp:1 -csv PriceLists/Softtronic.xls > PriceLists/Softtronic.csv`
  # print status3+"\n"
  pricelist = File.new("PriceLists/Softtronic.csv")
  @products = Product.where{distributor.eq 'softtronic'}
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
    if linehash[3]!=nil && linehash[3]!=""
      product = Product.new(productarticul: linehash[2], productname: linehash[3], distributor: "softtronic", pricedoll: linehash[5])
      #print linehash[3]
      product.save
    end
  end
end

task :uploadresursmedia => :environment do
  status = `../../xlsx2csv/xlsx2csv.py -d ';' PriceLists/Resursmedia.xlsx > PriceLists/Resursmedia.csv`
  # print status3+"\n"
  pricelist = File.new("PriceLists/Resursmedia.csv")
  @products = Product.where{distributor.eq 'resursmedia'}
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
    if linehash[7]!=nil && linehash[7]!=""
      product = Product.new(productarticul: linehash[5], productname: linehash[6], distributor: "resursmedia", pricedoll: linehash[8], pricerub: linehash[9], nalichie: linehash[10])
      #print linehash[3]
      product.save
    end
  end
end

task :uploadnetlab => :environment do
  status = `../../xlsx2csv/xlsx2csv.py -d ';' PriceLists/Netlab.xlsx > PriceLists/Netlab.csv`
  # print status3+"\n"
  pricelist = File.new("PriceLists/Netlab.csv")
  @products = Product.where{distributor.eq 'netlab'}
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
    if linehash[16]!=nil && linehash[16]!=""
      product = Product.new(productarticul: linehash[16], productname: linehash[5], distributor: "netlab", pricerub: linehash[12], pricedoll: linehash[11], nalichie: linehash[0])
      #print linehash[3]
      product.save
    end
  end
end

task :uploadsds => :environment do
  status = `xlhtml -xp:0 -csv PriceLists/Sds_network.xls > PriceLists/Sds_network.csv`
  # print status3+"\n"
  pricelist = File.new("PriceLists/Sds_network.csv")
  @products = Product.where{distributor.eq 'sds'}
  @products.delete_all
  pricelist.each do |line|
    line.encode!('UTF-8', invalid: :replace, undef: :replace, replace: '')
    line.chomp!
    # print line + "\n"
    # line.gsub!(/, /,'; ')
    line.gsub!(/\d,\d/) {|match|match.gsub!(/,/,'')}
    line.gsub!(/,",/,';",')
    line.gsub!(/,"[^"]+?,[^"]+?",/) {|match1|match1.gsub!(/"[^"]*"/) {|match2|'"'+match2.tr_s!(",",";")+'"'}}
    line.tr_s!("\"",'')
    line.scan(/[[:print:]]/).join
    # print line + "\n"
    linehash = line.split(',')
    if linehash[1]!=nil && linehash[1]!=""
      product = Product.new(productname: linehash[1], distributor: "sds", pricerub: linehash[4], nalichie: linehash[3])
      #print linehash[3]
      product.save
    end
  end
end

#task :uploadtechnotrade => :environment do
# status = `xlhtml -xp:0 -csv PriceLists/Technotrade.xls > PriceLists/Technotrade.csv`
# # print status3+"\n"
# pricelist = File.new("PriceLists/Technotrade.csv")
# @products = Product.where{distributor.eq 'technotrade'}
# @products.delete_all
# pricelist.each do |line|
#   line.encode!('UTF-8', invalid: :replace, undef: :replace, replace: '')
#   line.chomp!
#   # print line + "\n"
#   # line.gsub!(/, /,'; ')
#   line.gsub!(/\d,\d/) {|match|match.gsub!(/,/,'')}
#   line.gsub!(/,",/,';",')
#   line.gsub!(/,"[^"]+?,[^"]+?",/) {|match1|match1.gsub!(/"[^"]*"/) {|match2|'"'+match2.tr_s!(",",";")+'"'}}
#   line.tr_s!("\"",'')
#   line.scan(/[[:print:]]/).join
#   # print line + "\n"
#   linehash = line.split(',')
#   if linehash[1]!=nil && linehash[1]!=""
#     product = Product.new(productname: linehash[1], distributor: "technotrade", pricerub: linehash[4], nalichie: linehash[3])
#     #print linehash[3]
#     product.save
#   end
# end
#end
#

task :uploadbecompact => :environment do
  status = `../../xlsx2csv/xlsx2csv.py -d ';' PriceLists/Becompact.xlsx > PriceLists/Becompact.csv`
  # print status3+"\n"
  pricelist = File.new("PriceLists/Becompact.csv")
  @products = Product.where{distributor.eq 'becompact'}
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
    if linehash[2]!=nil && linehash[2]!=""
      product = Product.new(productarticul: linehash[1], productname: linehash[2]+linehash[3], distributor: "becompact", pricerub: linehash[10], pricedoll: linehash[11], nalichie: linehash[12])
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
  if prices.include?("Elko")
    status2 = `rake uploadelko > log/uploadelko.log &`
  end
  if prices.include?("Abn")
    status2 = `rake uploadabn > log/uploadabn.log &`
  end
  if prices.include?("Softtronic")
    status2 = `rake uploadsofttronic > log/uploadsofttronic.log &`
  end
  if prices.include?("Resursmedia")
    status2 = `rake uploadresursmedia > log/uploadresursmedia.log &`
  end
  if prices.include?("Netlab")
    status2 = `rake uploadnetlab > log/uploadnetlab.log &`
  end
  if prices.include?("Technotrade")
    status2 = `rake uploadtechnotrade > log/uploadtechnotrade.log &`
    #еще не реализован и метод не написан
  end
  if prices.include?("Sds_network")
    status2 = `rake uploadsds > log/uploadsds.log &`
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
