class Post < ActiveRecord::Base
  validates :name, :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5 }

  # this says comments will die with posts
  has_many :comments, :dependent => :destroy
  # tags live on, but
  has_many :tags
  
  # if a tag is destroyed, all post will lose that tag
  accepts_nested_attributes_for :tags, :allow_destroy => true,
    :reject_if => proc {|attrs| attrs.all? {|k,v| v.blank?}}
end

