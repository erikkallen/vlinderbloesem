module Paperclip
  #require 'RMagick'
  
  # Handles thumbnailing images that are uploaded.
  class RoundedCorners < Processor

    attr_accessor :current_geometry, :target_geometry, :format, :whiny, :convert_options

    # Creates a Thumbnail object set to work on the +file+ given. It
    # will attempt to transform the image into one defined by +target_geometry+
    # which is a "WxH"-style string. +format+ will be inferred from the +file+
    # unless specified. Thumbnail creation will raise no errors unless
    # +whiny+ is true (which it is, by default. If +convert_options+ is
    # set, the options will be appended to the convert command upon image conversion 
    def initialize file, options = {}, attachment = nil
      super
      geometry          = options[:geometry]
      @file             = file
      @crop             = geometry[-1,1] == '#'
      @target_geometry  = Geometry.parse geometry
      @current_geometry = Geometry.from_file @file
      @convert_options  = options[:convert_options]
      @radius           = options[:radius].nil? ? 10 : options[:radius]
      @whiny            = options[:whiny].nil? ? true : options[:whiny]
      @format           = options[:format]
      @corners          = options[:geometry] || "bottom"
      
      puts "CORNERS: #{options.inspect}"

      @current_format   = File.extname(@file.path)
      @basename         = File.basename(@file.path, @current_format)
    end

    # Performs the conversion of the +file+ into a thumbnail. Returns the Tempfile
    # that contains the new image.
    def make
      src = @file
       dst = Tempfile.new([@basename, @format].compact.join("."))
       dst.binmode
      img = Magick::Image.read(src.path).first
      
      dst << rounded_corners(img)

      dst
    end
    
    def rounded_corners(image)
      width = image.columns
      height = image.rows
      # create a masq of same size
      masq = Magick::Image.new(width, height)
      d = Magick::Draw.new
      # 10 is the corner's radius
      #d.roundrectangle(0, 0, width - 1, height - 1, 20, 20) 
      if @corners == "bottom"
        d.roundrectangle(0, 0, width - 1, height - 1, @radius/2, @radius/2) 
        d.rectangle(0, 0, width - 1, @radius/2)
      else
        d.roundrectangle(0, 0, width - 1, height - 1, @radius, @radius) 
      end
      d.draw(masq)
      tmp = image.composite!(masq, 0, 0, Magick::LightenCompositeOp)
      tmp.to_blob
    end
  end
end
