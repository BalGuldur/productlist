class Reestrprihodov < ActiveRecord::Base
  mount_uploader :scrschet, ReestrfileUploader
  mount_uploader :scrschetfaktura, ReestrfileUploader
  mount_uploader :scrnakladnaia, ReestrfileUploader
  mount_uploader :scrnakladnaiawshtamp, ReestrfileUploader
end
