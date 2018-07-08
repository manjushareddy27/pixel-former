require 'commands/show'
require 'bitmap-editor'

describe Commands::Show do

  let(:bitmap_editor)    { BitmapEditor.new }

  context "when a bitmap is already created" do

    before do
      Commands::Create.new(bitmap_editor, 2, 2).execute
    end

    subject { Commands::Show.new(bitmap_editor) }

    describe ".initialize" do
      it { expect(subject.bitmap_editor).to eq(bitmap_editor) }
    end

    describe "#execute" do

      it { expect { subject.execute }.to output("OO\nOO\n").to_stdout }

    end

    describe ".create" do
      context "when correct arguments" do
        subject { Commands::Show.create(bitmap_editor) }
        it { expect(subject).to be_a(Commands::Show) }
      end

      context "when bad number of arguments" do
        it { expect { Commands::Show.create(bitmap_editor, "foo") }.to raise_error(BadNumberArguments) }
      end
    end

  end

  context "when no bitmap created" do

    subject { Commands::Show.new(bitmap_editor) }
    describe ".initialize" do
      it { expect(subject.bitmap_editor).to eq(bitmap_editor) }

    end

    describe "#execute" do

      it { expect{ subject.execute }.to raise_error(MissingBitmap) }

    end

  end

end