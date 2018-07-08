require 'bitmap-editor'
require 'parser'

describe Parser do

  let(:bitmap_editor)  { BitmapEditor.new }

  subject { Parser.new(bitmap_editor) }

  describe ".initialize" do

    it { expect(subject.bitmap_editor).to eq(bitmap_editor) }

  end

  describe "#parse" do

    context "when the command is valid" do

      it { expect(subject.parse("I 5 6")).to     be_a(Commands::Create) }
      it { expect(subject.parse("S")).to         be_a(Commands::Show) }
      it { expect(subject.parse("V 1 2 3 J")).to be_a(Commands::VerticalDraw) }
      it { expect(subject.parse("H 1 2 3 J")).to be_a(Commands::HorizontalDraw) }
      it { expect(subject.parse("C")).to         be_a(Commands::Clear) }

    end

    context "when the command is invalid" do

      it { expect { subject.parse("FOO") }.to raise_error(InvalidCommand) }

    end

  end

end