var mapDiv
var map;
var tokyoSt;
var marker = [];
var markers = [];
var markerIcon;
var imagePath = "https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m";
var markerCluster;
var infoWindow = [];
var markerData = gon.divesites;


function initMap(){

  tokyoSt = new google.maps.LatLng(35.6813363998796, 139.76714625537713);

  let opts = {
    center: tokyoSt,
    zoom: 6,
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

    setMarkerPin(markerData[i]['status']);

    marker[i] = new google.maps.Marker({
      position: markerLatLng,
      map: map,
      title: markerData[i]['name'],
      animation: google.maps.Animation.DROP,
      icon: {
        url: markerIcon,
        scaledSize: new google.maps.Size(40, 55)
      }
    });

    markers.push(marker[i]);

    infoWindow[i] = new google.maps.InfoWindow({
      content: `<a href='/divesites/${ id }'>${ markerData[i]['name'] }のページへ</a>`
    });

    markerEvent(i);
  }
  markerCluster = new MarkerClusterer(map, markers, {
    imagePath: imagePath,
    gridSize: 40,
    maxZoom: 15,
  });
}

function setMarkerPin(markerData) {
  if (markerData == "open") {
    markerIcon = "/images/conditions/open_pin.png";
  } else if (markerData == "warning") {
    markerIcon = "/images/conditions/warning_pin.png";
  } else if (markerData == "close") {
    markerIcon = "/images/conditions/close_pin.png";
  } else {
    markerIcon = "/images/conditions/noinfo_pin.png";
  }
}

function markerEvent(i) {
  marker[i].addListener('click', function(){
    infoWindow[i].open(map, marker[i]);
  });
}

function setZone(setlat, setlng){
  if (setlat === undefined) { setlat = 35.6813363998796; }
  if (setlng === undefined) { setlng = 139.76714625537713; }
  map.setCenter(new google.maps.LatLng( setlat, setlng ));
  map.setZoom(11)
}
