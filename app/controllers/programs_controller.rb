class ProgramsController < ApplicationController
def index
#      desc = params[:id]
      desc = 'Open Media'
      input = '30'

      db = AccessDb.new('C:\openaustin\vlm.mdb')
      db.open      
      db.query("select max(title) from Titles;")
      nextid = db.data[0][0]
      nextid = nextid + 1       

#      db.execute("Insert INTO  Events (status,start_datetime) VALUES (5,'04/14/2010 1:59:26') ; ")      
db.execute("Insert INTO  Titles (description,notes,title) VALUES ('monkey2','4/14/2010','" + (nextid + 1).to_s + "') ; ")

#works      db.execute("Insert INTO  Events (status,start_datetime) VALUES (5,'04/14/2010 1:59:26') ; ")
#  @db.execute("Insert INTO  Titles (description,notes,title) VALUES ('monkey','4/14/2010','" + (@nextid + 1).to_s + "') ; ")
#   @db.execute("Select max(title) FROM Titles ; ")

      db.close



  
end

end


# start_datetime  08/14/2009 23:59:39
# end_datetime    08/14/2009 23:59:39
# length          30
# confirmed       1
# switch       1
# input  30, 31
# controller 5
# rack 1
# Device 1,2 
# title 5413
# msn?
# media_type 4
#channel 10, 11, 12
# user_id Local
# title_desc PACT Bumper 3 Trees .23 PROMO
# rewind_flag 2
#eject_flag 2
#autplay 2
# flile_name Pact Bumpers-3 trees.mpg
#conflict_options 7 
# check_start_date 8/14/2009 11:59:39 PM
# check_end_date 8/15/2009
#check_length 21


#input)
#VALUES (
#'" + desc  + "',
#'" + input  + "'
#)
