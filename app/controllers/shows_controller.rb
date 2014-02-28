class ShowsController < ApplicationController
  before_action :set_show, only: [:show, :edit, :update, :destroy]

  def index
    @shows = Show.all
    @bids = Bid.all

  end

  # GET /statuses/1
  # GET /statuses/1.json
  def show
    @status = Status.new
    @status.user_id = current_user.id if current_user
    @show = Show.find(params[:id])
    @show.user_id = current_user.id if current_user
    @bids = Bid.all
    @bid = Bid.new 
    @bid.show_id = Show.find(params[:id])
  	

  end

  def add_bids 

    @bid = current_user.bids.create(params[:bid])

    if @bid.save 
      flash[:notice] = "New Bid Added" 
      redirect_to :show => "view_show", :id => @bid.show_id
   end
  end

  def new
    @show = Show.new
    

    
  end


  def edit
  end

  # POST /statuses
  # POST /statuses.json
  def create
    @show = Show.new(show_params)

    respond_to do |format|
      if @show.save
        format.html { redirect_to @show, notice: 'Show was successfully created.' }
        format.json { render action: 'show', status: :created, location: @show }
      else
        format.html { render action: 'new' }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statuses/1
  # PATCH/PUT /statuses/1.json
  def update
    respond_to do |format|
      if @show.update(status_params)
        format.html { redirect_to @show, notice: 'Show was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json
  def destroy
    @show.destroy
    respond_to do |format|
      format.html { redirect_to shows_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = Show.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def show_params

      params.require(:show).permit(:user_id, :content, :start_time, :maxprice, :bids_attributes => [:amount, :user_id, :show_id])
    end
end
