class Friend < ActiveRecord::Base
  validates :name, presence: true
end
