<html>

<head>
<style>
	@import url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);
	body{font-family:명조, serif; font-size:30pt; color:fuchsia; font-weight:bold; background:url(photo/bg.gif);background-color:rgba(0,0,0,0.6);}
	#me1, #me2, #me3, #me4{position:absolute; left:0%; top:30%;font-size:large;}
</style>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
	<meta name="viewport" content="user-scable= no, width=device-width" />
	<meta name=”apple-mobile-web-app-capable” content=”yes” />
	<meta name=”apple-mobile-web-app-status-bar-style” content=”black” />
<script language='javascript' type='text/javascript'>
	var prevPage=15, postPage=15;
	var orientationEvent;
	var uAgent=navigator.userAgent.toLowerCase();
	var mobilePhones= 'android';
	if(uAgent.indexOf(mobilePhones)!=-1){
		orientationEvent="resize";   //안드로이드는 resize로 들어옴
	}
	else orientationEvent="orientationchange"; //아이폰은 이렇게 들어옴
		window.addEventListener(orientationEvent, function() 
			{
			//	alert("회전했어요");
			location.href('#');                
			}, false); 

			var prevScreen=0;
			var sv_prevScreen=0;
	function prevShow(prev)
	{ 
		ScreenShow(prevPage,postPage);
	}

	var muCnt   = 5;  //서브메뉴
	var scCnt   = 15; //화면

function fncShow( pos )
{
    var i   = 0;
	
	for( i=0; i<scCnt; i++ )
    {
        var obj = document.getElementById("s"+i);
	    obj.style.display   = 'none';
    }
    for( i=0; i<muCnt; i++ )
    {
        var obj = document.getElementById("menu"+i);
		var obj2 = document.getElementById("m"+i);

        if( i == pos )
        {
            obj.style.display   = '';
			obj2.style.background="aqua";
        }
        else
        {
            obj.style.display   = 'none';
			obj2.style.background="LIME";
        }
    }
}

var scCnt   = 16;
var ScrObj;

var timer1;

function ScrAnimation() {
	var offset = -50;

		if (parseInt(ScrObj.style.left) > 10 ) 
		{
            ScrObj.style.left = parseInt(ScrObj.style.left) + offset + "px";
            timer1 = setTimeout("ScrAnimation()", 1);
		} else {
			ScrObj.style.left=5;
		    clearTimeout(timer1);
      	}
}
function ScreenShow( pos ,prev)
{
    var i   = 0;
	prevPage=prev;
	postPage=pos;
	//모든 메뉴페이지는 막는다.
	for( i=0; i<muCnt; i++ )
    {
        var obj = document.getElementById("menu"+i);
	    obj.style.display   = 'none';
    }

    for( i=0; i<scCnt; i++ )
    {
		var obj = document.getElementById("s"+i);

        if( i == pos )
        {
			prevScreen = sv_prevScreen;
			sv_prevScreen=i;
			
            obj.style.display   = '';

			obj.style.position="relative";
			obj.style.top=55;
			obj.style.left=screen.width;
			obj.style.height=screen.height-120;

			ScrObj=obj;
			ScrAnimation();
        }
        else
        {
            obj.style.display   = 'none';
        }
    }
}
</script>
<style type="text/css">
li {text-align:left;vertical-align:middle; margin:2; padding:10; height:20; background-color:#aaaa00; border:2px; solid:red; font-size:25px}
ul {text-align:left;vertical-align:middle; margin:2; padding:10; height:20; background-color:#bbaabb; border:2px; solid:red; font-size:25px}
</style> 

</head>
<body onload='ScreenShow(postPage,prevPage);'>

<center>
	<div id="container" style="width:device-width;height:device-height;">
	
		<div id="header1" style="background-color:green;height:55px;width:15%;float:left;margin:0; padding:0; border:0px" onclick='prevShow(prevPage);'><center>
			<img src= "photo/back.gif" width=40px height=32px></center></div> <!- 뒤로가기 버튼 ->
		<div id="header2" style="background-color:green;height:55px;width:70%;float:left; font-size:20pt;" ><center style="margin:10px;"><B>모항비치 팬션</B></center></div>
		<div id="header3" style="background-color:green;height:55px;width:15%;float:left; margin:0; " onclick='ScreenShow(postPage,prevPage);'><center>
		<img src= "photo/home_btn.gif" width=30px height=32px></center></div> <!--홈으로 가기버튼-->

		<div id="menu0" style="background-color:#EEEEEE;display:none;width:device-width">
	
		 팬션소개
			<li onclick='ScreenShow(0,prevPage);'>블루마운틴</li>
			<li onclick='ScreenShow(1,prevPage);'>루왁</li>
			<li onclick='ScreenShow(2,prevPage);'>도미토리</li>
			<li onclick='ScreenShow(3,prevPage);'>수프리모</li>
			<br>
		</div>
		<div id="menu1" style="background-color:#EEEEEE;display:none;width:device-width">
		찾아오기
			<li onclick='ScreenShow(4,prevPage);'>찾아오는길</li>
			<li onclick='ScreenShow(5,prevPage);'>대중교통이용</li>
			<li onclick='ScreenShow(6,prevPage);'>자가용이용</li>
			<br>
		</div>
		<div id="menu2" style="background-color:#EEEEEE;display:none;width:device-width">
		주변명소
			<li onclick='ScreenShow(7,prevPage);'>모항갯벌해수욕장</li>
			<li onclick='ScreenShow(8,prevPage);'>금구원야외조각미술관</li>
			<li onclick='ScreenShow(9,prevPage);'>부안영상테마파크</li>
			<br>
		</div>
		<div id="menu3" style="background-color:#EEEEEE;display:none;width:device-width">
		예약하기
			<li onclick='ScreenShow(10,prevPage);'>예약상황</li>
			<li onclick='ScreenShow(11,prevPage);'>예약하기</li>
			<br>
		</div>
		<div id="menu4" style="background-color:#EEEEEE;display:none;width:device-width">
		팬션소개
			<li onclick='ScreenShow(12,prevPage);'>팬션소식</li>
			<li onclick='ScreenShow(13,prevPage);'>이용후기</li>
			<br>
		</div>
		
		<div id="s15" style="" ;>
		
			<center>
			<img src= "photo/main.JPG" width=200px height=150px>
			<br>모항비치로 오세요
			</center>			
		</div>
		<div id="s0" style="" ;>
	
			<center>
			<img src= "photo/b001.JPG" width=200px height=150px>
			<br>도미토리(취사는 안돼용^^)
			</center>			
		</div>
		<div id="s1"style="" ;>
		
			<center>
			<br>
			<img src= "photo/r001.JPG" width=200px height=150px>
			</center>럭셔리한 분위기 잡기 좋은 곳</div>
		<div id="s2" style="" ;>
	
			<center>
		<img src= "photo/d001.JPG" width=200px height=150px>
			<br>아이들이 좋아해요~ 6~8인실 강추
			</center>			</div>
		<div id="s3" style="background-image:url(photo/bg.gif);display:none;width:device-width; background-color:rgba(0,0,0,0.6)" ;>

			<center> <!-- style에 배경이미지 옵션 넣은 것은 이렇게도 할 수 있다는 것을 보여준 것임 -->
			<img src= "photo/s001.JPG" width=200px height=150px>
			<br>아늑하고 편안한 모던클래식 style
			</center>	
		</div>
		<div id="s4" style="" ;>
		
<!-- * Daum 지도 - 지도퍼가기 -->
<!-- 1. 지도 노드 -->
<div id="daumRoughmapContainer1470360555115" class="root_daum_roughmap root_daum_roughmap_landing"></div>

<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1470360555115",
		"key" : "ccq6",
		"mapWidth" : "600",
		"mapHeight" : "300"
	}).render();
