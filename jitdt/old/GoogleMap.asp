<%
X = Request("X")
Y = Request("Y")
title = Request("Title")
%>
<style type="text/css">  
html { height: 100% }   
body { height: 100%; margin: 0px; padding: 0px }  
#map_canvas { height: 100% } 
</style>
<script type="text/javascript"    
   src="http://maps.google.com/maps/api/js?sensor=false">
</script>
<script type="text/javascript"> 
function GoogleMAP() 
{     
	 var latlng = new google.maps.LatLng(<%=X%>,<%=Y%>);     
	 var myOptions = 
	 {   
	    zoom: 15,       
		center: latlng,    
		mapTypeId: google.maps.MapTypeId.ROADMAP		
	 };     
	 var map = new google.maps.Map(document.getElementById("map_canvas"),myOptions);  

     var marker = new google.maps.Marker({    
     position: latlng,     
	 map: map,      
	 title:"<%=title%>"   
	 }); 
}
</script>


<body onload="GoogleMAP()"> 

<div id="map_canvas" style="position:absolute; width:400px; height:320px; z-index:1; left: 0px; top: 0px;"></div>


</body>
</html>