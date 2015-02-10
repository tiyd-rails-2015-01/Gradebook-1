class Teacher < ActiveRecord::Base
  has_secure_password

  def self.classes
    classes = []

    self.all.each do |sort|
      classes << [sort.name, sort.id]
    end
    return classes
  end

  # def get_assignments_for_student_email(student_email)
  #   achievements = []
  #   self.all.each do |achievement|
  #     if achievement.student_email == student_email
  #       achievement << achievement
  #     end
  #   end
  #   return achievements
  # end
  #
  # def get_all_children_for_teacher_id
  #
  # end
  #

end
