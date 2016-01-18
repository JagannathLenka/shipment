class CreateShipmentDetails < ActiveRecord::Migration
  def change
    create_table :shipment_details do |t|
      t.string :shipment
      t.string :shipment_type
      t.string :shipment_carrier

      t.timestamps null: false
    end
  end
end
