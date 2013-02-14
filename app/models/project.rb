class Project < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :tickets

  attr_accessible  :name, :description, :start_date, :end_date, :user_ids

   validates :name,
   :presence => {:message => "You need to specify a name"},
    :length => {:minimum => 6, :message => "A project has to have atleast 6 characters"}

     validates :description,
   :presence => {:message => "You need to specify a description"},
    :length => {:minimum => 6, :message => "A description has to have atleast 6 characters"}

      validate :end_date_cannot_be_less_then_start_date

private
def end_date_cannot_be_less_then_start_date
errors.add(:end_date, "can't be less than the start date") if
      !end_date.blank? and end_date < start_date
end

end
