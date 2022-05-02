
class Mutations::UpdateAuthor < GraphQL::Schema::Mutation
  argument :author, Types::AuthorInputType, required: true
  def resolve(author:)
    Author.where(id: author[:id]).first&.update(author.to_h)
  end
end
