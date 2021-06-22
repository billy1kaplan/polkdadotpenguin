require 'graphql'
require_relative 'query'
require_relative 'mutation'

class AppSchema < GraphQL::Schema
  query QueryType
  mutation MutationType
end
