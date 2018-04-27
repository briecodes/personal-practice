class CreateAccounts < ActiveRecord::Migration
	def change
		create_table :accounts do |t|
			t.integer :balance
			t.integer :person_id
			t.integer :bank_id
		end
	end
end