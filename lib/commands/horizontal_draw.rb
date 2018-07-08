require './lib/pixel_former'
require './lib/str_validator'

module Commands
  class HorizontalDraw <::PixelFormer
    attr_reader :x1, :x2, :y, :colour

    def initialize(bitmap_editor, x1, x2, y, colour)
      super(bitmap_editor)
      @x1 = x1.to_i
      @x2 = x2.to_i
      @y = y.to_i
      @colour = colour
    end

    def execute
      fail MissingBitmap if bitmap_editor.bitmap.nil?
      (x1..x2).each do |x|
        bitmap_editor.bitmap[x, y] = colour
      end
    end

    def self.create(bitmap_editor, *args)
      fail BadNumberArguments.new(args.length, 4) if args.length != 4
      fail InvalidArguments unless StringValidator.is_i?(args[0]) && StringValidator.is_i?(args[1]) &&
                                   StringValidator.is_i?(args[2]) && StringValidator.is_colour?(args[3])
      new(bitmap_editor, *args)
    end
  end
end