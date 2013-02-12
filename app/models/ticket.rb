class Ticket < ActiveRecord::Base
  belongs_to :users
  has_many :statuses
  belongs_to :projects
end
