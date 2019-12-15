class Note < ApplicationRecord
  belongs_to :user
  has_many :shares, dependent: :delete_all
  has_many :interactors, through: :shares, source: :user
  has_many :contributors, lambda { where("shares.permission": :contributing) }, {
    through: :shares,
    source: :user
  }
  has_many :readers, lambda { where("shares.permission": :reading) }, {
    through: :shares,
    source: :user
  }

  def share(user, permission)
    share = shares.first_or_initialize(user: user)
    share.permission = permission
    share.save
  end
end