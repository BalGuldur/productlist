class Moneytype < ActiveRecord::Base
  def self.updatecourse
    require 'open-uri'
    require 'xmlsimple'
    
    valutes = XmlSimple.xml_in(open("http://www.cbr.ru/scripts/XML_daily.asp?"),{'KeyAttr' => 'ID'})
    cursDoll = valutes['Valute']['R01235']['Value'][0]
    cursEuro = valutes['Valute']['R01239']['Value'][0]
    cursDoll.tr_s!(',','.')
    cursEuro.tr_s!(',','.')
    doll=Moneytype.find_by(name: "Доллар")
    doll.curse=cursDoll.to_f
    doll.save
    euro=Moneytype.find_by(name: "Евро")
    euro.curse=cursEuro.to_f
    euro.save
  end
end
