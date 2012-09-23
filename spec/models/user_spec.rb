require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  
  it { should have_many(:organizations) }
  it { should have_many(:transactions) }
  it { should validate_uniqueness_of(:email) }

  describe '.authenticate' do
    context 'given invalid password' do
      it 'returns false' do
        User.authenticate(user.email, 'bad_password').should_not be
      end
    end

    context 'given invalid email' do
      it 'returns false' do
        User.authenticate('bad_email', user.password).should_not be
      end
    end

    context 'given valid email and password' do
      it 'returns the appropriate instance of user' do
        User.authenticate(user.email, user.password).should == user
      end
    end
  end
end
