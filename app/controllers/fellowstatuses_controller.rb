class FellowstatusesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_fellows_and_statuses

  def index
    @fellowstatuses = Fellowstatus.all
  end

def new
    #@fellow = Fellow.new(params[:fellow])
    @fellowstatus = Fellowstatus.new
  end

  def create
    #@fellow = Fellow.new(params[:fellow])
    #@fellowstatus = @status.fellowstatus.build(params[:fellowstatus])
    #@fellowstatus = @fellow.fellowstatus.build(params[:fellowstatus])
    #@fellowstatus.user = current_user
    @fellowstatus = Fellowstatus.new(params[:fellowstatus])
    if @fellowstatus.save
      flash[:notice] = "Fellow Status has been created."
      redirect_to @fellowstatus
    else
     flash[:alert] = "Fellow Status has not been created."
     render action: "new"
    end
  end

  def show
    @fellowstatus = Fellowstatus.find(params[:id])
  end

  def edit
    @fellowstatus = Fellowstatus.find(params[:id])
  end

  def update
    #@fellow = Fellow.new(params[:fellow])
    #@fellowstatus = @fellow.fellowstatus.build
    #@fellowstatus = Fellowstatus.find(params[:id])
    @fellowstatus = Fellowstatus.find(params[:id])
    @fellowstatus.update_attributes(params[:fellowstatus])
        #@fellowstatus.time = Time.now

        flash[:notice] = "Fellow Status has been updated"
        flash[:notice] = Time.now
        redirect_to @fellowstatus
      #else
       #flash[:alert] = "Fellow Status has not been updated."
        #render action: "edit"
      #end
  end

  def story
    @story = @fellow.fellowstatus.build(@status)
    @story.save
  end

  def set_change_time
    if self.update?
    self.time = Time.now
    end
  end

  def destroy
    @fellowstatus = Fellowstatus.find(params[:id])
    @fellowstatus.destroy
    flash[:notice] = "Fellow Status has been deleted."
    redirect_to fellowstatuses_path
  end

  private
  def find_fellows_and_statuses
    @fellow = Fellow.all
    @status = Status.all
  end
end





