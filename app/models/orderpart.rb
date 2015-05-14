class Orderpart < ActiveRecord::Base
  belongs_to :order
  belongs_to :doner, class_name: "Employee"
  belongs_to :state, class_name: "Orderstate"
  belongs_to :panswtime, class_name: "Ourtime"
  belongs_to :pshiptime, class_name: "Ourtime"
  belongs_to :rezpricetype, class_name: "Moneytype"

  def checkstate
    if self.state!=Orderstate.find_by(state: "Отказ в резерве")
      if self.doner_id!=nil && self.panswtime_id!=nil
        if self.distrib!=nil && self.reztime!=nil && self.beznal!=nil && self.nds!=nil && self.rezprice!=nil && self.rezpricetype_id!=nil && self.shipprice!=nil && self.pshiptime_id!=nil && self.convertion!=nil
          self.state=Orderstate.find_by(state: "Зарезервировано")
        else
          self.state=Orderstate.find_by(state: "Принято в ОЗ")
        end
      else
        self.state=Orderstate.find_by(state: "Передано в ОЗ")
      end
      self.save
    end
    self.updatemargin
    self.order!=nil ? self.order.checkstate : ""
  end

  def updatemargin
    if self.psaleprice!=nil && self.psaleprice!="" && self.rezprice!=nil && self.rezprice!=""
      self.beznal!=nil ? @rasbeznal=self.rezprice*self.beznal/100 : @rasbeznal=0
      self.convertion!=nil ? @rasconver=self.rezpriceinru*self.convertion/100 : @rasconver=0
      if self.psaleprice!=nil && self.rezpriceinru!=nil && self.qty!=nil && self.shipprice!=nil
        self.pmargin = (self.psaleprice-self.rezpriceinru-@rasbeznal-@rasconver)*self.qty-self.shipprice
      end
      self.save
    end
  end

  def rezpriceinru
    if self.rezpricetype!=nil && self.rezprice!=nil
      @rpriceinru=self.rezprice*self.rezpricetype.curse
    else
      @rpriceinru=0
    end
  end

  def rashod
    self.convertion!=nil ? @rashod=self.rezpriceinru+self.rezpriceinru*self.convertion/100 : @rashod=self.rezpriceinru
    self.shipprice!=nil ? @rashod+=self.shipprice : @rashod
    self.beznal!=nil ? @rashod+=self.beznal : @rashod
    @rashod
  end
end
