class AddCommentableToComment < ActiveRecord::Migration[5.2]
  def change
     add_reference :comments, :commentable, polymorphic: true, index: true
  end
end
