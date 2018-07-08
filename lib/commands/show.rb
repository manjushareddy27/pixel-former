require './lib/pixel_former'

module Commands
  class Show < ::PixelFormer
    def execute
      fail MissingBitmap if bitmap_editor.bitmap.nil?
      width = @bitmap_editor.bitmap.width
      height = @bitmap_editor.bitmap.height
      (1..height).each do |y|
        (1..width).each do |x|
          print @bitmap_editor.bitmap[x, y]
        end
        puts
      end
    end

    def self.create(bitmap_editor, *args)
      fail BadNumberArguments.new(args.length, 0) unless args.empty?
      new(bitmap_editor)
    end
  end
end