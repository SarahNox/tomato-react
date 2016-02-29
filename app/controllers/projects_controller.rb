class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    pro = Project.new(project_params)
    pro.user = current_user
    pro.save
    redirect_to new_project_task_url(pro)
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

end
