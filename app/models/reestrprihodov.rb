class Reestrprihodov < ActiveRecord::Base
  mount_uploader :reestrfile, ReestrfileUploader
end
