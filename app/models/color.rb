class Color < ActiveRecord::Base
  def self.attcheck(parametr)
    @color=Color.find_by(name: "attention")
    @param=parametr
    if @param==""||@param==nil
      @color.hex
    else
      ""
    end
  end

end
