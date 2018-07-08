require 'commands/clear'
require 'bitmap-editor'

describe Commands::Clear do

  let(:bitmap_editor)    { BitmapEditor.new }

  context "when a bitmap is already created" do
    before do
      Commands::Create.new(bitmap_editor, 2, 2).execute
    end

    subject { Commands::Clear.new(bitmap_editor) }

    describe ".initialize" do
      it { expect(subject.bitmap_editor).to eq(bitmap_editor) }
    end

    describe "#execute" do
      before do
        bitmap_editor.bitmap[1, 1] = 'A'
      end
      it { expect{ subject.execute }.to change { bitmap_editor.bitmap.data }.from('AOOO').to('OOOO') }
    end

    describe ".create" do
      context "when correct arguments" do
        subject { Commands::Clear.create(bitmap_editor) }
        it { expect(subject).to be_a(Commands::Clear) }
      end

      context "when bad number of arguments" do
        it { expect { Commands::Clear.create(bitmap_editor, "foo") }.to raise_error(BadNumberArguments) }
      end
    end
  end

  context "when no bitmap created" do
    subject { Commands::Clear.new(bitmap_editor) }
    describe ".initialize" do
      it { expect(subject.bitmap_editor).to eq(bitmap_editor) }
    end

    describe "#execute" do
      it { expect{ subject.execute }.to raise_error(MissingBitmap) }
    end
  end
end