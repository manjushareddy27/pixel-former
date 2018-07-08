require 'commands/horizontal_draw'
require 'bitmap-editor'

describe Commands::HorizontalDraw do

  let(:x1) { "1" }
  let(:x2) { "1" }
  let(:y)  { "1" }
  let(:colour) { "Z" }
  let(:bitmap_editor)    { BitmapEditor.new }

  context "when a bitmap is already created" do
    before do
      Commands::Create.new(bitmap_editor, 3, 2).execute
    end
    subject { Commands::HorizontalDraw.new(bitmap_editor, x1, x2, y, colour) }

    describe ".initialize" do
      it { expect(subject.x1).to eq(x1.to_i) }
      it { expect(subject.x2).to eq(x2.to_i) }
      it { expect(subject.y).to  eq(y.to_i) }
      it { expect(subject.colour).to eq(colour) }
      it { expect(subject.bitmap_editor).to eq(bitmap_editor) }
    end 

    describe "#execute" do
      before do
        subject.execute
      end
      it { expect(bitmap_editor.bitmap[x1.to_i, y.to_i]).to eq(colour) }
      it { expect(bitmap_editor.bitmap[x2.to_i, y.to_i]).to eq(colour) }
    end

    describe ".create" do
      context "when correct arguments" do
        subject { Commands::HorizontalDraw.create(bitmap_editor, x1, x2, y, colour) }
        it { expect(subject).to be_a(Commands::HorizontalDraw) }
        it { expect(subject.x1).to eq(x1.to_i) }
        it { expect(subject.x2).to eq(x2.to_i) }
        it { expect(subject.y).to eq(y.to_i) }
        it { expect(subject.colour).to eq(colour) }
      end

      context "when bad number of arguments" do
        it { expect { Commands::HorizontalDraw.create(bitmap_editor, x1) }.to raise_error(BadNumberArguments) }
      end
    end

  end
end