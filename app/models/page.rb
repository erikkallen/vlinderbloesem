class Page < ActiveRecord::Base
  has_attached_file :foto,  :styles => { :medium => "213" }, :processors => [:thumbnail]
end
