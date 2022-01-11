require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    before { 
      @user_params = {
        name: 'Jamie',
        email: 'test@test.test',
        password: 'password',
        password_confirmation: 'password'
      }
    }

    it 'should not save if passwords do not match' do
      @user_params[:password_confirmation] = 'notPassword'
      @user = User.create(@user_params)

      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should not save if password is missing' do
      @user_params[:password] = nil
      @user_params[:password_confirmation] = nil
      @user = User.create(@user_params)

      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

  end
end
