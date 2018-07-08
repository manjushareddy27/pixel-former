require './lib/pixel_former'

module Commands
  class VerticalDraw <::PixelFormer
    attr_reader :x, :y1, :y2, :colour

    def initialize(bitmap_editor, x, y1, y2, colour)
      super(bitmap_editor)
      @x = x.to_i
      @y1 = y1.to_i
      @y2 = y2.to_i
      @colour = colour
    end

    def execute
      fail MissingBitmap if bitmap_editor.bitmap.nil?
      (y1..y2).each do |y|
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