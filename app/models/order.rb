class Order < ActiveRecord::Base
  belongs_to :manager, class_name: "Employee"
  belongs_to :doner, class_name: "Employee"
  belongs_to :orderstate

  has_many :orderparts

  def checkstate
      @zarez=0
      @otkazrez=0
      @prinvoz=0
      @peredvoz=0
      self.orderparts.each do |orderpart|
        orderpart.state.state == "Зарезервировано" ? @zarez=@zarez+1 : ""
        orderpart.state.state == "Отказ в резерве" ? @otkazrez=@otkazrez+1 : ""
        orderpart.state.state == "Принято в ОЗ" ? @prinvoz=@prinvoz+1 : ""
        orderpart.state.state == "Передано в ОЗ" ? @peredvoz=@peredvoz+1 : ""
      end
      if @prinvoz>0 || @peredvoz>0
        if @peredvoz>0 
          self.orderstate=Orderstate.find_by(state: "Передано в ОЗ")
        else
          self.orderstate=Orderstate.find_by(state: "Принято в ОЗ")
        end
      elsif @zarez>0
        if @otkazrez>0
          self.orderstate=Orderstate.find_by(state: "Зарезервировано частично")
        else
          self.orderstate=Orderstate.find_by(state: "Зарезервировано полностью")
        end
      elsif @otkazrez>0 && @zarez==0
        self.orderstate=Orderstate.find_by(state: "Отказано во всем")
      end
      self.save
      self.updatemargin
  end
  
  def updatemargin
    @summargin=0
    self.orderparts.each do |orderpart|
      if orderpart.state.state!="Отказ в резерве" && orderpart.state.state!="Удалено менеджером"
        orderpart.pmargin!=nil ? @summargin=@summargin+orderpart.pmargin : ""
      end
    end
    self.pmargin=@summargin
    self.save
  end
end
