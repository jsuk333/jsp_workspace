<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#map{
	width:70%;
	height:800px;
	border:1px solid red;
	float:left;
}
#info{
	width:25%;
	height:800px;
	border:1px solid blue;
	float:left;
	background:yellow;
}
ul{
	width:90%;
}
ul li{
	list-style:none;
	
}
ul img{
	width:90%;
}
textarea{
	width:90%;
}
#star img{
	width:16%
}
</style>
<script>
var markers = [];
var map;

function loadMap(){//원하는 위도 경도및 줌을 설정하여 지도를 불러오자
	var container=document.getElementById("map");
	var options={
			center:new google.maps.LatLng(37.497613, 127.038099),
			zoom:30
	}
	
	map=new google.maps.Map(container,options);
	var lng;
	var lat;
	map.addListener("click",function(e){
		lat=e.latLng.lat();
		lng=e.latLng.lng();
		form1.lat.value=lat;
		form1.lng.value=lng;
		drop(e);
	});
	
	
}




function drop(e) {
  //clearMarkers();
  addMarkerWithTimeout(e,  200);
 
}

function addMarkerWithTimeout(e, timeout) {
	var lat=e.latLng.lat();
	var lng=e.latLng.lng();
	var position={lat: lat, lng: lng};
	var marker;
	var infowindow = new google.maps.InfoWindow({
		position: position,
	    content: "<div>여기 맛집</div>"
	});
	window.setTimeout(function() {
	  markers.push(marker=new google.maps.Marker({
	    position: position,
	    map: map,
	    title: "여기 맛집?",
	    animation: google.maps.Animation.DROP
	  }));
	  marker.addListener("click",function(){
			infowindow.open(map, marker);
		});
	}, timeout);
	
	
 
  
}
function previewFile() {
	  var preview = form1.picture;
	  var file    = form1.img.files[0];
	  var reader  = new FileReader();

	  reader.addEventListener("load", function () {
	    preview.src = reader.result;
	  }, false);

	  if (file) {
	    reader.readAsDataURL(file);
	  }
	}

function clearMarkers() {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(null);
  }
  markers = [];
}
function star(){
	
}
function regist(){
	form1.encoding="multipart/form-data"
	form1.action="/admin/regist";
	form1.submit();
	
}

</script>
</head>
<body >
<div id="map">My map will go here</div>
<div id="info" >
<form name="form1" method="post">
	<ul>
		<li>위도 : <input type="text" name="lat"></li>
		<li>경도 : <input type="text" name="lng"></li>
		<li>상호명: <input type="text" name="name"></li>
		<li>사진 : <input type="file" name="img" onChange="previewFile()"></li>
		<li><img src="http://thumbnail.egloos.net/600x0/http://pds21.egloos.com/pds/201211/22/80/c0118280_50ae1f9e9364e.jpg"
			name="picture" ></li>
		<li><textarea name="content"></textarea></li>
		<li>
		<select name="score" onChange="star()">
			<%for(int i=1;i<=10;i++){ %>
			<option><%=i*0.5 %></option>
			<% }%>
		</select>
		</li>
		<li>
			<span id="star">
				<img src="/images/half.png">
			</span>
		</li>
		<li><input type="button" value="등록" onClick="regist()"></li>
	</ul>
</form>
</div>
</body>
</html>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDeLONbnE2_Ewm9vTgaXjdhuSbuMir0nvY&callback=loadMap"></script>