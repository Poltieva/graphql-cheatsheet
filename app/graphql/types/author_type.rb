class Types::AuthorType < Types::BaseObject
  description 'One author'

  field :id, ID, null: false
  field :first_name, String, null: false,
        camelize: false # filed name will be first_name instead of firstName
  field :last_name, String, null: false
  field :yob, Integer, null: true
  field :is_alive, Boolean, null: true
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false

  # custom field form Author model
  field :full_name, String, null: false

  #custom field with field resolver
  field :name_full, String, null: false
  def name_full
    "#{object.last_name} #{object.first_name}"
  end

  # custom field with custom Type
  field :coordinates, Types::CoordinatesType, null: false

  # custom field which returns an array
  field :pub_years, [Integer], null: false

  # error handling
  field :errors, [Types::ErrorType], null: true

  def errors
    object.errors.map {|e| { field_name: e[:attribute], message: e.message } }
  end
end
#
# Input type when you have { "author" : { "first_name": "New" } } in variables
class Types::AuthorInputType < GraphQL::Schema::InputObject
  graphql_name 'AuthorInputType'
  description 'Author format to create/update'

  argument :id, ID, required: false
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :yob, Integer, required: false
  argument :is_alive, Boolean, required: false
end