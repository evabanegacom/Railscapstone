class Group < ApplicationRecord
  belongs_to :user
  has_one_attached :icon, dependent: :destroy
  has_many :dealings, dependent: :destroy
  has_many :deals, through: :dealings
  validates :name, presence: true
  validate :icon_type

  
  private
  def icon_type
    if icon.attached? == false
      errors.add(:icon, 'is missing')
    end
    if icon.attached? == true
     if !icon.content_type.in?(%('image/jpg image/jpeg image/png image/ico'))
       errors.add(:icon, 'needs to be ajpeg or png or ico')
     end
    end
  end
end
