class Client < ApplicationRecord

  validates_presence_of  :name, :owner_id

  belongs_to :owner
  has_many :campaigns

end
