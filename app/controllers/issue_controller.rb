class IssueController < ApplicationController
  # def new
  #   @issue = Issue.new
  # end

  # def save
  #   i = Issue.new
  #   i.save
  #   render text: "Issue saved"
  # end

  # def create
  #   i = Issue.new(issue_params)
  #   i.user = current_user
  #   i.save
  #   redirect_to root_url
  # end

  private
  def issue_params
    params.permit(:issue)
  end
end
