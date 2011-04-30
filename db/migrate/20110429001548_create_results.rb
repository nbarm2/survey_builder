class CreateResults < ActiveRecord::Migration
  def self.up
    create_table :results do |t|
      t.integer :score
      t.integer :question_id

      t.timestamps
    end
    add_index :results, :question_id
  end

  def self.down
    drop_table :results
  end
end
