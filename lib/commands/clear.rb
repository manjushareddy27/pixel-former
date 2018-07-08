require './lib/pixel_former'

module Commands
  class Clear < ::PixelFormer

    def self.create(bitmap_editor, *args)
      fail BadNumberArguments.new(args.length, 0) unless args.empty?
      new(bitmap_editor)
    end

    def execute
      fail MissingBitmap if bitmap_editor.bitmap.nil?
      bitmap_editor.bitmap.clear
    end
  end
end