class CourseInstance < ActiveRecord::Base
  belongs_to :course
  has_many :exercise_groups, :dependent => :destroy
  
  has_many :registrations, :through => :exercise_groups
end
