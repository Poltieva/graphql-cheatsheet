class Types::UserType < Types::BaseObject
  description 'Returns the current user'

  field :email, String, null: true
  field :password, String, null: true

  # Visibility control - hide certain parts of schema if conditions are unmet
  # In this case, UserType will not be visible in documentation to requests without authentication header
  def self.visible?(context)
    !!context[:current_user]
  end

  # Authorization
  def authorized?(object, context)
    !!object.is_superadmin
  end
  # If you use .visible?, it will appear to the client that unauthorized parts of the schema don't exist at all.
  # If you use .authorized?, you can provide custom error messages for the client. Also, inside authorized?, you have access to the actual objects being accessed by GraphQL.
end
