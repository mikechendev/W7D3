class Goal < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :details, :user_id
  validates :status, inclusion: { in: [true, false] }
end
