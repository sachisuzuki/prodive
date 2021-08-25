// MAP デフォルト表示(東京駅)
function initMap(){
  let latLng = new google.maps.LatLng(35.6813363998796, 139.76714625537713);

  let opts = {
    center: latLng,
    zoom: 11,
  };
  let map = new google.maps.Map(document.getElementById('map'), opts);
}

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
