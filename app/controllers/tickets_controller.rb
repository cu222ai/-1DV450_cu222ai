class TicketsController < ApplicationController
def index
  @tickets= Ticket.all
end

def show
  @ticket = Ticket.find(params[:id])

end

def destroy
      Ticket.find(params[:id]).destroy
      @id = params[:id]
         @project = Project.find(@id)
       redirect_to :controller => 'projects', :action => 'show', :id => @project.id

   end

def edit
      @ticket= Ticket.find(params[:id])
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

