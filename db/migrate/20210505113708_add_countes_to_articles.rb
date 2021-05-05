class AddCountesToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :countes, :integer, :default => 0
  end
end
