var mapDiv
var map;
var tokyoSt;
var marker = [];
var markers = [];
var imagePath = "https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m";
var markerCluster;
var openImgUrl = "/images/conditions/OPEN-PIN.png";
var warningImgUrl = "/images/conditions/WARNING-PIN.png";
var closeImgUrl = "/images/conditions/CLOSE-PIN.png";
var noinfoImgUrl = "/images/conditions/NOINFO-PIN.png";
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

    marker[i] = new google.maps.Marker({
      position: markerLatLng,
      map: map,
      title: markerData[i]['name'],
      animation: google.maps.Animation.DROP,
      icon: {
        url: "/images/conditions/OPEN-PIN.png",
        scaledSize: new google.maps.Size(50, 70)
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

function setZone(setlat, setlng){
  if (setlat === undefined) { setlat = 35.6813363998796; }
  if (setlng === undefined) { setlng = 139.76714625537713; }
  map.setCenter(new google.maps.LatLng( setlat, setlng ));
  map.setZoom(11)
}

function markerEvent(i) {
  marker[i].addListener('click', function(){
    infoWindow[i].open(map, marker[i]);
  });
}
