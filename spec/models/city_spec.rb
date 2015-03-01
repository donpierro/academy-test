describe City do

  describe "#name" do
    context "name shorter than 4 characters" do
      let(:city) { build(:city, name: "abc") }

      it { expect(city).to_not be_valid }
    end

    context "name with small first character" do
      let(:city) { FactoryGirl.create(:city, name: "london") }

      it "saves name with a large first letter" do
        expect(city.name).to eql("London")
      end
    end
  end
end
