
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>邀请码注册页面</title>
<meta name="Keywords" content="www.021news.cn">
<meta name="Description" content="www.021news.cn">

<!-- Bootstrap -->
<link href="images/bootstrap.min.css" rel="stylesheet">
<link href="images/main.css" rel="stylesheet">
<link href="images/enter.css" rel="stylesheet">
<script src="images/jquery.min.js"></script>
<script src="images/bootstrap.min.js"></script>
<script src="images/jquery.particleground.min.js"></script>

</head>
<body>
<div id="particles">
  <canvas class="pg-canvas" width="1920" height="911" style="display: block;"></canvas>
  <div class="intro" style="margin-top: -256.5px;">
    <div class="container">
      <div class="row" style="padding:30px 0;">
        <div class="col-md-3 col-centered tac"> <p style="font-size:3rem ;color:gray;">创百偟注册页面</p> </div>
      </div>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-md-3 col-sm-8 col-centered">
          <form method="post" id="register-form" autocomplete="off" action="/" class="nice-validator n-default" novalidate>
            <div class="form-group">
              <input type="text" class="form-control" id="account" name="account" placeholder="账号" autocomplete="off" aria-required="true" data-tip="英文字母数字或下划线">
            </div>
            <div class="form-group">
              <input type="text" class="form-control" id="code" name="code" placeholder="短信验证码" style="width:68%;">
              <i><a href="#" id="'hmac" style="font-size:1.2rem;">获取验证码</a></i>
            </div>
            <div class="form-group">
              <input type="password" class="form-control" id="password" name="password" placeholder="密码" aria-required="true" data-tip="请设置您的密码（6-16个字符）">
            </div>
            <div class="form-group">
              <input type="text" class="form-control" id="code" name="code" placeholder="邀请码(可填可不填)" style="">
            </div>
            <div id="validator-tips" class="validator-tips"></div>
            
            <div class="checkbox">
              <label>
                <input type="checkbox" name="ag">
                同意 </label>
              <a href="javascript:void(0)" id="userAgreement" style="text-decoration:none">用户协议</a>
               </div>
            
            <div class="form-center-button">
              <button type="submit" id="submit_button" class="btn btn-primary btn-current">注册</button>
              <a href="#" class="btn btn-default">取消</a> 
              </div>
          </form>
        </div>
      </div>
    </div>
    <div class="modal fade" id="myModal" tabindex="-1" style="text-align: left" role="dialog">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">×</span> </button>
            <h4 class="modal-title">用户协议</h4>
          </div>
          <div class="modal-body" id="agreementContent"></div>
        </div>
      </div>
    </div>
    <link rel="stylesheet" href="images/jquery.validator.css">
    <script src="images/zh-CN.js"></script><script src="images/jquery.validator.min.js"></script> 
  </div>
</div>
<script>
    $(document).ready(function () {
        var intro = $('.intro');
        $('#particles').particleground({
            dotColor: 'rgba(52, 152, 219, 0.36)',
            lineColor: 'rgba(52, 152, 219, 0.86)',
            density: 130000,
            proximity: 500,
            lineWidth: 0.2
        });
        intro.css({
            'margin-top': -(intro.height() / 2 + 100)
        });
    });
</script>
<div style="text-align:center;">
<p><a href="#" target="_blank">江西创百偟科技有限公司</a></p>
</div>
</body>
<script>
function SendCode(){
	
			var codeflag = 60;
			if(codeflag==60){
				var timeflag = setInterval(function(){
				    codeflag--;
					if(codeflag>0){
						$('#hmac').val('重新发送'+codeflag+'s');
						$('#hmac').css({'color':'#99897A','border':'1px solid #99897A'});
						$('#hmac').attr('disabled','disabled');
				    }else{
						codeflag=60;
						$('#hmac').val('获取验证码');
						$('#hmac').css({'color':'#68371D'});
						$('#hmac').removeAttr('disabled');
						clearInterval(timeflag);
				}
			},1000);
				 alert("发送手机号 "+mobile);
				 $.ajax({
			            type:"POST",
			            url:"messageSend.do",
			            data:"mobile="+mobile,
			            success: function(obj) {
			            	alert(obj);
			            	alert(obj.data);
			            	if(obj.data=="4030"){
			            		alert(" 手机号码已被列入黑");
			            	}else if(obj.data=="2"){
			            		alert(" 提交成功");
			            	}
							
						}, error : function(data) {
							alert("错误");
						}
				 });
			}
	}
</script>
</html>