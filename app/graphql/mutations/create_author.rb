class Mutations::CreateAuthor < GraphQL::Schema::Mutation
  null true

  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :yob, Integer, required: false
  argument :is_alive, Boolean, required: false

  # argument :author, Types::AuthorInputType, required: true
  # def resolve(author:)
  def resolve(first_name:, last_name:, yob: 2, is_alive: false)
    Author.create(first_name: first_name, last_name: last_name, yob: yob, is_alive: is_alive)
  end
end
