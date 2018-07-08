require './lib/parser'

class BitmapEditor
  attr_accessor :bitmap
  attr_reader   :parser, :cmd_mgr

  # The maximum allowed cmd to stack
  Max_COMMANDS = 10

  def initialize
    @bitmap = nil
    @parser = Parser.new(self)
    @cmd_data = []
  end

  def run(file)
    fail InvalidFilePath.new if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      parse_line(line.chomp)     
    end
  end

  def parse_line(line)
    cmd = @parser.parse(line)
    cmd.execute

    @cmd_data.push(cmd)
    @cmd_data.shift if @cmd_data.size > Max_COMMANDS

    rescue StandardError => e
      puts e.message
    end
end
