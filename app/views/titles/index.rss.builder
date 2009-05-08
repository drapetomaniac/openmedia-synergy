xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Channel Austin"
    xml.description "Current programming"
#    xml.link formatted_offers_url(:rss)   
    for title in @titles  
                  xml.item do
                    xml.category title[6]
                    xml.title title[1]
                    xml.description title[1]
                    xml.duration title[4]
                    xml.pubDate title [3].to_s
                    xml.guid title[0]
                    xml.link title[5]                     
                  end
    end
  end
end