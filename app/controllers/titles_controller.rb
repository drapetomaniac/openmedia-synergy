class TitlesController < ApplicationController
  # GET /titles
  # GET /titles.xml
  def index
    #@titles = Titles.find(:all)
    db = AccessDb.new('C:\Documents and Settings\Administrator\Desktop\ChannelAustinVLMFiles\vlm.mdb')
    db.open
    
    db.query("SELECT 
    [Events]![event_id],
    [Titles]![description],
    [Events]![title_desc],
    [Events]![start_datetime],
    [Events]![length],
    [Events]![file_name], 
    [Events]![channel]
    FROM [Events], [Titles] where [Events]![title] = [Titles]![title] and [Events]![start_datetime] > Date()   
;")
    @fields = db.fields
    @titles = db.data
    
    #db.execute("INSERT INTO HallOfFame VALUES ('Dave', 'Concepcion');")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @titles }
      format.rss  { render :rss => @titles }
    end
    db.close
=begin    
0* title
1* description
2 active_flag
3* playing_time
4 notes
5 series_id
6 series_episode
7* producer 
8 source
9 study_guide
10* production_date
11 closed_captioned
12 first_run_date
13 acquisition_date
14 term_type
15 expiration_date
=end
  end

  # GET /titles/1
  # GET /titles/1.xml
  def show
    @titles = Titles.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @titles }
    end
  end

  # GET /titles/new
  # GET /titles/new.xml
  def new
    @titles = Titles.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @titles }
    end
  end

  # GET /titles/1/edit
  def edit
    @titles = Titles.find(params[:id])
  end

  # POST /titles
  # POST /titles.xml
  def create
    @titles = Titles.new(params[:titles])

    respond_to do |format|
      if @titles.save
        flash[:notice] = 'Titles was successfully created.'
        format.html { redirect_to(@titles) }
        format.xml  { render :xml => @titles, :status => :created, :location => @titles }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @titles.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /titles/1
  # PUT /titles/1.xml
  def update
    @titles = Titles.find(params[:id])

    respond_to do |format|
      if @titles.update_attributes(params[:titles])
        flash[:notice] = 'Titles was successfully updated.'
        format.html { redirect_to(@titles) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @titles.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /titles/1
  # DELETE /titles/1.xml
  def destroy
    @titles = Titles.find(params[:id])
    @titles.destroy

    respond_to do |format|
      format.html { redirect_to(titles_url) }
      format.xml  { head :ok }
    end
  end
end
