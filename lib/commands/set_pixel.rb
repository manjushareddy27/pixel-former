require './lib/pixel_former'

module Commands
  class SetPixel <::PixelFormer
    attr_reader :x, :y, :colour

    def initialize(bitmap_editor, x, y, colour)
      super(bitmap_editor)
      @x = x.to_i
      @y = y.to_i
      @colour = colour
    end

    def execute
      fail MissingBitmap if bitmap_editor.bitmap.nil?
      bitmap_editor.bitmap[x, y] = colour
    end

    def self.create(bitmap_editor, *args)
      fail BadNumberArguments.new(args.length, 3) if args.length != 3
      fail InvalidArguments unless StringValidator.is_i?(args[0]) && StringValidator.is_i?(args[1]) &&
                                   StringValidator.is_colour?(args[2])
      new(bitmap_editor, *args)
    end
  end
end