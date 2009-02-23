xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Channel Austin"
    xml.description "Current programming"
#    xml.link formatted_offers_url(:rss)   
    for title in @titles
                  xml.item do
                    xml.title title[1]
                    xml.description title[1]
                    xml.pubDate title[10].to_s
#                    xml.pubDate title[10].to_s(:rfc822)
#                    xml.link formatted_coupon_url(offer.id, :html)
#                    xml.guid formatted_coupon_url(offer.id, :html)
#                    xml.link  'http://' + request.env["HTTP_HOST"] + '/' + offer.url
#                     xml.guid 'http://' + request.env["HTTP_HOST"] + '/' + offer.url
                  end
    end
  end
end