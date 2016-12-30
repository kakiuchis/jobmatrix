class Level < ActiveRecord::Base
  belongs_to :field
  belongs_to :levelname
  has_many :projects, dependent: :destroy
  validates :mintariff, presence: true
  validates :maxtariff, presence: true
end
