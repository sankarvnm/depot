class Product < ActiveRecord::Base
	attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
	default_scope :order => 'title'
	validates :title, :description, :presence => true
	validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
	#validates :title, :uniqueness => true
	
	has_attached_file :image, :styles => { :small => "100x100#", :large => "500x500>" }, :processors => [:cropper]
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :reprocess_image, :if => :cropping?
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
  
  def image_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(image.path(style))
  end
  
  private
  
  def reprocess_image
    image.reprocess!
  end
  

end
