class Level < ActiveRecord::Base
  belongs_to :field
  belongs_to :levelname
  has_many :projects, dependent: :destroy
  validates :mintariff, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :maxtariff, presence: true, numericality: {greater_than_or_equal_to: :mintariff}
  validates :levelname_id, presence: true
end
