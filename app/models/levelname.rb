class Levelname < ActiveRecord::Base
  has_many :levels, dependent: :destroy
  validates :name, presence: true
end
