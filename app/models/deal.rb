class Deal < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :dealings, dependent: :destroy
  has_many :groups, through: :dealings
  validates :name, presence: true, uniqueness: true
  validates :amount, presence: true
  has_many :comments, dependent: :destroy

  #   def self.recent_deals
  #     all.filter { |e| e.created_at  <= Time.now + 360.minutes }
  #   end

  #   def self.past_deals
  #     all.filter { |e| (e.created_at + 720.minutes) < Time.now}
  #   end

  #   scope :recent_deals, ->(date) { where('created_at < ?', date) }
  #   scope :past_deals, ->(date) { where('created_at < ?', date) }
end
