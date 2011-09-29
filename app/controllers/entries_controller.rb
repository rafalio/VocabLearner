class EntriesController < ApplicationController
  # GET /entries
  # GET /entries.json
  def index
    @entries = current_user.entries

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entries }
    end
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    begin
      @entry = current_user.entries.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt by user #{current_user} to access invalid entry #{params[:id]}"
      redirect_to entries_url, notice: "Invalid ID"
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @entry }
      end
    end
  end

  # GET /entries/new
  # GET /entries/new.json
  def new
    @entry = Entry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    begin
      @entry = current_user.entries.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt by user #{current_user} to edit invalid entry #{params[:id]}"
      redirect_to entries_url, notice: "Invalid ID"
    end
  end

  # POST /entries
  # POST /entries.json
  def create
    @user = current_user
    @entry = @user.entries.build(params[:entry])

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render json: @entry, status: :created, location: @entry }
      else
        format.html { render action: "new" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.json
  def update

    begin
      @entry = current_user.entries.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt by user #{current_user} to update invalid entry #{params[:id]}"
      redirect_to entries_url, notice: "Invalid ID"
    else
      respond_to do |format|
        if @entry.update_attributes(params[:entry])
          format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @entry.errors, status: :unprocessable_entity }
        end
      end
    end
  end


  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    begin
      @entry = current_user.entries.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt by user #{current_user} to delete invalid entry #{params[:id]}"
      redirect_to entries_url, notice: "Invalid ID"
    else
      @entry.destroy
      respond_to do |format|
        format.html { redirect_to entries_url }
        format.json { head :ok }
      end
    end
  end

  def getDefinition
    if params[:word]
      defn = Wordnik.word.get_definitions(params[:word], :useCanonical => 'true').map { |f| f["text"] }
      if defn.size != 0
        render json: defn
      else
        render json: false
      end
    else
      render json: false
    end
  end

end
