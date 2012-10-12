class RenameCorpAddressToDistributors < ActiveRecord::Migration
  def change
    rename_column :distributors, :crop_address, :corp_address
  end
end
