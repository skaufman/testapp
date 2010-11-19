class Project < ActiveRecord::Base
  has_many :tickets
  has_many :permissions, :as => :thing
  validates :name, :presence => true
  
  scope :readable_by, lambda {|user| joins(:permissions).where(:permissions => {:action => "view", :user_id => user.id})}

  def self.for(current_user)
    current_user.admin? ? Project : Project.readable_by(current_user)
  end
  
end
