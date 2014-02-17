class ShowsController < ApplicationController

  def index
    @shows = Shows.all
  end

  # GET /statuses/1
  # GET /statuses/1.json
  def show
  	

  end

  def add_bids 
  # not bad, but... @bid will only fill in the owner_id/bidder_id. and bid amount.

    @bid = current_user.bids.create(params[:bid])

  # create calls save, so this next line is redundant. It still works though. 
  # because nothing's happening between them to alter the outcome of save.

    if @bid.save 
      flash[:notice] = "New Bid Added" 

      # you should be using restful routes, this almost works, but is ugly and deprecated.
      # it doesn't work becasue @bid.auction_id is never set. In fact you never use 
      # the auction_id any where, which was in your params_hash as params[:id]
      redirect_to :show => "view_show", :id => @bid.show_id
   end
  end

  # GET /statuses/new
  def new
    
  end

  # GET /statuses/1/edit
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
      params.require(:show, :date).permit(:user_id, :content)
    end
end
