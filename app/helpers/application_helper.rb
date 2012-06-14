module ApplicationHelper
  
  def getKitty 
    File.join("http://placekitten.com", (256 + rand(10)).to_s, (256 + rand(10)).to_s)
  end
  
  def saveKitty here
    require 'open-uri'
    cat_url = File.join("http://placekitten.com", (256 + rand(10)).to_s, (256 + rand(10)).to_s)
    newCat = open(here,'wb')
    newCat.write(open(cat_url).read)
    newCat.close
    true
  end
end
