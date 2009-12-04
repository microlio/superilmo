class Course < ActiveRecord::Base
  
  has_many :course_instances, :dependent => :destroy

  named_scope :all_in_order, :order => "created_at DESC"
  
  validates_length_of :name, :in=>3..50
  validates_length_of :description, :in=>3..255
  
  
  after_create :update_newsfeed

    private

    def update_newsfeed
      Newsfeed.course_added(self)
    end
end
