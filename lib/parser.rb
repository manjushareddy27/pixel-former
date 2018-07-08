require './lib/commands/create'
require './lib/commands/set_pixel'
require './lib/commands/show'
require './lib/commands/vertical_draw'
require './lib/commands/horizontal_draw'
require './lib/commands/clear'
require './lib/errors'

class Parser
  attr_reader :bitmap_editor

  def self.commands
    {
      "I" => "Create",
      "S" => "Show",
      "L" => "SetPixel",
      "V" => "VerticalDraw",
      "H" => "HorizontalDraw",
      "C" => "Clear"
    }
  end

  Parser.commands.each do |c, v|    
    define_method("pixel_former_#{c}") do |*args|
      Commands.const_get("#{v}").create(@bitmap_editor, *args)
    end
  end

  def initialize(bitmap_editor)
    @bitmap_editor = bitmap_editor
  end

  def parse(str)
    args = str.split
    cmd = args.shift
    fail InvalidCommand, cmd unless Parser.commands.has_key?(cmd)
    public_send("pixel_former_#{cmd}", *args)
  end
end