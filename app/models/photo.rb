class Photo < ActiveRecord::Base
  attr_accessible :content, :image, :user_id
  has_attached_file :image, :styles => {:side => "220x220", :medium => "300x300", :thumb => "100x100" }
  
  has_many :votes
  belongs_to :user
  
  validates :user_id, presence: true
  validates_attachment :image, presence: true
  validates :content, length: { maximum: 140 }

  default_scope order: 'photos.created_at DESC'
end