</script>		
			<br>전북 부안군 모항비치펜션 네비 찍으세요
		</div>
		<div id="s5" style="" ;>
		
		<img src= "photo/bus.JPG" width=200px height=150px>
  			<br>대중교통: 부안 시외버스터미널에서  201, 202번 버스 타고 와요
		</div>
		<div id="s6" style="">
		<img src= "photo/car.JPG" width=200px height=150px>
  			<br>서해안고속도로 줄포IC로 오세용~.
		</div>
		<div id="s7" style="" ;>
		<img src= "photo/beach.JPG" width=200px height=150px>
  			<br>아름다운 해수욕장이 바로 앞에 있습니다.
		</div>  
		<div id="s8" style="" ;>
		<img src= "photo/musium.JPG" width=200px height=150px>
  			<br>국내 최초의 조각공원이 근처에 있습니다.
		</div>
		<div id="s9" style="" ;>
		<img src= "photo/park.JPG" width=200px height=150px>
  			<br>사극 촬영의 명소가 근처에 있습니다.
		</div>
		<div id="s10" style=""> <!--예약상황-->
		 <iframe src="d_01.jsp" frameborder="0" border="0" bordercolor="white" 
		 width="100%" height="100%" marginwidth="0" marginheight="0" 
			scroling="yes" ></iframe>
		</div>
		<div id="s11" style=""> <!--예약하기-->
		 <iframe src="d_02.jsp" frameborder="0" border="0" bordercolor="white" 
		 width="450" height="400" marginwidth="10" marginheight="10" 
			scroling="yes" ></iframe>
		</div>
		<div id="s12" style=";">
		 <iframe src="/gongji/gongji_list.jsp" frameborder="10" border="10" bordercolor="white" 
		 width="450" height="400" marginwidth="10" marginheight="10" 
			scroling="yes" ></iframe> <!-- 펜션소식 -->
		</div>
		<div id="s13" style=""> <!-- 이용후기 -->
		<iframe src="gongji2/gongji_list.jsp" frameborder="0" border="0" bordercolor="white" 
		 width="80%" height="50%" marginwidth="10" marginheight="10" 
			scroling="yes" ></iframe>
		</div>
		<div id="s14" style="">
		 나 메뉴4_3에 대한 화면
		</div>

		<div id="m0" onclick='fncShow(0);' 
		style="position:absolute;bottom:3px;position:absolute;left:1%;background-color:LIME;height:60px;width:18%;float:left;">
			
			<div id="me3">팬션소개</div></div>
		<div id="m1" onclick='fncShow(1);' 
		style="position:absolute;bottom:3px;position:absolute;left:21%;background-color:LIME;height:60px;width:18%;float:left;">
			
			<div id="me3">찾아오기</div></div>
		<div id="m2" onclick='fncShow(2);' 
		style="position:absolute;bottom:3px;position:absolute;left:41%;background-color:LIME;height:60px;width:18%;float:left;">
			
				<div id="me3">주변명소</div></div>
		<div id="m3" onclick='fncShow(3);' 
		style="position:absolute;bottom:3px;position:absolute;left:61%;background-color:LIME;height:60px;width:18%;float:left;">
				
			<div id="me4" ><span>예약하기</span></div> </div> <!-- span으로 글씨만 부분적으로 강조하는것이 맞을 것이다 -->
		<div id="m4" onclick='fncShow(4);' 
		style="position:absolute;bottom:3px;position:absolute;left:81%;background-color:LIME;height:60px;width:18%;float:left;">
	
			<div id="me3">팬션소식</div></div>		
	</div>
</center>
</body>
</html> 