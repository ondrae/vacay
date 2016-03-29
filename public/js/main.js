
// INIT
L.mapbox.accessToken = 'pk.eyJ1Ijoib25kcmFlIiwiYSI6IjhmODI5MjRmMDNkYWYxYzNjMzBmZGU0MGQ4NjQ2YjBjIn0.cVmAkqpsuP4BR9eAnz5hCw';

// MAP
$("#map").height(screen.height - 150);
var map = L.mapbox.map('map', 'ondrae.n4ck2old', { zoomControl: false }).setView([37.77,-122.43],12);
// Disable scroll wheel, so users don't get stuck in the map on mobile
map.scrollWheelZoom.disable();
// Credit Foursquare for their wonderful data
map.attributionControl
    .addAttribution('<a href="https://foursquare.com/">Places data from Foursquare</a>');

// SEARCH
$("#search").submit(function(e){
  e.preventDefault();
  // Get current view mapbounds
  sw = map.getBounds()._southWest
  ne = map.getBounds()._northEast
  sw = sw.lat +","+ sw.lng
  ne = ne.lat +","+ ne.lng
  cid = "QCPOMMV0325RR5APTBIQFW5STNL1ZWR3TN2HFEFFELCPVBM1"
  cs = "JII3J5ERSNQNXVXRRX10RBPOTLCLLBJWYDS50D4K5W1XKPOG"
  q = $("#q").val();
  fsq = "https://api.foursquare.com/v2/venues/search"
  fsq += "?client_id="+cid+"&client_secret="+cs+"&v=20130815"
  fsq += "&intent=browse&sw="+sw+"&ne="+ne
  fsq += "&query="+q
  $.getJSON(fsq,
    function(result){

      place = result.response.venues[0]
      console.log(place);
      lnglat = [place.location.lng,place.location.lat]

      fsq_photo = "https://api.foursquare.com/v2/venues/" + place.id
      fsq_photo += "/photos?client_id="+cid+"&client_secret="+cs+"&v=20130815"

      $.getJSON(fsq_photo,
        function(result){

          photo = result.response.photos.items[0];
          photoUrl = photo.prefix + "100x100" + photo.suffix;

          placeContent = '<div><img src='+photoUrl+'></div>'
          placeContent += '<div class="right"><h1>' + place.name + '</h1>'
          placeContent += '<p>'+place.location.address+','+place.location.crossStreet+'</p></div>'


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
          })
          .bindPopup(placeContent, {
              closeButton: false,
              minWidth: 320,
              className: 'fsqPopup'
          })
          .addTo(map);

        });

    });

});