class CreateSolicitudesServicios < ActiveRecord::Migration
  def change
    create_table :solicitudes_servicios do |t|
      t.references :cliente
      t.string :direccion
      t.references :barrio
      t.string :telefono
      t.string :observaciones
      t.references :ofertado


      t.timestamps
    end
    add_index :solicitudes_servicios, :cliente_id
    add_index :solicitudes_servicios, :barrio_id
    add_index :solicitudes_servicios, :ofertado_id
  end
end
