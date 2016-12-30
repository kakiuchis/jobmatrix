class Project < ActiveRecord::Base
  belongs_to :level
  validates :content, presence: true
end
