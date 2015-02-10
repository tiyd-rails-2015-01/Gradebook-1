class AchievementToStudentJoinTable < ActiveRecord::Migration
  def change
    create_table :achievements_students, id: false do |t|
      t.references :student
      t.references :achievement
    end
  end
end
