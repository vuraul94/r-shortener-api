class CreateShortUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :short_urls, id: false, primary_key: :short do |t|
      t.string :short
      t.string :url
      t.string :title
      t.integer :visits
      t.timestamps
    end
  end
end
