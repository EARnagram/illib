class CreateComicsUsers < ActiveRecord::Migration
  def change
    create_table :comics_users, id: false do |t|
      t.belongs_to :user, index:true
      t.belongs_to :comic, index:true
    end
  end
end
