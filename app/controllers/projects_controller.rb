class ProjectsController < ApplicationController


def projects
  @projects = Project.all
end

def new
  @project = Project.new(params[:project])

  @project.user_id = session[:user_id]

  end


end
