class Bitmap
  attr_reader :width, :height

  def initialize(width, height)
    @width = width.to_i
    @height = height.to_i
    clear
  end

  def size
    width * height
  end

  def data
    @data ||= "O" * size
  end

  def data=(str)
    @data = str
  end

  def clear
    @data = "O" * size
  end

  def []=(x, y, c)
    fail OutOfRange unless !(x < 1 || y < 1 || x > width || y > height)
    data[index(x, y)] = c
  end

  def [](x, y)
    fail OutOfRange unless !(x < 1 || y < 1 || x > width || y > height)
    data[index(x, y)]
  end

  def index(x, y)
    (y - 1) * width + (x - 1)
  end
end