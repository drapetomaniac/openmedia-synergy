# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '39cee0aebae2ca481f6fae05ecd9e0bd'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
 
end

 class AccessDb
    attr_accessor :mdb, :connection, :data, :fields

    def initialize(mdb=nil)
        @mdb = mdb
        @connection = nil
        @data = nil
        @fields = nil
    end

    def open
        connection_string =  'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
        connection_string << @mdb
        @connection = WIN32OLE.new('ADODB.Connection')
        @connection.Open(connection_string)
    end

    def query(sql)
        recordset = WIN32OLE.new('ADODB.Recordset')
        recordset.Open(sql, @connection)
        @fields = []
        recordset.Fields.each do |field|
            @fields << field.Name
        end
        begin
            @data = recordset.GetRows.transpose
        rescue
            @data = []
        end
        recordset.Close
    end

    def execute(sql)
        @connection.Execute(sql)
    end

    def close
        @connection.Close
    end
end
  