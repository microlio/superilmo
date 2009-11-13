class Course < ActiveRecord::Base
  validates_length_of :name, :in=>3..50
  validates_length_of :description, :in=>3..255
end
