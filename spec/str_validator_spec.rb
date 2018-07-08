require './lib/str_validator'

describe StringValidator do
  
  describe ".is_i?" do

    it { expect(StringValidator.is_i?("42")).to eq(true) }
    it { expect(StringValidator.is_i?("FOO")).to eq(false) }

  end

  describe ".is_colour?" do

    it { expect(StringValidator.is_colour?("B")).to eq(true) }
    it { expect(StringValidator.is_colour?("b")).to eq(false) }
    it { expect(StringValidator.is_colour?("FOO")).to eq(false) }

  end

end