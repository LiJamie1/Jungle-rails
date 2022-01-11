require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    before { 
      @user_params = {
        first_name: 'Jamie',
        last_name: 'Li',
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

    it 'should not save if password is too short' do
      @user_params[:password] = 'passwor'
      @user_params[:password_confirmation] = 'passwor'
      @user = User.create(@user_params)

      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end

    it 'should not save if first name is blank' do
      @user_params[:first_name] = nil
      @user = User.create(@user_params)
      
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'should not save if last name is blank' do
      @user_params[:last_name] = nil
      @user = User.create(@user_params)
      
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'should not save if last name is blank' do
      @user_params[:email] = nil
      @user = User.create(@user_params)
      
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should not save if email is not unique' do
      @user = User.create(@user_params)
      @user2 = User.create(@user_params)
      
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

  end
end
