require_relative '../rails_helper'
RSpec.describe User, type: :model do
  describe 'Validations' do
    let(:user) do
      User.new(
          first_name: 'Test1',
          last_name: 'User1',
          email: 'test@gmail.ca',
          password: 'test123',
          password_confirmation: 'test123'
      )
    end

    let(:user2) do
      User.new(
          first_name: 'Test2',
          last_name: 'User2',
          email: 'test@gmail.ca',
          password: 'test456',
          password_confirmation: 'test456'
      )
    end

    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without a first name' do
      user.first_name = nil
      expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is not valid without a last name' do
      user.last_name = nil
      expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is not valid without a email' do
      user.email = nil
      expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is not valid without a password_confirmation' do
      user.password_confirmation = nil
      expect( User.password_conf(user.password, user.password_confirmation) ).to be_falsey
    end

    it 'is not valid without correct password password_confirmation' do
      user.password_confirmation = 'let me in'
      puts User.password_conf(user.password, user.password_confirmation)
      expect( User.password_conf(user.password, user.password_confirmation)  ).to be false
    end
    it 'is not valid without unique email' do
      user.save!
      user2.email = user.email.upcase
      expect{ user2.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is not valid without password longer than 6 characters' do
      user.password = '123'
      user.password_confirmation = '123'
      expect(User.password_conf(user.password, user.password_confirmation)  ).to be_falsey
    end
  end

  describe '.authenticate_with_credentials' do
    let(:user) do
      User.create!(
          first_name: 'TestUserFirstName',
          last_name: 'TestUserLastName',
          email: 'test123@test.com',
          password: 'coolpass',
          password_confirmation: 'coolpass'
      )
    end
    it 'is valid with valid credentials' do
      user.save
      expect(User.authenticate_with_credentials('test123@test.com', 'coolpass')).to be_truthy
    end
    it 'is not valid without correct password' do
      user.save
      expect(User.authenticate_with_credentials('test123@test.com', 'letmein')).to be_falsey
    end
    it 'is valid with valid case insensitive emails' do
      user.save
      expect(User.authenticate_with_credentials('TEST123@TEST.COM', 'coolpass')).to be_truthy
    end
    it 'is valid with emails leading spaces' do
      user.save
      expect(User.authenticate_with_credentials('   test123@test.com', 'coolpass')).to be_truthy
    end
  end
end