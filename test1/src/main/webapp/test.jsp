<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css"
	href="public/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="public/css/emoji.css">
<link rel="stylesheet" type="text/css"
	href="public/Admin/Css/style.css">
<script type="text/javascript"
	src="public/js/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://msyh.jxhaozhan.com/Public/js/skins/default.css">
<script type="text/javascript"
	src="/Public/js/jquery.artDialog.js?skin=default"></script>
<script type="text/javascript"
	src="/Public/js/iframeTools.js?v=2017040521"></script>
<script type="text/javascript"
	src="/Public/Admin/Js/common.js?v=2017040521"></script>
<script type="text/javascript"
	src="public/css/bootstrap.min.css"></script>
<script type="text/javascript" src="public/js/skin/layer.css"></script>
<link rel="stylesheet"
	href="http://msyh.jxhaozhan.com/Public/js/skin/layer.css"
	id="layui_layer_skinlayercss" style="">
<script type="text/javascript">
	$(document).ready(function() {
		get_notices(0, 1);
		get_notices(1, 1);
	});

	function get_notices(status, clear) {
		setTimeout(function() {
			get_notices(status, 0)
		}, 6000);
		$
				.post(
						"/index.php/Admin/Ajax/get_notices.html",
						{
							'type' : 'order',
							'status' : status,
							'clear' : clear
						},
						function(res) {
							if (res.data) {
								var notices = '';
								var _uri = "/index.php/Admin/Orders/index/searchtype/order_sn/menuid/224.html";
								$
										.each(
												res.data,
												function(i, n) {
													uri = _uri + '?keyword='
															+ n.order_sn;
													remark = status == 0 ? '下单了'
															: '订单支付了';
													notices += '<li><a href="'+uri+'" target="_blank"><span>'
															+ n.uname
															+ '['
															+ n.consignee
															+ ']</span>&nbsp;'
															+ remark
															+ '</a></li>';
												});
								if (notices != '') {
									notices = '<div style="margin-left:15px;"><ul>'
											+ notices + '</ul></div>';
									layer.open({
										type : 1,
										title : status == 0 ? '用户下单通知'
												: '用户支付通知',
										content : notices,
										area : [ '300px', '300px' ],
										offset : 'rb',
										btn : [ '我知道了' ],
										shade : 0,
										shift : 6
									});
								}
							}
						});
	}
