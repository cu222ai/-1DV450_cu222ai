class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  belongs_to :project

   attr_accessible :name, :description, :status_id, :project_id
end
