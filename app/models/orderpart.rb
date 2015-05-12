class Orderpart < ActiveRecord::Base
  belongs_to :order
  belongs_to :doner, class_name: "Employee"
  belongs_to :state, class_name: "Orderstate"
  belongs_to :panswtime, class_name: "Ourtime"
  belongs_to :reztime, class_name: "Ourtime"
  belongs_to :pshiptime, class_name: "Ourtime"
  belongs_to :rezpricetype, class_name: "Moneytype"

  def checkstate
    if self.state!=Orderstate.find_by(state: "Отказ в резерве")
      if self.doner_id!=nil && self.panswtime_id!=nil
        if self.distrib!=nil && self.reztime_id!=nil && self.beznal!=nil && self.nds!=nil && self.rezprice!=nil && self.rezpricetype_id!=nil && self.shipprice!=nil && self.pshiptime_id!=nil && self.convertion!=nil
          self.state=Orderstate.find_by(state: "Зарезервировано")
        elsif
          self.state=Orderstate.find_by(state: "Принято в ОЗ")
        end
      end
      self.save
    end
    self.updatemargin
  end

  def updatemargin
    if self.psaleprice!=nil && self.rezprice!=nil
      self.beznal!=nil ? @rasbeznal=self.rezprice*self.beznal/100 : @rasbeznal=0
      if self.rezpricetype!=nil
        @rezpriceinru=self.rezprice*self.rezpricetype.curse
      end
      self.convertion!=nil ? @rasconver=@rezpriceinru*self.convertion/100 : @rasconver=0
      self.pmargin = (self.psaleprice-@rezpriceinru-@rasbeznal-@rasconver)*self.qty-self.shipprice
      self.save
    end
  end

end
