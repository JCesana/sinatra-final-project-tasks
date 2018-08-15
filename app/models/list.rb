class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  validates :name, presence: true

  def slug
    self.name.gsub(' ', '-').downcase
  end

  def self.find_by_slug(slug)
    self.all.detect do |list|
      user.slug == slug
    end
  end
end
