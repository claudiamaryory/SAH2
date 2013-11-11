# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131104234611) do

  create_table "barrios", :force => true do |t|
    t.string   "nombre"
    t.integer  "municipio_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "barrios", ["municipio_id"], :name => "index_barrios_on_municipio_id"

  create_table "calificaciones_servicios", :force => true do |t|
    t.integer  "cliente_id"
    t.integer  "tipo_calificacion_id"
    t.text     "observaciones"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "calificaciones_servicios", ["cliente_id"], :name => "index_calificaciones_servicios_on_cliente_id"
  add_index "calificaciones_servicios", ["tipo_calificacion_id"], :name => "index_calificaciones_servicios_on_tipo_calificacion_id"

  create_table "clientes", :force => true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "documento"
    t.string   "direccion"
    t.integer  "barrio_id"
    t.integer  "municipio_id"
    t.string   "telefono"
    t.string   "celular"
    t.string   "email"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "clientes", ["barrio_id"], :name => "index_clientes_on_barrio_id"
  add_index "clientes", ["municipio_id"], :name => "index_clientes_on_municipio_id"

  create_table "empleados", :force => true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "documento"
    t.string   "telefono"
    t.string   "celular"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
  end

  create_table "estados", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "municipios", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ofertados", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reprogramaciones", :force => true do |t|
    t.time     "hora"
    t.date     "fecha"
    t.integer  "solicitud_servicio_id"
    t.text     "observacion"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "reprogramaciones", ["solicitud_servicio_id"], :name => "index_reprogramaciones_on_solicitud_servicio_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "servicios", :force => true do |t|
    t.date     "fecha"
    t.time     "hora"
    t.integer  "empleado_id"
    t.integer  "solicitud_servicio_id"
    t.integer  "cliente_id"
    t.integer  "estado_id"
    t.integer  "ofertado_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "servicios", ["cliente_id"], :name => "index_servicios_on_cliente_id"
  add_index "servicios", ["empleado_id"], :name => "index_servicios_on_empleado_id"
  add_index "servicios", ["estado_id"], :name => "index_servicios_on_estado_id"
  add_index "servicios", ["ofertado_id"], :name => "index_servicios_on_ofertado_id"
  add_index "servicios", ["solicitud_servicio_id"], :name => "index_servicios_on_solicitud_servicio_id"

  create_table "solicitudes_servicios", :force => true do |t|
    t.integer  "cliente_id"
    t.string   "direccion"
    t.integer  "barrio_id"
    t.string   "telefono"
    t.string   "observaciones"
    t.integer  "ofertado_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "solicitudes_servicios", ["barrio_id"], :name => "index_solicitudes_servicios_on_barrio_id"
  add_index "solicitudes_servicios", ["cliente_id"], :name => "index_solicitudes_servicios_on_cliente_id"
  add_index "solicitudes_servicios", ["ofertado_id"], :name => "index_solicitudes_servicios_on_ofertado_id"

  create_table "tipos_calificaciones", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",                        :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
