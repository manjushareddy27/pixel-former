require 'commands/vertical_draw'
require 'bitmap-editor'

describe Commands::VerticalDraw do

  let(:x)  { "2" }
  let(:y1) { "1" }
  let(:y2) { "3" }
  let(:colour) { "W" }
  let(:bitmap_editor)    { BitmapEditor.new }

  context "when a bitmap is already created" do

    before do
      Commands::Create.new(bitmap_editor, 2, 3).execute
    end

    subject { Commands::VerticalDraw.new(bitmap_editor, x, y1, y2, colour) }

    describe ".initialize" do

      it { expect(subject.x).to eq(x.to_i) }
      it { expect(subject.y1).to eq(y1.to_i) }
      it { expect(subject.y2).to eq(y2.to_i) }
      it { expect(subject.colour).to eq(colour) }
      it { expect(subject.bitmap_editor).to eq(bitmap_editor) }

    end

    describe "#execute" do

      before do
        subject.execute
      end

      it { expect(bitmap_editor.bitmap[x.to_i, y1.to_i]).to eq(colour) }
      it { expect(bitmap_editor.bitmap[x.to_i, y2.to_i]).to eq(colour) }

    end

    describe ".create" do

      context "when correct arguments" do
        subject { Commands::VerticalDraw.create(bitmap_editor, x, y1, y2, colour) }
        it { expect(subject).to be_a(Commands::VerticalDraw) }
        it { expect(subject.x).to eq(x.to_i) }
        it { expect(subject.y1).to eq(y1.to_i) }
        it { expect(subject.y2).to eq(y2.to_i) }
        it { expect(subject.colour).to eq(colour) }
      end

      context "when bad number of arguments" do
        it { expect { Commands::VerticalDraw.create(bitmap_editor, x) }.to raise_error(BadNumberArguments) }
      end

      context "when bad type of arguments" do
        it { expect { Commands::VerticalDraw.create(bitmap_editor, "foo", y1, y2, colour) }.to raise_error(InvalidArguments) }
        it { expect { Commands::VerticalDraw.create(bitmap_editor, x, "foo", y2, colour) }.to raise_error(InvalidArguments) }
        it { expect { Commands::VerticalDraw.create(bitmap_editor, x, y1, "foo", colour) }.to raise_error(InvalidArguments) }
        it { expect { Commands::VerticalDraw.create(bitmap_editor, x, y1, y2, "foo") }.to raise_error(InvalidArguments) }
      end
    end

  end
end