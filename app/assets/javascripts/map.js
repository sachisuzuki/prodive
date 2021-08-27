var mapDiv
var map;
var tokyoSt;
var marker = [];
var infoWindow = [];
var markerData = gon.divesites;
// var image


function initMap(){

  tokyoSt = new google.maps.LatLng(35.6813363998796, 139.76714625537713);

  let opts = {
    center: tokyoSt,
    zoom: 11,
    mapTypeControl: false,
    streetViewControl: false,
  };

  mapDiv = document.getElementById('map');
  map = new google.maps.Map(mapDiv, opts);

  for ( var i = 0; i < markerData.length; i++ ) {
    let id = markerData[i]['id'];

    markerLatLng = new google.maps.LatLng({
      lat: markerData[i]['latitude'],
      lng: markerData[i]['longitude']
    });

    marker[i] = new google.maps.Marker({
      position: markerLatLng,
      map: map,
      title: markerData[i]['name'],
      animation: google.maps.Animation.DROP,
      icon: {
        url: "/images/close.png",
        scaledSize: new google.maps.Size(60, 60)
      }
    });

    infoWindow[i] = new google.maps.InfoWindow({
      content: `<a href='/divesites/${ id }'>${ markerData[i]['name'] }の情報</a>`
    });

    markerEvent(i);

  }
}

function setZone(setlat, setlng){
  if (setlat === undefined) { setlat = 35.6813363998796; }
  if (setlng === undefined) { setlng = 139.76714625537713; }
  map.setCenter(new google.maps.LatLng( setlat, setlng ));
}

function markerEvent(i) {
  marker[i].addListener('click', function(){
    infoWindow[i].open(map, marker[i]);
  });
}
