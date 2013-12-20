class Student < ActiveRecord::Base
  attr_accessible :student_type
  def eligible?
    student_type == "RIT" || student_type == "NTID"
  end
end
