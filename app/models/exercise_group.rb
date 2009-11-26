class ExerciseGroup < ActiveRecord::Base
  
  belongs_to :course_instance

    #has_many :registrations

  #  has_many :registered_to_this_group,
   #   :through => :registrations,
   #   :source => :user
  
end
