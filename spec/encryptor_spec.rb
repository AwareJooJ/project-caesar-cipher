require "./lib/encryptor"

describe Encryptor do
  subject(:encrypt_messages) { described_class.new }
  describe "#encrypt" do
    it "encrypts only alphabet letters" do
      string = "2564a"
      expect(encrypt_messages.encrypt(string, 5)).to eq("2564f")
    end

    it "is case sensitive" do
      string = "Hello World"
      expect(encrypt_messages.encrypt(string, 5)).to eq("Mjqqt Btwqi")
    end

    it "works with negative numbers" do
      string = "Hello World"
      expect(encrypt_messages.encrypt(string, -5)).to eq("Czggj Rjmgy")
    end

    it "works with high positive numbers" do
      string = "Hello World"
      expect(encrypt_messages.encrypt(string, 55)).to eq("Khoor Zruog")
    end

    it "works with high negative numbers" do
      string = "Hello World"
      expect(encrypt_messages.encrypt(string, -55)).to eq("Ebiil Tloi")
    end
  end
end
