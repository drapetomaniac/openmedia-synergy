class ChannelsController < ApplicationController
  # GET /channels
  # GET /channels.xml
  def index
    @channels = Channels.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @channels }
    end
  end

  # GET /channels/1
  # GET /channels/1.xml
  def show
    @channels = Channels.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @channels }
    end
  end

  # GET /channels/new
  # GET /channels/new.xml
  def new
    @channels = Channels.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @channels }
    end
  end

  # GET /channels/1/edit
  def edit
    @channels = Channels.find(params[:id])
  end

  # POST /channels
  # POST /channels.xml
  def create
    @channels = Channels.new(params[:channels])

    respond_to do |format|
      if @channels.save
        flash[:notice] = 'Channels was successfully created.'
        format.html { redirect_to(@channels) }
        format.xml  { render :xml => @channels, :status => :created, :location => @channels }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @channels.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /channels/1
  # PUT /channels/1.xml
  def update
    @channels = Channels.find(params[:id])

    respond_to do |format|
      if @channels.update_attributes(params[:channels])
        flash[:notice] = 'Channels was successfully updated.'
        format.html { redirect_to(@channels) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @channels.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /channels/1
  # DELETE /channels/1.xml
  def destroy
    @channels = Channels.find(params[:id])
    @channels.destroy

    respond_to do |format|
      format.html { redirect_to(channels_url) }
      format.xml  { head :ok }
    end
  end
end
