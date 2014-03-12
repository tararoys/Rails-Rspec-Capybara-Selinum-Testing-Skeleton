class CreateKeyboards < ActiveRecord::Migration
  def change
    create_table :keyboards do |t|
      t.string :instrument_type

      t.timestamps
    end
  end
end
