class Levelname < ActiveRecord::Base
  has_many :levels, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true
end
