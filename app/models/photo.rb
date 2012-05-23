class Photo < ActiveRecord::Base
  attr_accessible :content, :image, :user_id
  has_attached_file :image, 
		    :styles => {:side => "204x204", 
				:medium => "300x300", 
				:thumb => "100x100" },
    :storage => :s3,
    :bucket => ENV['S3_BUCKET_NAME'],
    :s3_credentials => {
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
  
  has_many :votes
  belongs_to :user
  
  validates :user_id, presence: true
  validates_attachment :image, presence: true
  validates :content, length: { maximum: 140 }

  default_scope order: 'photos.created_at DESC'
end

