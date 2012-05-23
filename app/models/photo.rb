class Photo < ActiveRecord::Base
  attr_accessible :content, :image, :user_id
  has_attached_file :image, 
		    :styles => {:side => "204x204", 
				:medium => "300x300", 
				:thumb => "100x100" },
	:s3_credentials => "::Rails.root/config/s3.yml",
        :path => "http://sillydaddy.herokuapp.com/:attachment/:style/:id.:extension"
  
  has_many :votes
  belongs_to :user
  
  validates :user_id, presence: true
  validates_attachment :image, presence: true
  validates :content, length: { maximum: 140 }

  default_scope order: 'photos.created_at DESC'
end

