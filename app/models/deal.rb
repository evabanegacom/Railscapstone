class Deal < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :dealings, dependent: :destroy
  has_many :groups, through: :dealings
  validates :name, presence: true
  validates :amount, presence: true
  has_many :comments, dependent: :destroy

  validate :uniqueness_of_name_and_author

  def uniqueness_of_name_and_author
    errors.add(:name, 'must be unique') if author.deals.where(name: name).exists?
  end

  default_scope { order('created_at DESC') }
end
