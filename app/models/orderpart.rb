class Orderpart < ActiveRecord::Base
  belongs_to :order
  belongs_to :doner, class_name: "Employee"
  belongs_to :state, class_name: "Orderstate"
  belongs_to :panswtime, class_name: "Ourtime"
  belongs_to :pshiptime, class_name: "Ourtime"
  belongs_to :rezpricetype, class_name: "Moneytype"
  belongs_to :distributor

  def self.to_csv(options = {})
    #Метод генерирующий csv файл с помощью библиотеки используется в respond_to
    CSV.generate(options) do |csv|
      #csv << column_names
      all.each do |orderpart|
        csv << orderpart.attributes.values_at("partnum","descr","qty")
      end
    end
  end

  def checkstate
    if self.state!=Orderstate.find_by(state: "Отказ в резерве") && self.state!=Orderstate.find_by(state: "Удалено менеджером")
      if self.doner_id!=nil
        if self.distributor!=nil && self.reztime!=nil && self.beznal!=nil && self.nds!=nil && self.rezprice!=nil && self.rezpricetype_id!=nil && self.shipprice!=nil && self.pshiptime_id!=nil && self.convertion!=nil
          self.state=Orderstate.find_by(state: "Зарезервировано")
        elsif self.panswtime_id!=nil
          self.state=Orderstate.find_by(state: "Принято в ОЗ")
        else
          self.state=Orderstate.find_by(state: "Передано в ОЗ")
        end
      else
        self.state=Orderstate.find_by(state: "Передано в ОЗ")
      end
      self.save
    end
    if self.rezpricetype!=nil 
      self.rezpricetype.name=="Рубли" ? self.convertion=0 : ""
    end
    self.updatemargin
    self.order!=nil ? self.order.checkstate : ""
  end

  def rashodbeznal
    self.beznal!=nil ? @rasbeznal=self.rezprice*self.beznal/100 : @rasbeznal=0
    @rasbeznal
  end

  def rashodconver
    self.convertion!=nil ? @rasconver=self.rezpriceinru*self.convertion/100 : @rasconver=0
    @rasconver
  end

  def rashodship
    self.shipprice!=nil ? @rasship=self.shipprice : @rasship=0
    @rasship
  end

  def pmargincolor
    if self.pmargin!=nil
      self.pmargin<0 ? "red" : ""
    else
      ""
    end
  end

  def updatemargin
    if self.psaleprice!=nil && self.psaleprice!="" && self.rezprice!=nil && self.rezprice!="" &&self.rezprice!=0
      if self.psaleprice!=nil && self.rezpriceinru!=nil && self.qty!=nil
        self.pmargin = (self.psaleprice-self.rezpriceinru-self.rashodbeznal-self.rashodconver)*self.qty-self.rashodship
      end
    else
      self.pmargin = 0
    end
    self.save
  end

  def rezpriceinru
    if self.rezpricetype!=nil && self.rezprice!=nil
      @rpriceinru=self.rezprice*self.rezpricetype.curse
      if self.convertion!=nil
        @rpriceinru=@rpriceinru+@rpriceinru*self.convertion/100
      end
    else
      @rpriceinru=0
    end
    @rpriceinru
  end

  def rashod
    @rashod=0
    if self.qty!=nil && self.qty!=0
      if self.convertion!=nil && self.convertion!=0
        @rashod=self.rezpriceinru+self.rezpriceinru*(self.convertion/100)
      else
        @rashod=self.rezpriceinru
      end
      self.qty!=nil ? @rashod=@rashod*self.qty : ""
      self.shipprice!=nil ? @rashod+=self.shipprice*self.qty : ""
      self.beznal!=nil ? @rashod+=self.beznal : @rashod
    end
    @rashod
  end
end
