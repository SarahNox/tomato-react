require 'rails_helper'

RSpec.describe "Pomodoros", type: :request do

    before do 
      @user = User.create! name: "abcdef", email: "abc@def.com" ,  password: "abcdef" , password_confirmation: "abcdef" 
      Timecop.travel(Date.today - 1)
      @pomodoro = Pomodoro.create!(project: "Search for yaks", issue: "found them at the shelter", user: @user)
      Timecop.return
      @pomodoro = Pomodoro.create!(project: "Shaving yaks", issue: "need scissors", user: @user)
    end

  describe "GET /pomodoros" do

    it "returns todays pomodoros" do
      post login_path, {"session" => {"email" => "abc@def.com", "password" => "abcdef"}}
      get pomodoros_path

      expect(response).to have_http_status(200)
      expect(response.body).to match /Shaving yaks/
      expect(response.body).to match /need scissors/
      expect(response.body).not_to match /Search for yaks/
      expect(response.body).not_to match /found them at the shelter/
    end
  end

  describe "GET /pomodoros/new" do

    it "should not display pomodoros from the past" do
      post login_path, {"session" => {"email" => "abc@def.com", "password" => "abcdef"}}
      get pomodoros_path

      expect(response).to have_http_status(200)
      expect(response.body).to match /Shaving yaks/
      expect(response.body).to match /need scissors/
    end    
  end

  describe "GET /pomodoros/history" do
    it "returns pomodoro history" do
      post login_path, {"session" => {"email" => "abc@def.com", "password" => "abcdef"}} 
      get pomodoros_history_path

      expect(response).to have_http_status(200)
      expect(response.body).to match /Search for yaks/
      expect(response.body).to match /found them at the shelter/
      expect(response.body).to match /Shaving yaks/
      expect(response.body).to match /need scissors/
    end
  end
end