require 'rails_helper'

RSpec.describe "Pomodoros", type: :request do

    before do 
      @user = User.create! name: "abcdef", email: "abc@def.com" ,  password: "abcdefgh" , password_confirmation: "abcdefgh" 
      Timecop.travel(Date.today - 1)
      @project1 = Project.create!(name: "Search for yaks", user: @user)
      @task1 = Task.create!(name: "found them at the shelter", project: @project1, user: @user)
      @pomodoro1 = Pomodoro.create!(project_id: @project1.id, task_id: @task1.id, user: @user)
      Timecop.return
      @project2 = Project.create!(name: "Shaving yaks", user: @user)
      @task2 = Task.create!(name: "need scissors", project: @project2, user: @user)
      @pomodoro2 = Pomodoro.create!(project_id: @project2.id, task_id: @task2.id, user: @user)
    end

  describe "GET /pomodoros" do
    it "returns all pomodoros" do
      post login_path, {"session" => {"email" => "abc@def.com", "password" => "abcdefgh"}}
      get project_task_pomodoros_path(@project1, @task1)

      expect(response).to have_http_status(200)
      expect(response.body).to match /Shaving yaks/
      expect(response.body).to match /need scissors/
      expect(response.body).to match /Search for yaks/
      expect(response.body).to match /found them at the shelter/
    end
  end

  describe "GET /pomodoros/new" do
    it "should display pomodoros from the past" do
      post login_path, {"session" => {"email" => "abc@def.com", "password" => "abcdefgh"}}
      get new_project_task_pomodoro_path(@project2, @task2)

      expect(response).to have_http_status(200)
      expect(response.body).to match /Shaving yaks/
      expect(response.body).to match /need scissors/
    end    
  end

  describe "GET /pomodoros/history" do
    it "returns pomodoro history" do
      post login_path, {"session" => {"email" => "abc@def.com", "password" => "abcdefgh"}} 
      get pomodoros_history_path

      expect(response).to have_http_status(200)
      expect(response.body).to match /Search for yaks/
      expect(response.body).to match /found them at the shelter/
      expect(response.body).to match /Shaving yaks/
      expect(response.body).to match /need scissors/
    end
  end
end