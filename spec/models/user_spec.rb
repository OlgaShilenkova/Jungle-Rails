require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

    # 1
    it 'is valid with valid attributes ' do
      user = User.new(first_name: "Peter", last_name: "Smith", email: "TEST@TEST.com ", password: "test123", password_confirmation: "test123")
      expect(user).to be_valid
    end

    # 2
    it 'is not valid if first name is empty' do
      user = User.create( last_name: "Smith", email: "TEST@TEST.com ", password: "test123", password_confirmation: "test123")
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

     # 3
    it 'is not valid if last name is empty' do
      user = User.create( first_name: "Peter", email: "TEST@TEST.com ", password: "test123", password_confirmation: "test123")
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    
    # 4
    it 'is not valid if email is empty' do
      user = User.create(first_name: "Peter", last_name: "Smith", password: "test123", password_confirmation: "test123")
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    
    # 5
    it 'is not valid if password is empty ' do
      user = User.create()
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    
     # 6
     it 'is not valid if password and password_confirmation are not the same ' do
      user = User.create(first_name: "Peter", last_name: "Smith", email: "TEST@TEST.com ", password: "testtest", password_confirmation: "12341234")
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    # 7
    it 'email should not repeat' do
      user1 = User.create(first_name: "Peter", last_name: "Smith", email: "TEST@TEST.com ", password: "test123", password_confirmation: "test123")
      user2 = User.new(first_name: "Jack", last_name: "Black", email: "test@test.COM ", password: "test1234", password_confirmation: "test1234")
      user2.save
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    # 7
    it 'is not valid if password is shorter then 6 characters ' do
      user = User.new(first_name: "Peter", last_name: "Smith", email: "TEST@TEST.com ", password: "1234", password_confirmation: "1234")
      user.save
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end  

  end 

end

# t.string   "first_name"
# t.string   "last_name"
# t.string   "email"
# t.string   "password_digest"

# name: "PocoPhone", price: 49, quantity: 5, category_id: category.id

# :first_name, :last_name, :email, :password, :password_confirmation

# Password can't be blank

# Email, first name, and last name should also be required