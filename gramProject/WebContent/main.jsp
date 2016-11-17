<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	// 한글 캐릭터셋 변환
	request.setCharacterEncoding("UTF-8");
	

%> 
<!DOCTYPE html>
<html lang="utf-8">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">

    <title>Food Chaser - MAP</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">


    <!-- Custom styles for this template -->
    <link href="assets/css/main.css" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="assets/js/hover.zoom.js"></script>
    <script src="assets/js/hover.zoom.conf.js"></script>
	<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&ver=2.0&key=API키값"></script>  
  </head>

  <body>
<%@ include file="./facebook/api.jsp" %>
<%@ include file="./facebook/init api.jsp" %>
    <div class="navbar navbar-inverse navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          </button>
          <a class="navbar-brand" href="">지도 /</a>
          <a class="navbar-brand" href="">Map</a> 
			<br/>
         <!-- 넣을 부분 -->
        <div id="status"></div>
        </div>        
        <div class="navbar-collapse collapse">
        	<ul class="nav navbar-nav navbar-right">
 		       	<li><a href="main.jsp">Map</a></li>
        	    <li><a href="index.jsp" onclick="logoutAPI();">LogOut</a></li>
       		</ul>
        </div>
      </div>
    </div>
	<!-- +++++ Welcome Section +++++ -->
	<div id="ww">
	    <div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 centered">
					<h1> 지  도 표  시</h1>
						<form method="post" action="main.jsp">
							<input type="text" name="point"/>
							<input type="submit" name="search" value="위치검색"/>
						</form> <br/>
					<div id="map" style="border:1px solid #000;">
						<script type="text/javascript">
							<%
						double point_x[],point_y[];
						point_x = new double[10];
						point_y = new double[10];
						
						
						if("홍대입구".equals(request.getParameter("point"))){
							point_y[0] = 37.5568476;
							point_x[0] = 126.9237910;
							
						}else{
							point_y[0] = 37.3207278;
							point_x[0] = 127.1276811;
						}
					
						// 여기에 db와 연동하여 좌표를 가져온다.
						/*
						for(푸드트럭의 갯수만큼반복){
							point_x,point_y 배열에 푸드트럭의 좌표를 넣는다.
						}
						
						*/
						point_y[1] = 37.5568476;
						point_x[1] = 126.9245910;
						
						point_y[2] = 37.5575476;
						point_x[2] = 126.9237910;
						
						point_y[3] = 37.5560476;
						point_x[3] = 126.9237910;
						
						point_y[4] = 37.3210378;
						point_x[4] = 127.1265811;
						
						point_y[5] = 37.3220378;
						point_x[5] = 127.1264811;
						
						point_y[6] = 37.3216278;
						point_x[6] = 127.1277811;
						
						
						out.print("var oPoint = new Array(5);");
						out.print("oPoint[0] = new nhn.api.map.LatLng("+point_y[0]+","+ point_x[0]+");");
					
						for(int i = 1;i<7;i++){
							out.print("oPoint["+i+"] = new nhn.api.map.LatLng("+point_y[i]+","+ point_x[i]+");");
						}
						%>
						var defalutLevel = 11; //기본줌설정

						var oMap = new nhn.api.map.Map(document.getElementById('map'),{
							point : oPoint[0],
							zoom : defalutLevel,
							enableDragPan : true,
							enableDblClickZoom : false,
							mapMode : 0,
							activateTrafficMap : false,
							activateBicycleMap : false,
							minMaxLevel : [1, 14],
							size : new nhn.api.map.Size(800,480)
						});
						
						var oSlider = new nhn.api.map.ZoomControl();
						oMap.addControl(oSlider);
						oSlider.setPosition({
							top : 10,
							left : 10
						});
						
						var oMapTypeBtn = new nhn.api.map.MapTypeBtn();
						oMap.addControl(oMapTypeBtn);
						oMapTypeBtn.setPosition({
							bottom : 10,
							right : 80
						});
						
						var oSize = new nhn.api.map.Size(28,37);
						var oOffset = new nhn.api.map.Size(14,37);
						var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png',oSize,oOffset);
						
						oMarker = new nhn.api.map.Marker(oIcon,{title : '칵추'});
						oMarker.setPoint(oPoint[1]);
						oMap.addOverlay(oMarker);								
						oMarker2 = new nhn.api.map.Marker(oIcon,{title : '살롱 드 로즈'});
						oMarker2.setPoint(oPoint[2]);
						oMap.addOverlay(oMarker2);
						oMarker3 = new nhn.api.map.Marker(oIcon,{title : '존 쿡 델리카'});
						oMarker3.setPoint(oPoint[3]);
						oMap.addOverlay(oMarker3);
						oMarker4 = new nhn.api.map.Marker(oIcon,{title : '곰파곰파'});
						oMarker4.setPoint(oPoint[4]);
						oMap.addOverlay(oMarker4);
						oMarker5 = new nhn.api.map.Marker(oIcon,{title : '김치버스'});
						oMarker5.setPoint(oPoint[5]);
						oMap.addOverlay(oMarker5);
						oMarker6 = new nhn.api.map.Marker(oIcon,{title : '달숲'});
						oMarker6.setPoint(oPoint[6]);
						oMap.addOverlay(oMarker6);
						
						 var mapInfoTestWindow = new nhn.api.map.InfoWindow(); // - info window 생성
	                        mapInfoTestWindow.setVisible(false); // - infowindow 표시 여부 지정.
	                        oMap.addOverlay(mapInfoTestWindow);     // - 지도에 추가.     
	                        
	                        var oLabel = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언.
	                        oMap.addOverlay(oLabel); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨.

	                        mapInfoTestWindow.attach('changeVisible', function(oCustomEvent) {
	                                if (oCustomEvent.visible) {
	                                        oLabel.setVisible(false);
	                                }
	                        });
	        
	        
	                        oMap.attach('mouseenter', function(oCustomEvent) {
	                                var oTarget = oCustomEvent.target;
	                                // 마커위에 마우스 올라간거면
	                                if (oTarget instanceof nhn.api.map.Marker) {
	                                        var oMarker = oTarget;
	                                        oLabel.setVisible(true, oMarker); // - 특정 마커를 지정하여 해당 마커의 title을 보여준다.
	                                }
	                        });
	        
	                        oMap.attach('mouseleave', function(oCustomEvent) {
	                                var oTarget = oCustomEvent.target;
	                                // 마커위에서 마우스 나간거면
	                                if (oTarget instanceof nhn.api.map.Marker) {
	                                        oLabel.setVisible(false);
	                                }
	                        });
	                        
	                        oMap.attach('click', function(oCustomEvent) {
	                			var oTarget = oCustomEvent.target;
	                			var truck_img = 'ok';
	                			mapInfoTestWindow.setVisible(false);
	                			
	                			// 마커 클릭하면
	                			if (oTarget instanceof nhn.api.map.Marker) {
	                				if (oCustomEvent.clickCoveredMarker) {
	                					return;
	                				}

	                					if(oMarker.getTitle() ==oTarget.getTitle()){
		                					var truck_img = "assets/img/cak/cak.jpg";
	                					}else if(oMarker2.getTitle() ==oTarget.getTitle()){
		                					var truck_img =  "assets/img/rose/rose.jpg";
	                					}else if(oMarker3.getTitle() ==oTarget.getTitle()){
		                					var truck_img =  "assets/img/jon/jon.jpg";
	                					}else if(oMarker4.getTitle() ==oTarget.getTitle()){
		                					var truck_img =  "assets/img/gom/gom.jpg";
	                					}else if(oMarker5.getTitle() ==oTarget.getTitle()){
		                					var truck_img =  "assets/img/kimch/kimch.jpg";
	                					}else if(oMarker6.getTitle() ==oTarget.getTitle()){
		                					var truck_img = "assets/img/moon/moon.jpg";
	                					}

	                					
	                				mapInfoTestWindow.setContent(
	                						'<DIV style="border-top:1px solid; border-bottom:2px groove black; border-left:1px solid; border-right:2px groove black;margin-bottom:1px;color:black;background-color:white; width:auto; height:auto;">'+
	                				'<span style="color: #000000 !important;display: inline-block;font-size: 12px !important;font-weight:bold !important;letter-spacing: -1px !important;white-space: nowrap !important; padding: 2px 2px 2px 2px !important">' + 
	                				oTarget.getTitle()+'<DIV><img src="'+truck_img+'" width="100" height="100">'+ '<form method="post" action="' +'tru?command=select'+ '" align = "center"> <input type="hidden" name="target_title" value="'+oTarget.getTitle()+'"소개소개소개<br/><input type="submit" value="상세정보"></DIV>'
	                				+'<span></div>');
	                				mapInfoTestWindow.setPoint(oTarget.getPoint());
	                				mapInfoTestWindow.setVisible(true);
	                				mapInfoTestWindow.setPosition({right : 15, top : 30});
	                				mapInfoTestWindow.autoPosition();
	                				return;
	                			}
	                		});
					</script>
					</div>
					</div><!-- /col-lg-8 -->
			</div><!-- /row -->
	    </div> <!-- /container -->
	</div><!-- /ww -->
	
	
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/js/bootstrap.min.js"></script>
    
    
     <!-- +++++ Footer Section +++++ -->
	      <div id="footer">
      <div class="container">
         <div class="row"  align="center">
               <h4>      <div class="container">
               </div></h4></div></div></div>
  </body>
</html>
