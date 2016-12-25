class Level < ActiveRecord::Base
  belongs_to :field
  has_many :projects, dependent: :destroy
end
