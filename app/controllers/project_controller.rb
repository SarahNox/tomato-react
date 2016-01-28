class ProjectController < ApplicationController
  def new
    @project = Project.new
  end

  # def save
  #   p = Project.new
  #   p.save
  #   render text: "Project saved"
  # end

  def create
    p = Project.new(project_params)
    p.user = current_user
    p.save
    redirect_to task_url
  end

  private

  def project_params
    params.permit(:project)
  end

end
