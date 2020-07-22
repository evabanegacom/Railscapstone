class Deal < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :dealings, dependent: :destroy
  has_many :groups, through: :dealings
  validates :name, presence: true, length: { maximum: 20,
                                             too_long: '20 characters in name is the maximum allowed.' }
  validates :amount, presence: true
  has_many :comments, dependent: :destroy
  validate :uniqueness_of_name_and_author

  default_scope { order('created_at DESC') }
  private

  def uniqueness_of_name_and_author
    errors.add(:name, 'must be unique') if author.deals.where(name: name).exists?
  end
  
end
