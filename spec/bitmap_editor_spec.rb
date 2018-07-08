require 'bitmap-editor'

describe BitmapEditor do

  subject { BitmapEditor.new }

  describe ".initialize" do
    it { expect(subject.bitmap).to eq(nil) }
    it { expect(subject.parser).to be_a(Parser) }
  end

  describe "#parse_line" do
    it { expect {subject.parse_line("I 5 5")}.to change { subject.bitmap }.from(nil).to kind_of(Bitmap) }
  end

end