class Level < ActiveRecord::Base
  belongs_to :field
  belongs_to :levelname
  has_many :projects, dependent: :destroy
  validates :mintariff, presence: true, numericality: {greater_than: 0, less_than: :maxtariff, }
  validates :maxtariff, presence: true, numericality: {greater_than: 0, greater_than: :mintariff, }
  validates :levelname_id, presence: true, uniqueness: true
end
