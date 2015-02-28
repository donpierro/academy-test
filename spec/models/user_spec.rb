describe User do

  before(:each) { @user = User.new(email: 'user@example.com') }

  subject { @user }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end

  describe "#name" do
    let(:new_user) { build(:user, name: "ab") }

    it "has at least 3 characters" do
      expect(new_user).to_not be_valid
    end
  end

  describe "#age" do
    context "age less than 5" do
      let(:new_user) { build(:user, age: 3) }

      it { expect(new_user).to_not be_valid }
    end

    context "age greater than 100" do
      let(:new_user) { build(:user, age: 123) }

      it { expect(new_user).to_not be_valid }
    end
  end
end