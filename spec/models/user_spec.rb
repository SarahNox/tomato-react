require 'rails_helper'

RSpec.describe User, type: :model do

  before do 
    @user = User.create! name: "abcdef", email: "abc@def.com" ,  password: "password" , password_confirmation: "password" 
  end

  it "returns true when password true" do
    expect(@user.authenticate("password")).to be_truthy 
  end

  it "returns false when password wrong" do 
    expect(@user.authenticate("wrong password")).to be_falsey 
  end
end