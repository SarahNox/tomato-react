require 'rails_helper'

RSpec.describe "Pomodoros", type: :request do

  describe "GET /pomodoros" do
    before do 
      @user = User.create! name: "abcdef", email: "abc@def.com" ,  password: "abcdef" , password_confirmation: "abcdef" 
    end

    it "returns todays pomodoros" do
      post login_path, {"session" => {"email" => "abc@def.com", "password" => "abcdef"}}
      get pomodoros_path

      expect(response).to have_http_status(200)
      expect(data.length).to eq(1)
    end
  end

  describe "GET /pomodoros/new" do
    before do 
      @user = User.create! name: "abcdef", email: "abc@def.com" ,  password: "abcdef" , password_confirmation: "abcdef" 
      #user = FactoryGirl.create :user 
    end

    it "should not display pomodoros from the past" do
      post login_path, {"session" => {"email" => "abc@def.com", "password" => "abcdef"}}
      get pomodoros_path

      expect(response).to have_http_status(200)
    end    
  end
end