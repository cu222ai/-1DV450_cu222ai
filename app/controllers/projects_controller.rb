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
      @project = Project.find(params[:id])
  if(@project == session[:user_id])
      Project.find(params[:id]).destroy
      redirect_to projects_path
    else
           redirect_to :action => 'show', :id => @project.id
         end
   end


def edit
      @session_id = User.find(session[:user_id]).id
      @project = Project.find(params[:id])
      @users = User.all
  if(@project.user_id == @session_id)
      @project = Project.find(params[:id])
      @users = User.all
    else
       redirect_to :action => 'show', :id => @project.id
     end
   end

def update
     @session_id = User.find(session[:user_id]).id
      @project = Project.find(params[:id])
       if(@project.user_id == @session_id)
         if @project.update_attributes(params[:project])
            redirect_to :action => 'show', :id => @project.id
         else
           render 'edit'
      end
    else
        redirect_to :action => 'show', :id => @project.id
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
