class InvalidFilePath < StandardError
  def initialize(msg = 'File does not exist')
    super
  end
end

class MissingBitmap < StandardError
  def initialize(msg = 'create a bitmap before trying to modify it.')
    super
  end
end

class OutOfRange < StandardError
  def initialize(msg = 'The pixel you are trying to reach is out of range.')
    super
  end
end

class BadNumberArguments < StandardError
  def initialize(given, expected)
    super("Wrong number of arguments (#{given} given, #{expected} expected).")
  end
end

class InvalidArguments < StandardError
  def initialize(msg = 'The command does not have the correct arguments.')
    super
  end
end

class InvalidCommand < StandardError
  def initialize(cmd)
    super("The command '#{cmd}' does not exist.")
  end
end