class PagesController < ApplicationController
  helper_method :getKitty, :saveKitty
  
  def home
  end
  
  def get_images
    # get urls for loading
    @images = []
    count = params[:count]
    28.times do |i|
      @images << getKitty(i+1)
    end
  end
  
  def download_images
    save_base = "public/system/images"
    count = params[:count]
    @images = []
    count.to_i.times do |i|
      # curl images to local storage then load them
      img_path = "#{save_base}/test_#{i}.jpg"
      saveKitty img_path
      @images << img_path.gsub(/^public\//,'')
    end
  end

  def getKitty i
    # File.join("http://placekitten.com", (500 + rand(20)).to_s, (500 + rand(20)).to_s)
    "http://sfcalendars.demo.tknoc.com/dsmo3/AD1/43/F9/2B3387DD5B9365FF54947900C04B_#{sprintf '%03d', i}.jpg?#{timeStamp}"
  end
  
  def saveKitty here
    require 'open-uri'
    cat_url = File.join("http://placekitten.com", (500 + rand(20)).to_s, (500 + rand(20)).to_s)
    newCat = open(here,'wb')
    newCat.write(open(cat_url).read)
    newCat.close
    true
  end
  
  def timeStamp
    Time.new.strftime("%H:%M:%S")
  end
  
end
