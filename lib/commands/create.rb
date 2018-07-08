require './lib/pixel_former'
require './lib/bitmap'
require './lib/str_validator'

module Commands
  class Create <::PixelFormer
    attr_reader :width, :height

    def initialize(bitmap_editor, width, height)
      super(bitmap_editor)
      @width  = width.to_i
      @height = height.to_i
    end

    def self.create(bitmap_editor, *args)
      fail BadNumberArguments.new(args.length, 2) if args.length != 2
      fail InvalidArguments unless StringValidator.is_i?(args[0]) && StringValidator.is_i?(args[1])
      new(bitmap_editor, *args)
    end

    # Create the Bitmap object.
    def execute
      bitmap_editor.bitmap = Bitmap.new(@width, @height)
    end
  end
end