class Note < ApplicationRecord
  belongs_to :user
  has_many :shares
  has_many :contributors, lambda { where("shares.permission": :contributing) }, {
    through: :shares,
    source: :user
  }
  has_many :readers, lambda { where("shares.permission": :reading) }, {
    through: :shares,
    source: :user
  }
end