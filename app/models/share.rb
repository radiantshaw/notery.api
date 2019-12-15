class Share < ApplicationRecord
  enum type: [:contributing, :reading]

  belongs_to :note
  belongs_to :user
end