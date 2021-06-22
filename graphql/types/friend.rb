require 'graphql'
require_relative 'base_object'

class Types::Friend < Types::BaseObject
  field :id, ID, null: false
  field :name, String, null: false
  field :email, String, null: true
end
