<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head></head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="header">
						<h4 class="title">详细检查数据</h4>
						<p class="category">详细展示历史检测记录</p>
					</div>
					<div class="content table-responsive table-full-width">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>测点编号</th>
									<th>采集器</th>
									<th>测点位置</th>
									<th>传感器编号</th>
									<th>传感器状态</th>
									<th>水深(cm)</th>
									<th>PH值</th>
									<th>镉含量(mg/kg)</th>
									<th>温度(℃)</th>
									<th>日期</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>01</th>
									<th>1102</th>
									<th>中大检测</th>
									<th>018</th>
									<th>1</th>
									<th>5.6</th>
									<th>7.5</th>
									<th>0.05</th>
									<th>27.5</th>
									<th>2017/7/27 13:16:40</th>
								</tr>
								<tr>
									<th>11</th>
									<th>1802</th>
									<th>北京大学</th>
									<th>418</th>
									<th>1</th>
									<th>5.1</th>
									<th>7.1</th>
									<th>0.15</th>
									<th>27.4</th>
									<th>2017/4/27 13:06:40</th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<div class="card card-plain">
					<div class="header">
						<h4 class="title">告警处理</h4>
						<p class="category">详细展示告警记录及处理</p>
					</div>
					<div class="content table-responsive table-full-width">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>设备名称</th>
									<th>设备编号</th>
									<th>参数名</th>
									<th>告警描述</th>
									<th>告警时间</th>
									<th>所属系统</th>
									<th>告警等级</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>水深检测器</th>
									<th>20801</th>
									<th>灌水田</th>
									<th>水位过低</th>
									<th>2017/7/27 13:16:41</th>
									<th>中大自动检测系统</th>
									<th>2</th>
									<th>已处理</th>
								</tr>
								<tr>
									<th>PH值检测器</th>
									<th>20821</th>
									<th>灌水田</th>
									<th>PH值过低</th>
									<th>2017/8/27 13:16:41</th>
									<th>中大自动检测系统</th>
									<th>3</th>
									<th>未处理</th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
						<div class="col-md-12">
				<div class="card card-plain">
					<div class="header">
						<h4 class="title">操作日志</h4>
						<p class="category">详细记录注册用户操作记录</p>
					</div>
					<div class="content table-responsive table-full-width">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>公司</th>
									<th>用户名</th>
									<th>操作时间</th>
									<th>设备类型</th>
									<th>操作内容</th>
									<th>操作参数</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>中大检测</th>
									<th>罗杰</th>
									<th>2017/7/27 13:16:41</th>
									<th>Windows系统</th>
									<th>登陆</th>
									<th>无</th>
								</tr>
								<tr>
									<th>中大检测</th>
									<th>罗杰</th>
									<th>2017/7/27 13:18:41</th>
									<th>Ios手机</th>
									<th>登陆</th>
									<th>无</th>
								</tr>
								<tr>
									<th>中大检测</th>
									<th>罗杰</th>
									<th>2017/7/27 13:19:41</th>
									<th>未知设备</th>
									<th>退出登陆</th>
									<th>无</th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
						<div class="col-md-12">
				<div class="card card-plain">
					<div class="header">
						<h4 class="title">用户信息</h4>
						<p class="category">详细记录用户各项基本信息</p>
					</div>
					<div class="content table-responsive table-full-width">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>序号</th>
									<th>账户</th>
									<th>用户名</th>
									<th>系统名称</th>
									<th>用户角色</th>
									<th>邮箱</th>
									<th>手机号码</th>
									<th>所属公司</th>
									<th>创建时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>055</th>
									<th>mmmy</th>
									<th>罗杰</th>
									<th>农田自动检测系统</th>
									<th>系统管理员</th>
									<th>794948489@qq.com</th>
									<th>18546474587</th>
									<th>中大检测</th>
									<th>2017/7/27 13:19:41</th>
									<th></th>
								</tr>
								<tr>
									<th>541</th>
									<th>mmmy</th>
									<th>罗杰</th>
									<th>农田自动检测系统</th>
									<th>管理员</th>
									<th>8786454@qq.com</th>
									<th>13547944754</th>
									<th>中大检测分公司</th>
									<th>2017/7/27 13:19:41</th>
									<th></th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
						<div class="col-md-12">
				<div class="card card-plain">
					<div class="header">
						<h4 class="title">告警联系人</h4>
						<p class="category">告警时系统自动与联系人建立联系</p>
					</div>
					<div class="content table-responsive table-full-width">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>接收人</th>
									<th>接收告警类型</th>
									<th>接收方式</th>
									<th>手机号</th>
									<th>邮箱</th>
									<th>短信接收告警级别</th>
									<th>邮件接收告警级别</th>
									<th>启用状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>罗杰1</th>
									<th>农田水位告警</th>
									<th>短信接收</th>
									<th>15456547878</th>
									<th>888888@qq.com</th>
									<th>3</th>
									<th>2</th>
									<th>无</th>
									<th></th>
								</tr>
								<tr>
									<th>罗杰2</th>
									<th>农田水位告警</th>
									<th>邮件接收</th>
									<th>13838385438</th>
									<th>99999999@qq.com</th>
									<th>1</th>
									<th>3</th>
									<th>无</th>
									<th></th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
						<div class="col-md-12">
				<div class="card card-plain">
					<div class="header">
						<h4 class="title">数据分析</h4>
						<p class="category">针对异常数据分析</p>
					</div>
					<div class="content table-responsive table-full-width">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>可疑检测点编号</th>
									<th>可疑监测点</th>
									<th>异常数据</th>
									<th>异常原因分析</th>
									<th>时间</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>013</th>
									<th>中大广场</th>
									<th>水位：30</th>
									<th>设备故障</th>
									<th>2017/7/27 13:19:41</th>
								</tr>
								<tr>
									<th>018</th>
									<th>五一广场</th>
									<th>PH值：13</th>
									<th>设备故障</th>
									<th>2017/7/27 13:19:42</th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
						<div class="col-md-12">
				<div class="card card-plain">
					<div class="header">
						<h4 class="title">报表管理</h4>
						<p class="category">对报表进行批量管理</p>
					</div>
					<div class="content table-responsive table-full-width">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>报表名称</th>
									<th>生成时间</th>
									<th>操作人</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>五一广场水位变动报告</th>
									<th>2017/7/27 13:19:42</th>
									<th>罗杰</th>
									<th></th>
								</tr>
								<tr>
									<th>中大检测水位变动报告</th>
									<th>2017/7/27 13:21:42</th>
									<th>罗杰</th>
									<th></th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
