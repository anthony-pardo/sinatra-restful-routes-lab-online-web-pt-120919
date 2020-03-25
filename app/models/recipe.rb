class Recipe < ActiveRecord::Base
  after_initialize :init

  def init
    self.cook_time  ||= 
  end
end