module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :author, Types::AuthorType, null: true,
      description: 'Returns one author' do
      argument :id, ID, required: false
    end
    # respective function for the above field
    def author(id:)
      Author.find id
    end

    # root filed with custom type
    field :authors, [Types::AuthorType], null: true do
      argument :ids, [ID], required: false
    end
    def authors(ids: false)
      if ids
        Author.where(id: ids)
      else
        Author.all
      end
    end

    field :login, String, null: true, description: 'Authentication, returns session key' do
      argument :email, String, required: true
      argument :password, String, required: true
    end
    def login(email:, password:)
      if user = User.where(email: email).first&.authenticate(password)
        user.sessions.create.key
      end
    end

    field :current_user, Types::UserType, null: true
    def current_user
      context[:current_user]
    end

    field :logout, Boolean, null: false
    def logout
      Session.where(id: context[:session_id])&.destroy_all
    end
  end
end
