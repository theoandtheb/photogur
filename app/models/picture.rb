class Picture < ActiveRecord::Base
  def change
    create_table :pictures do |t|
      t.string :artist
      t.string :title
      t.string :url

      t.timestamps
    end
  end

  scope :newest_first, -> { order("created_at DESC") }
  scope :most_recent_three, -> { newest_first.limit(3) }

def self.created_before(time)
  where("created_at > ?", time)
end

end
