<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<meta name="viewport" content="user-scable= no, width=device-width" />
<meta name=��apple-mobile-web-app-capable�� content=��yes�� />
<meta name=��apple-mobile-web-app-status-bar-style�� content=��black�� />
<script language='javascript' type='text/javascript'>
var orientationEvent;
var uAgent=navigator.userAgent.toLowerCase();
var mobilePhones= 'android';
if(uAgent.indexOf(mobilePhones)!=-1){
	orientationEvent="resize";   //�ȵ���̵�� resize�� ����
}
else orientationEvent="orientationchange"; //�������� �̷��� ����
window.addEventListener(orientationEvent, function() 
{
//	alert("ȸ���߾��");
	location.href('#');                
}, false); 

var prevScreen=0;
var sv_prevScreen=0;
function prevShow()
{
	ScreenShow( prevScreen );
}

var muCnt   = 5;  //����޴�
var scCnt   = 15; //ȭ��

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
			obj2.style.background="#ff0000";
        }
        else
        {
            obj.style.display   = 'none';
			obj2.style.background="#FFFF00";
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
function ScreenShow( pos )
{
    var i   = 0;
	
	//��� �޴��������� ���´�.
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
			obj.style.top=35;
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
li {text-align:left;vertical-align:middle; margin:2; padding:10; height:20; background-color:#aaaa00; border:2px; solid:red; font-size:16px}
ul {text-align:left;vertical-align:middle; margin:2; padding:10; height:20; background-color:#bbaabb; border:2px; solid:red; font-size:16px}
</style> 

</head>
<body onload='ScreenShow(15);'>
<center>
	<div id="container" style="width:device-width;height:device-height;">
		<div id="header1" style="background-color:#00FFFF;height:35px;width:15%;float:left;" onclick='prevShow();'><center>
			<img src= "back_btn.png" width=40px height=32px></center></div>
		<div id="header2" style="background-color:#00FFFF;height:35px;width:70%;float:left;"><center style="margin:10px;"><B>����� �Ҽ�</B></center></div>
		<div id="header3" style="background-color:#00FFFF;height:35px;width:15%;float:left;" onclick='ScreenShow(0);'><center>
			<img src= "home_btn.png" width=30px height=32px></center></div>

		<div id="menu0" style="background-color:#EEEEEE;display:none;width:device-width">
		 �ҼǼҰ�
			<li onclick='ScreenShow(0);'>����� �Ҽ�</li>
			<li onclick='ScreenShow(1);'>�䳢��</li>
			<li onclick='ScreenShow(2);'>�罿��</li>
			<li onclick='ScreenShow(3);'>����</li>
			<br>
		</div>
		<div id="menu1" style="background-color:#EEEEEE;display:none;width:device-width">
		ã�ƿ���
			<li onclick='ScreenShow(4);'>ã�ƿ��±�</li>
			<li onclick='ScreenShow(5);'>���߱����̿�</li>
			<li onclick='ScreenShow(6);'>�ڰ����̿�</li>
			<br>
		</div>
		<div id="menu2" style="background-color:#EEEEEE;display:none;width:device-width">
		�ֺ����
			<li onclick='ScreenShow(7);'>���ƻ�</li>
			<li onclick='ScreenShow(8);'>�����ؼ�����</li>
			<li onclick='ScreenShow(9);'>������õ</li>
			<br>
		</div>
		<div id="menu3" style="background-color:#EEEEEE;display:none;width:device-width">
		�����ϱ�
			<li onclick='ScreenShow(10);'>�����Ȳ</li>
			<li onclick='ScreenShow(11);'>�����ϱ�</li>
			<br>
		</div>
		<div id="menu4" style="background-color:#EEEEEE;display:none;width:device-width">
		�ҼǼҰ�
			<li onclick='ScreenShow(12);'>�ҼǼҽ�</li>
			<br>
		</div>

		<div id="s15" style="background-image:url();display:none;width:device-width;background-repeat:no-repeat;" >
			<center>
			<img src= "photo/main.JPG" width=200px height=150px>
			<br>���׺�ġ�� ������
			</center>		
		<div id="s0" style="background-image:url(kitti.JPG);display:none;width:device-width;" >
			<center>
			<img src= "main.JPG" width=200px height=150px>
			<br>������Ҽ����� ����ſ�
			</center>			
		</div>
		<div id="s1"style="background-image:url(kitti.JPG);display:none;width:device-width;" >
			<center>
			<img src= "a_01.jpg" width=200px height=150px>
			<br>�䳢���� ��� �䳢ó�� �� �� �־��.
			</center>			</div>
		<div id="s2" style="background-image:url(kitti.JPG);display:none;width:device-width;">
			<center>
			<img src= "a_02.jpg" width=200px height=150px>
			<br>�罿���� �ڴٺ��� �罿�� ��Ÿ���ϴ�.
			</center>			</div>
		<div id="s3" style="background-image:url(kitti.JPG);display:none;width:device-width;">
			<center>
			<img src= "a_03.jpg" width=200px height=150px>
			<br>������ ���� ħ��� ����մϴ�.
			</center>	
		</div>
		<div id="s4" style="background-image:url(kitti.JPG);display:none;">
			<img src= "b_01.gif" width=200px height=150px>
			<br>������ �д籺 ���������� ���ſ�.
		</div>
		<div id="s5" style="background-image:url(kitti.JPG);display:none;">
			<img src= "b_02.jpg" width=200px height=150px>
  			<br>���� 200�� ����Ÿ�� ���ſ�.
		</div>
		<div id="s6" style="background-image:url(kitti.JPG);display:none;">
			<img src= "b_03.jpg" width=200px height=150px>
  			<br>��ΰ�ӵ��� �罿�����Ʈ�� �����ſ�.
		</div>
		<div id="s7" style="background-image:url(kitti.JPG);display:none;">
			<img src= "c_01.jpg" width=200px height=150px>
  			<br>�Ƹ��ٿ� ���ƻ��� ��ó�� �ֽ��ϴ�.
		</div>  
		<div id="s8" style="background-image:url(kitti.JPG);display:none;">
			<img src= "c_02.jpg" width=200px height=150px>
  			<br>�ų��� �����ؼ������� ��ó�� �ֽ��ϴ�.
		</div>
		<div id="s9" style="background-image:url(kitti.JPG);display:none;">
			<img src= "c_03.jpg" width=200px height=150px>
  			<br>���� �����ִ� ������õ�� ��ó�� �ֽ��ϴ�.
		</div>
		<div id="s10" style="background-image:url(kitti.JPG);display:none;">
			<br>
	   	    <ul>2012-05-05 �䳢��  ( ��*�� ��)</ul>
			<ul>2012-05-05 �罿��  ( ��*�� ��)</ul>
			<ul>2012-05-05 ����  ( ���డ��)</ul>
		</div>
		<div id="s11" style="background-color:#222222;display:none;">
		 <iframe src="http://iamhpd8.cafe24.com/homepage/d_02_m.jsp" frameborder="0" border="0" bordercolor="white" 
		 width="450" height="400" marginwidth="10" marginheight="10" 
			scroling="yes" ></iframe>
		</div>
		<div id="s12" style="background-image:url(kitti.JPG);display:none;">
		 �� �޴�4_1�� ���� ȭ��
		</div>
		<div id="s13" style="background-image:url(kitti.JPG);display:none;">
		 �� �޴�4_2�� ���� ȭ��
		</div>
		<div id="s14" style="background-image:url(kitti.JPG);display:none;">
		 �� �޴�4_3�� ���� ȭ��
		</div>

		<div id="m0" onclick='fncShow(0);' 
		style="position:absolute;bottom:3px;position:absolute;left:1%;background-color:#FF0000;height:60px;width:18%;float:left;">
				<center>
				<img src= "m1_btn.png" width=40px height=40px><br>
				<font size=2>�ҼǼҰ�</font></center></div>
		<div id="m1" onclick='fncShow(1);' 
		style="position:absolute;bottom:3px;position:absolute;left:21%;background-color:#FFFF00;height:60px;width:18%;float:left;">
				<center>
				<img src= "m2_btn.png" width=40px height=40px><br>
				<font size=2>ã�ƿ���</font></center></div>
		<div id="m2" onclick='fncShow(2);' 
		style="position:absolute;bottom:3px;position:absolute;left:41%;background-color:#FFFF00;height:60px;width:18%;float:left;">
				<center>
				<img src= "m3_btn.png" width=40px height=40px><br>
				<font size=2>�ֺ����</font></center></div>
		<div id="m3" onclick='fncShow(3);' 
		style="position:absolute;bottom:3px;position:absolute;left:61%;background-color:#FFFF00;height:60px;width:18%;float:left;">
				<center>
				<img src= "m4_btn.png" width=40px height=40px><br>
				<font size=2>�����ϱ�</font></center></div>
		<div id="m4" onclick='fncShow(4);' 
		style="position:absolute;bottom:3px;position:absolute;left:81%;background-color:#FFFF00;height:60px;width:18%;float:left;">
				<center>
				<img src= "m5_btn.png" width=40px height=40px><br>
				<font size=2>�ҼǼҰ�</font></center></div>		
	</div>
</center>
</body>
</html> 