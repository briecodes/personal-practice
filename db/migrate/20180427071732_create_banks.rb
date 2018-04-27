class CreateBanks < ActiveRecord::Migration
	def create
		create_table :banks do |t|
			t.string :name
		end
	end
end