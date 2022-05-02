module Types
  class MutationType < Types::BaseObject

    # first way to make mutations on rails - all in this file
    field :create_author, Types::AuthorType, null: true, description: 'Creates one author' do
      argument :first_name, String, required: true
      argument :last_name, String, required: true
      argument :yob, Integer, required: false
      argument :is_alive, Boolean, required: false
    end

    def create_author(first_name:, last_name:, yob: 2, is_alive: false)
      Author.create(first_name: first_name, last_name: last_name, yob: yob, is_alive: is_alive)
    end


    # second way to write mutations - all in separate files
    field :create_author, Types::AuthorType, mutation: Mutations::CreateAuthor
    field :update_author, Boolean, mutation: Mutations::UpdateAuthor
  end
end
