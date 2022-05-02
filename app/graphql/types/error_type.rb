class Types::ErrorType < Types::BaseObject
  description 'ActiveRecord errors'

  field :field_name, String, null: false
  field :message, String, null: false
end
