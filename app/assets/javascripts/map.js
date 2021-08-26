var map;
var lat;
var lng;
var tokyoSt;

function initMap(){
  // if (lat === undefined) {lat = 35.6813363998796;}
  // if (lng === undefined) {lng = 139.76714625537713;}
  lat = 35.6813363998796;
  lng = 139.76714625537713;

  tokyoSt = new google.maps.LatLng(lat, lng);

  let opts = {
    center: tokyoSt,
    zoom: 11,
  };
  map = new google.maps.Map(document.getElementById('map'), opts);

  marker = new google.maps.Marker({
    position: tokyoSt,
    map,
  })

}

function setZone(setlat, setlng){
  if (setlat === undefined) { setlat = 35.6813363998796 }
  if (setlng === undefined) { setlng = 139.76714625537713 }
  map.setCenter(new google.maps.LatLng( setlat, setlng ));

//     marker = new google.maps.Marker({
//       position: center,
//       map: map,
//     });
}







// MAP デフォルト表示(東京駅)
// function initMap(){
//   let lat = $(this).data('lat');
//   var lng = $(this).data('lng');
//   let latLng = new google.maps.LatLng(35.6813363998796, 139.76714625537713);
//
//   let opts = {
//     center: latLng,
//     zoom: 11,
//   };
//   let map = new google.maps.Map(document.getElementById('map'), opts);
// }

// function changeCenter(){
//
//     let lat = <%= @zones.first.latitude %>;
//     let lng = <%= @zones.first.longitude %>;
//
//     map.panTo(new google.maps.LatLng( lat, lng ));
//
//     marker = new google.maps.Marker({
//       position:  latLng,
//       map: map
//     });
// }
