class Tour < ActiveRecord::Base
  belongs_to :tournament
  has_and_belongs_to_many :pilots, :join_table => :rounds


  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |tour|
        csv << tour.attributes.values_at(*column_names)
      end
    end
  end
end
