class Field < ActiveRecord::Base
  has_many :levels, dependent: :destroy
end
