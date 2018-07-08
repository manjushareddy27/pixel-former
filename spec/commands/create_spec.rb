require 'commands/create'
require 'bitmap-editor'

describe Commands::Create do

  let(:width)  { "2" }
  let(:height) { "2" }
  let(:bitmap_editor)    { BitmapEditor.new }

  subject { Commands::Create.new(bitmap_editor, width, height) }

  describe ".initialize" do
    it { expect(subject.width).to eq(width.to_i) }
    it { expect(subject.height).to eq(height.to_i) }
    it { expect(subject.bitmap_editor).to eq(bitmap_editor) }
  end

  describe ".create" do
    context "when correct arguments" do
      subject { Commands::Create.create(bitmap_editor, width, height) }
      it { expect(subject).to be_a(Commands::Create) }
      it { expect(subject.width).to eq(width.to_i) }
      it { expect(subject.height).to eq(height.to_i) }
    end

    context "when bad number of arguments" do
      it { expect { Commands::Create.create(bitmap_editor, width) }.to raise_error(BadNumberArguments) }
    end

    context "when bad type of arguments" do
      it { expect { Commands::Create.create(bitmap_editor, width, "foo") }.to raise_error(InvalidArguments) }
      it { expect { Commands::Create.create(bitmap_editor, "foo", height) }.to raise_error(InvalidArguments) }
    end
  end

  describe "#execute" do
    before do
      subject.execute
    end
    it { expect(bitmap_editor.bitmap).to be_a(Bitmap) }
    it { expect(bitmap_editor.bitmap.width).to eq(width.to_i) }
    it { expect(bitmap_editor.bitmap.height).to eq(height.to_i) }
  end

end