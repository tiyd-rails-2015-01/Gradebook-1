class Student < ActiveRecord::Base
  has_secure_password

  has_many :parents
  has_and_belongs_to_many :achievements
  belongs_to :teacher

  def self.get_all_children_for_student_id(student_id)
    students_children = []

    self.all.each do |student|
      if student.id == student_id
        students_children << student
      end
    end

    return students_children
  end


  def self.get_all_children_for_teacher_id(teacher_id)
    teachers_children = []

    self.all.each do |student|
      if student.teacher_id == teacher_id
        teachers_children << student
      end
    end

    return teachers_children
  end


  def self.get_all_children
    children = []

    self.all.each do |sort|
      children << sort.name
    end
    return children
  end


  def self.get_all_children_email_pairs
    pair = []

    self.all.each do |sort|
      pair << [sort.name,sort.student_email]
    end
    return pair
  end

  # def get_all_children_for_student_id(student_id)
  #   achievements = []
  #   self.all.each do |achievement|
  #     if achievement.student_id == student_id
  #       achievement << achievement
  #     end
  #   end
  #   return achievements
  # end

end
