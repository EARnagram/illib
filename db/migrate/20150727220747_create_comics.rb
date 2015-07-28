class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :title
      t.string :series
      t.integer :issue_no
      t.boolean :loan
      t.string :checkin
      t.string :author
      t.string :publisher
      t.string :penciller
      t.string :inker
      t.string :colorist
      t.string :letterist
      t.date :publish_date
      t.string :img_url
      t.integer :print_num

      t.timestamps null: false
    end
  end
end
