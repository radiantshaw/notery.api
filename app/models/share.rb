class Share < ApplicationRecord
  enum permission: [:contributing, :reading]

  belongs_to :note
  belongs_to :user

  delegate :email, to: :user
end