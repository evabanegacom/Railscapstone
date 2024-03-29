class Group < ApplicationRecord
  belongs_to :user
  has_one_attached :icon, dependent: :destroy
  has_many :dealings, dependent: :destroy
  has_many :deals, through: :dealings
  validates :name, presence: true, uniqueness: true, length: { maximum: 20,
                                                               too_long: '20 characters in name is the maximum allowed.' } # rubocop:disable Layout/LineLength: Line is too long
  validate :icon_type

  private

  def icon_type
    errors.add(:icon, 'is missing') if icon.attached? == false
    if icon.attached? == true
      unless icon.content_type.in?(%('image/jpg image/jpeg image/png image/ico'))
        errors.add(:icon, 'needs to be ajpeg or png or ico')
      end
    end
  end
end
