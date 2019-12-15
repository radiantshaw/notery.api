class Note < ApplicationRecord
  belongs_to :user
  has_many :shares
  has_many :contributors, lambda { where("shares.type": :contributing) }, {
    through: :shares,
    source: :user
  }
  has_many :readers, lambda { where("shares.type": :reading) }, {
    through: :shares,
    source: :user
  }
end