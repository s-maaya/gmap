class MapsController < ApplicationController
  def index
  end


  def map


    uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+params[:address]+"&key=AIzaSyAXVO_qAdBaE7xi7UQgs_uUnXFKNv1U7go")
    res = HTTP.get(uri).to_s
    response = JSON.parse(res)
    #@latlngに空の箱を渡している。
    @latlng = []
    #右から順に取得した緯度経度を渡している。
    @latlng << response["results"][0]["geometry"]["location"]["lat"]
    @latlng << response["results"][0]["geometry"]["location"]["lng"]
    # results = Geocoder.search(params[:address])
  # @latlng = results.first.coordinates
#これでmap.js.erbで、経度緯度情報が入った@latlnpを使える。

  # respond_to以下の記述によって、
  # remote: trueのアクセスに対して、
  # map.js.erbが変えるようになります。
  respond_to do |format|
  format.js
  end
  end

end