</script>
<title>信用卡管理系统-后台管理</title>
</head>
<body style="background: #E2E9EA">
	<div id="header" class="header">
		<div class="logo">
			<a href="http://msyh.jxhaozhan.com" target="_blank"><img
				src="/Public/Admin/Images/admin_logo.png" width="190"></a>
		</div>
		<div class="nav f_r">
			<a href="javascript:void(0);" onclick="gocacheurl();">更新缓存</a> <i>|</i>
			<a href="/index.php/Admin/Index/profile/menuid/37.html" target="main">我的资料</a>
			<i>|</i> <a href="/index.php/Admin/Index/password/menuid/21.html"
				target="main">修改密码</a> <i>|</i> <a
				href="/index.php/Admin/User/logout.html" target="_top"
				onclick="return confirm('确定要退系统吗？');">退出系统</a> &nbsp;&nbsp;&nbsp;
		</div>
		<div class="nav">
			&nbsp;&nbsp;&nbsp;&nbsp;<strong>Admin</strong> 欢迎您！分组:<b>超级管理员</b> <i>|</i>
			<a href="/index.php/index.html" target="_blank">返回首页</a>
		</div>

		<div class="topmenu">
			<ul>
				<li id="menu_1"><span class=""><a
						href="javascript:void(0);" onclick="sethighlight(1);">后台首页</a></span></li>
				<li id="menu_2"><span><a href="javascript:void(0);"
						onclick="sethighlight(2);">系统设置</a></span></li>
				<li id="menu_163"><span><a href="javascript:void(0);"
						onclick="sethighlight(163);">资讯管理</a></span></li>
				<li id="menu_112"><span><a href="javascript:void(0);"
						onclick="sethighlight(112);">会员管理</a></span></li>
				<li id="menu_214"><span class="current"><a
						href="javascript:void(0);" onclick="sethighlight(214);">商品管理</a></span></li>
				<li id="menu_119"><span><a href="javascript:void(0);"
						onclick="sethighlight(119);">财务管理</a></span></li>
				<li id="menu_291"><span><a href="javascript:void(0);"
						onclick="sethighlight(291);">代理商及办卡管理</a></span></li>
			</ul>
		</div>
		<div class="header_footer"></div>
	</div>
	<div id="Main_content">
		<div id="MainBox">
			<div class="main_box">
				<iframe name="main" id="Main" src="/index.php/Admin/Index/main.html"
					frameborder="false" scrolling="auto" width="100%" height="auto"
					allowtransparency="true" style="height: 319px;"></iframe>
			</div>
		</div>
		<div id="leftMenuBox">
			<div id="leftMenu" style="height: 319px;">
				<div style="padding-left: 12px; _padding-left: 10px;">
					<dl id="nav_1" style="display: none;">
						<dt>后台首页</dt>
						<dd id="nav_20" class="">
							<span
								onclick="javascript:gourl('20','/index.php/Admin/Index/main/menuid/20.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Index/main/menuid/20.html" target="main">后台首页</a>
							</span>
						</dd>
						<dd id="nav_21">
							<span
								onclick="javascript:gourl('21','/index.php/Admin/Index/password/menuid/21.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Index/password/menuid/21.html"
								target="main">修改密码</a>
							</span>
						</dd>
						<dd id="nav_37">
							<span
								onclick="javascript:gourl('37','/index.php/Admin/Index/profile/menuid/37.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Index/profile/menuid/37.html"
								target="main">个人资料</a>
							</span>
						</dd>
						<dd id="nav_23">
							<span
								onclick="javascript:gourl('23','/index.php/Admin/System/cache/menuid/23.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/System/cache/menuid/23.html" target="main">更新缓存</a>
							</span>
						</dd>
						<dd id="nav_24">
							<span
								onclick="javascript:gourl('24','/index.php/Admin/Index/log/menuid/24.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Index/log/menuid/24.html" target="main">系统日志</a>
							</span>
						</dd>
					</dl>
					<dl id="nav_2" style="display: none;">
						<dt>系统设置</dt>
						<dd id="nav_26">
							<span
								onclick="javascript:gourl('26','/index.php/Admin/Config/index/groupid/1/menuid/26.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Config/index/groupid/1/menuid/26.html"
								target="main">参数设置</a>
							</span>
						</dd>
						<dd id="nav_204">
							<span
								onclick="javascript:gourl('204','/index.php/Admin/Payment/index/menuid/204.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Payment/index/menuid/204.html"
								target="main">支付方式设置</a>
							</span>
						</dd>
						<dd id="nav_174">
							<span
								onclick="javascript:gourl('174','/index.php/Admin/region/index/menuid/174.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/region/index/menuid/174.html"
								target="main">地区管理</a>
							</span>
						</dd>
						<dd id="nav_111">
							<span
								onclick="javascript:gourl('111','/index.php/Admin/Admin/index/menuid/111.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Admin/index/menuid/111.html" target="main">管理员列表</a>
							</span>
						</dd>
						<dd id="nav_38">
							<span
								onclick="javascript:gourl('38','/index.php/Admin/Group/index/menuid/38.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Group/index/menuid/38.html" target="main">管理员组</a>
							</span>
						</dd>
						<dd id="nav_261">
							<span
								onclick="javascript:gourl('261','/index.php/Admin/Config/index/groupid/8/menuid/261.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Config/index/groupid/8/menuid/261.html"
								target="main">常规推广二维码设置</a>
							</span>
						</dd>
						<dd id="nav_51">
							<span
								onclick="javascript:gourl('51','/index.php/Admin/Access/index/type/1/menuid/51.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Access/index/type/1/menuid/51.html"
								target="main">权限管理</a>
							</span>
						</dd>
						<dd id="nav_296">
							<span
								onclick="javascript:gourl('296','/index.php/Admin/Config/index/groupid/20/menuid/296.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Config/index/groupid/20/menuid/296.html"
								target="main">校园推广二维码设置</a>
							</span>
						</dd>
					</dl>
					<dl id="nav_163" style="display: none;">
						<dt>资讯管理</dt>
						<dd id="nav_164">
							<span
								onclick="javascript:gourl('164','/index.php/Admin/News/index/menuid/164.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/News/index/menuid/164.html" target="main">资讯列表</a>
							</span>
						</dd>
						<dd id="nav_166">
							<span
								onclick="javascript:gourl('166','/index.php/Admin/Category/index/type/news/menuid/166.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Category/index/type/news/menuid/166.html"
								target="main">资讯分类</a>
							</span>
						</dd>
						<dd id="nav_221">
							<span
								onclick="javascript:gourl('221','/index.php/Admin/Block/index/type/1/menuid/221.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Block/index/type/1/menuid/221.html"
								target="main">面包屑管理</a>
							</span>
						</dd>
						<dd id="nav_238">
							<span
								onclick="javascript:gourl('238','/index.php/Admin/Slide/index/menuid/238.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Slide/index/menuid/238.html" target="main">首页广告</a>
							</span>
						</dd>
						<dd id="nav_249">
							<span
								onclick="javascript:gourl('249','/index.php/Admin/Category/index/type/pages/menuid/249.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Category/index/type/pages/menuid/249.html"
								target="main">单页管理</a>
							</span>
						</dd>
					</dl>
					<dl id="nav_112" style="display: none;">
						<dt>会员管理</dt>
						<dd id="nav_158">
							<span
								onclick="javascript:gourl('158','/index.php/Admin/Member/main/menuid/158.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Member/main/menuid/158.html" target="main">会员统计一览</a>
							</span>
						</dd>
						<dd id="nav_113">
							<span
								onclick="javascript:gourl('113','/index.php/Admin/Member/index/menuid/113.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Member/index/menuid/113.html"
								target="main">会员列表</a>
							</span>
						</dd>
						<dd id="nav_133">
							<span
								onclick="javascript:gourl('133','/index.php/Admin/Group/member/menuid/133.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Group/member/menuid/133.html"
								target="main">会员类型管理</a>
							</span>
						</dd>
					</dl>
					<dl id="nav_214" style="display: block;">
						<dt>商品管理</dt>
						<dd id="nav_215" class="on">
							<span
								onclick="javascript:gourl('215','/index.php/Admin/goods/index/menuid/215.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/goods/index/menuid/215.html" target="main">商品列表</a>
							</span>
						</dd>
						<dd id="nav_283" class="">
							<span
								onclick="javascript:gourl('283','/index.php/Admin/Category/index/type/goods/menuid/283.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Category/index/type/goods/menuid/283.html"
								target="main">商品分类</a>
							</span>
						</dd>
					</dl>
					<dl id="nav_119" style="display: none;">
						<dt>财务管理</dt>
						<dd id="nav_160">
							<span
								onclick="javascript:gourl('160','/index.php/Admin/Config/index/groupid/6/menuid/160.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Config/index/groupid/6/menuid/160.html"
								target="main">交易设置</a>
							</span>
						</dd>
						<dd id="nav_157">
							<span
								onclick="javascript:gourl('157','/index.php/Admin/Finance/cash/menuid/157.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Finance/cash/menuid/157.html"
								target="main">资金明细</a>
							</span>
						</dd>
						<dd id="nav_120">
							<span
								onclick="javascript:gourl('120','/index.php/Admin/Finance/index/menuid/120.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Finance/index/menuid/120.html"
								target="main">财务概况</a>
							</span>
						</dd>
						<dd id="nav_243">
							<span
								onclick="javascript:gourl('243','/index.php/Admin/Paylog/index/menuid/243.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Paylog/index/menuid/243.html"
								target="main">支付记录管理</a>
							</span>
						</dd>
						<dd id="nav_282">
							<span
								onclick="javascript:gourl('282','/index.php/Admin/Withdraw/index/menuid/282.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Withdraw/index/menuid/282.html"
								target="main">提现管理</a>
							</span>
						</dd>
					</dl>
					<dl id="nav_291" style="display: none;">
						<dt>代理商及办卡管理</dt>
						<dd id="nav_292">
							<span
								onclick="javascript:gourl('292','/index.php/Admin/Agent/index/menuid/292.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Agent/index/menuid/292.html" target="main">代理商列表</a>
							</span>
						</dd>
						<dd id="nav_295">
							<span
								onclick="javascript:gourl('295','/index.php/Admin/Agent/apply_index/menuid/295.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Agent/apply_index/menuid/295.html"
								target="main">办卡列表</a>
							</span>
						</dd>
						<dd id="nav_285">
							<span
								onclick="javascript:gourl('285','/index.php/Admin/Profit/settle_index/menuid/285.html')">
								<a href="javascript:void()"
								uri="/index.php/Admin/Profit/settle_index/menuid/285.html"
								target="main">收益结算</a>
							</span>
						</dd>
					</dl>
				</div>
			</div>
			<div id="Main_drop">
				<a href="javascript:toggleMenu(1);" class="on"><img
					src="/Public/Admin/Images/admin_barclose.gif" border="0"></a> <a
					href="javascript:toggleMenu(0);" class="off" style="display: none;"><img
					src="/Public/Admin/Images/admin_baropen.gif" border="0"></a>
			</div>
		</div>

		<div id="footer" class="footer">
			Powered by <a href="http://www.zooyoo.cc" target="_blank">zooyoo.cc</a>&nbsp;南昌卓云科技&nbsp;
			<span id="run">为了更好的体验请使用<a
				href="https://www.baidu.com/s?wd=%20chrome" target="_blank">谷歌</a>或者<a
				href="http://www.firefox.com.cn/" target="_blank">火狐</a>浏览器
			</span>
		</div>

		<script language="JavaScript">
			var now_id;
			if (!Array.prototype.map)
				Array.prototype.map = function(fn, scope) {
					var result = [], ri = 0;
					for (var i = 0, n = this.length; i < n; i++) {
						if (i in this) {
							result[ri++] = fn.call(scope, this[i], i, this);
						}
					}
					return result;
				};
			var getWindowWH = function() {
				return [ "Height", "Width" ].map(function(name) {
					return window["inner" + name]
							|| document.compatMode === "CSS1Compat"
							&& document.documentElement["client" + name]
							|| document.body["client" + name]
				});
			}
			window.onload = function() {
				if (!+"\v1" && !document.querySelector) { //IE6 IE7
					document.body.onresize = resize;
				} else {
					window.onresize = resize;
				}
				function resize() {
					wSize();
					return false;
				}
			}
			function wSize() {
				var str = getWindowWH();
				var strs = new Array();
				strs = str.toString().split(","); //字符串分割
				var h = strs[0] - 95 - 30;
				$('#leftMenu').height(h);
				$('#Main').height(h);
			}
			wSize();

			function set_now_menu(id) {
				if (id) {
					now_id = id;
				} else {
					return now_id;
				}
			}

			function sethighlight(n) {
				$('.topmenu li span').removeClass('current');
				$('#menu_' + n + ' span').addClass('current');
				$('#leftMenu dl').hide();
				$('#nav_' + n).show();
				$('#leftMenu dl dd').removeClass('on');
				$('#nav_' + n + ' dd').eq(0).addClass('on');
				url = $('#nav_' + n + ' dd a').eq(0).attr('uri');
				if (url)
					window.main.location.href = url;
			}
			function gourl(n, url) {
				now_id = "";
				$('#leftMenu dl dd').removeClass('on');
				$('#nav_' + n).addClass('on');
				window.main.location.href = url;
			}

			function gocacheurl() {
				mainurl = window.main.location.href;
				window.main.location.href = "/index.php/Admin/System/cache/menuid/23.html?back_url="
						+ encodeURIComponent(mainurl);
			}

			function toggleMenu(doit) {
				if (doit == 1) {
					$('#Main_drop a.on').hide();
					$('#Main_drop a.off').show();
					$('#MainBox .main_box').css('margin-left', '24px');
					$('#leftMenu').hide();
				} else {
					$('#Main_drop a.off').hide();
					$('#Main_drop a.on').show();
					$('#leftMenu').show();
					$('#MainBox .main_box').css('margin-left', '224px');
				}
			}
			$(function() {
				var light = $(".topmenu li:first").find("a").attr("onClick");
				if (light) {
					eval(light)
				} else {
					sethighlight(1)
				}

			})
		</script>

	</div>
	<div
		style="display: none; position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; cursor: move; opacity: 0; background: rgb(255, 255, 255);"></div>
	<div
		style="position: absolute; top: -1970px; left: -1970px; display: none;">
		<iframe style="width: 186px; height: 198px;"
			src="http://msyh.jxhaozhan.com/Public/js/MyDate/showdate.htm"
			frameborder="0" border="0" scrolling="no"></iframe>
	</div>
	<div class="" style="display: none; position: absolute;">
		<div class="aui_outer">
			<table class="aui_border">
				<tbody>
					<tr>
						<td class="aui_nw"></td>
						<td class="aui_n"></td>
						<td class="aui_ne"></td>
					</tr>
					<tr>
						<td class="aui_w"></td>
						<td class="aui_c"><div class="aui_inner">
								<table class="aui_dialog">
									<tbody>
										<tr>
											<td colspan="2" class="aui_header"><div
													class="aui_titleBar">
													<div class="aui_title" style="cursor: move;"></div>
													<a class="aui_close" href="javascript:/*artDialog*/;">×</a>
												</div></td>
										</tr>
										<tr>
											<td class="aui_icon" style="display: none;"><div
													class="aui_iconBg" style="background: none;"></div></td>
											<td class="aui_main" style="width: auto; height: auto;"><div
													class="aui_content" style="padding: 20px 25px;"></div></td>
										</tr>
										<tr>
											<td colspan="2" class="aui_footer"><div
													class="aui_buttons" style="display: none;"></div></td>
										</tr>
									</tbody>
								</table>
							</div></td>
						<td class="aui_e"></td>
					</tr>
					<tr>
						<td class="aui_sw"></td>
						<td class="aui_s"></td>
						<td class="aui_se" style="cursor: se-resize;"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>