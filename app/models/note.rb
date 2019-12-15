class Note < ApplicationRecord
  belongs_to :user
  has_many :shares, dependent: :delete_all
  has_many :contributing_shares, lambda { where(permission: :contributing) }, class_name: :Share
  has_many :reading_shares, lambda { where(permission: :reading) }, class_name: :Share
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
    shares.find_or_initialize_by(user: user).tap do |share|
      share.permission = permission
    end
  end
end