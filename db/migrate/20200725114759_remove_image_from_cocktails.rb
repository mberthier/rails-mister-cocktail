class RemoveImageFromCocktails < ActiveRecord::Migration[6.0]
  def change
    remove_column :cocktails, :image, :string
  end
end
