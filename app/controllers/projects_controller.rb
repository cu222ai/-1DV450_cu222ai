class ProjectsController < ApplicationController


def index
  @projects = Project.all
  @tickets = Ticket.all

  @project_id= session[:user_id]


end

def show
  @project = Project.find(params[:id])
   @users = User.all
   @project_id= session[:user_id]

end

def destroy
      Project.find(params[:id]).destroy
      redirect_to projects_path
   end


def edit
      @project = Project.find(params[:id])
      @users = User.all
   end

def update
      @project = Project.find(params[:id])
     if @project.update_attributes(params[:project])
         redirect_to :action => 'show', :id => @project.id
       else
        render 'edit'
     end
end

def new
  @project = Project.new
    @users = User.all

end

def create
  @project = Project.new(params[:project])

  @project.user_id = session[:user_id]


  if @project.save
    redirect_to projects_path
  else
    render :action => "new"
  end

  end


end
