class Entry < ActiveRecord::Base
  belongs_to :user
  validates :name, :definition, presence: true
end
