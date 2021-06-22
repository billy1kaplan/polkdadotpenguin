require 'graphql'
require_relative 'mutations/create_friend'

class MutationType < GraphQL::Schema::Object
  description 'The mutation root of this schema'

  field :createFriend, mutation: Mutations::CreateFriend
end
