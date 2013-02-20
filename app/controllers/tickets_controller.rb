class TicketsController < ApplicationController
def index
  @tickets= Ticket.all
end

def show
  @ticket = Ticket.find(params[:id])
 @session= User.find(session[:user_id])
  @ticket_id= User.find(session[:user_id]).username


end

def destroy
  @ticket_id= User.find(session[:user_id]).username
    @ticket= Ticket.find(params[:id])
 @session= User.find(session[:user_id])

       if(@ticket.user.username == @ticket_id || @ticket.project.user_id == @session.id)
        Ticket.destroy(params[:id])

          redirect_to :controller => 'projects', :action => 'show', :id => @ticket.project_id
       else
         redirect_to :action => 'show', :id => @ticket.id
     end


   end

def edit
     @ticket_id= User.find(session[:user_id]).username
    @ticket= Ticket.find(params[:id])
 @session= User.find(session[:user_id])

      if(@ticket.user.username == @ticket_id || @ticket.project.user_id == @session.id)
        @ticket= Ticket.find(params[:id])
      else
         redirect_to :action => 'show', :id => @ticket.id
      end

   end

def update
      @ticket = Ticket.find(params[:id])
      if @ticket.update_attributes(params[:ticket])
        redirect_to :action => 'show', :id => @ticket.id
         else
        render 'edit'
     end
end

def new
            @ticket = Ticket.new
           @id = params[:project_id]

            @project = Project.find(@id)
       end

def create
  @ticket= Ticket.new(params[:ticket])

  @id = params[:project_id]

            @project = Project.find(@id)
  @ticket.user_id = session[:user_id]
  @ticket.project_id = params[:project_id]

  if @ticket.save

     redirect_to :controller => 'projects', :action => 'show', :id => @project
  else
    render :action => "new"
  end

  end


end

