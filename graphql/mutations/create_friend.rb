require 'graphql'
require_relative 'base_mutation'

class Mutations::CreateFriend < Mutations::BaseMutation
  description 'Creates a friend'

  argument :name, String, required: false
  argument :email, String, required: false

  field :success, Boolean, null: false
  field :errors, [String], null: false

  def resolve(name:, email:)
    friend = Friend.new(
      name: name,
      email: email
    )

    if friend.save
      {
        success: true,
        errors: []
      }
    else
      {
        success: false,
        errors: friend.errors.full_messages
      }
    end
  end
end
