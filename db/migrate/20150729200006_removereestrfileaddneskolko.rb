class Removereestrfileaddneskolko < ActiveRecord::Migration
  def up
    remove_column :reestrprihodovs, :reestrfile
    remove_column :reestrotgruzoks, :reestrfile
    add_column :reestrprihodovs, :scrschet, :string
    add_column :reestrprihodovs, :scrschetfaktura, :string
    add_column :reestrprihodovs, :scrnakladnaia, :string
    add_column :reestrprihodovs, :scrnakladnaiawshtamp, :string
    add_column :reestrotgruzoks, :scrschet, :string
    add_column :reestrotgruzoks, :scrschetfaktura, :string
    add_column :reestrotgruzoks, :scrnakladnaia, :string
    add_column :reestrotgruzoks, :scrnakladnaiawshtamp, :string
  end
  def down
    add_column :reestrprihodovs, :reestrfile
    add_column :reestrotgruzoks, :reestrfile
    remove_column :reestrprihodovs, :scrschet, :string
    remove_column :reestrprihodovs, :scrschetfaktura, :string
    remove_column :reestrprihodovs, :scrnakladnaia, :string
    remove_column :reestrprihodovs, :scrnakladnaiawshtamp, :string
    remove_column :reestrotgruzoks, :scrschet, :string
    remove_column :reestrotgruzoks, :scrschetfaktura, :string
    remove_column :reestrotgruzoks, :scrnakladnaia, :string
    remove_column :reestrotgruzoks, :scrnakladnaiawshtamp, :string
  end
end
