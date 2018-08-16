class Task < ActiveRecord::Base
  belongs_to :list

  validates :name, presence: true
  validates :list_id, presence: true

  def slug
    self.name.gsub(' ', '-').downcase
  end

  def self.find_by_slug(slug)
    self.all.detect do |task|
      task.slug == slug
    end
  end

end
