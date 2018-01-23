
// INIT
L.mapbox.accessToken = 'pk.eyJ1Ijoib25kcmFlIiwiYSI6IjhmODI5MjRmMDNkYWYxYzNjMzBmZGU0MGQ4NjQ2YjBjIn0.cVmAkqpsuP4BR9eAnz5hCw';

// MAP
$("#map").height(screen.height - 150);
var map = L.mapbox.map('map', 'ondrae.n4ck2old', { zoomControl: false }).setView([37.77,-122.43],12);


// SEARCH
$("#search").submit(function(e){
  e.preventDefault();
  cid = "QCPOMMV0325RR5APTBIQFW5STNL1ZWR3TN2HFEFFELCPVBM1"
  cs = "JII3J5ERSNQNXVXRRX10RBPOTLCLLBJWYDS50D4K5W1XKPOG"
  q = $("#q").val();
  fsq = "https://api.foursquare.com/v2/venues/search?client_id="+cid+"&client_secret="+cs+"&v=20130815&intent=global&query="+q
  $.getJSON(fsq,
    function(result){
      place = result.response.venues[0]

      // Zoom to top result
      latlng = [place.location.lat - 0.0055,place.location.lng]
      lnglat = [place.location.lng,place.location.lat]
      map.setView(latlng,14)

      L.mapbox.featureLayer({
          type: 'Feature',
          geometry: {
              type: 'Point',
              coordinates: lnglat
          },
          properties: {
              'marker-size': 'large',
              'marker-color': '#BE9A6B',
              'marker-symbol': 'building'
          }
      }).addTo(map);

      fsq_photo = "https://api.foursquare.com/v2/venues/" + place.id + "/photos?client_id="+cid+"&client_secret="+cs+"&v=20130815"
      $.getJSON(fsq_photo,
        function(result){
          photo = result.response.photos.items[0];
          url = photo.prefix + "100x100" + photo.suffix;
          $("#place-photo").attr("src",url);

          $("#card").removeClass("hidden").addClass("show");
          $("#place-name").text( place.name );
          $("#place-description").text( place.location.formattedAddress );
          $("#card").animate({"top" : "-" + $("#card").height() - 150 }, 1000);

        });

    });

    $("#close-panel").click(function(){
      $("#card").animate({"top" : 0 }, 1000);
    })
});
