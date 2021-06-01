class ChangeClassroomReviewReferences < ActiveRecord::Migration[6.0]
  def change
    remove_reference :classrooms, :review
    add_reference :reviews, :classroom
  end
end
