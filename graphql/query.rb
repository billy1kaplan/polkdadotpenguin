require 'graphql'
require_relative 'types/friend'

class QueryType < GraphQL::Schema::Object
  description 'The query root of this schema'

  field :friends, [Types::Friend], null: false do
    description 'Get all friends'
  end

  def friends
    Friend.all
  end
end
