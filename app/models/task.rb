class Task < ApplicationRecord

  validates_presence_of :title
  validates_presence_of :description

  scope :incomplete, -> { where(:completed => nil) }
  scope :complete, -> { where.not(:completed => nil) }
end
