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
			<div class="col-lg-4 col-md-5">
				<div class="card card-user">
					<div class="image">
						<img src="assets/img/background.jpg" alt="..." />
					</div>
					<div class="content">
						<div class="author">
							<img class="avatar border-white"
								src="assets/img/zdLogo.png" alt="..." />
							<h4 class="title">
								Rojay<br /> <a href="#"><small>@Rojay</small></a>
							</h4>
						</div>
						<p class="description text-center">
							"I like the way you work it <br> No diggity <br> I
							wanna bag it up"
						</p>
					</div>
					<hr>
					<div class="text-center">
						<div class="row">
							<div class="col-md-3 col-md-offset-1">
								<h5>
									12<br />
									<small>项目</small>
								</h5>
							</div>
							<div class="col-md-4">
								<h5>
									20<br />
									<small>测点</small>
								</h5>
							</div>
							<div class="col-md-3">
								<h5>
									2<br />
									<small>预警</small>
								</h5>
							</div>
						</div>
					</div>
				</div>
				<div class="card">
					<div class="header">
						<h4 class="title">项目列表</h4>
					</div>
					<div class="content">
						<ul class="list-unstyled team-members">
							<li>
								<div class="row">
									<div class="col-xs-3">
										<div class="avatar">
											<img src="assets/img/faces/face-0.jpg" alt="Circle Image"
												class="img-circle img-no-padding img-responsive">
										</div>
									</div>
									<div class="col-xs-6">
										湘潭农田 <br /> <span class="text-muted"><small>正常</small></span>
									</div>
									<div class="col-xs-3 text-right">
										<!-- <button class="btn btn-sm btn-success btn-icon"><i class="fa fa-envelope"></i></button> -->
										<btn class="btn btn-sm btn-success btn-icon">
										<i class="fa fa-envelope"></i></btn>
									</div>
								</div>
							</li>
							<li>
								<div class="row">
									<div class="col-xs-3">
										<div class="avatar">
											<img src="assets/img/faces/face-1.jpg" alt="Circle Image"
												class="img-circle img-no-padding img-responsive">
										</div>
									</div>
									<div class="col-xs-6">
										长沙隧道 <br /> <span class="text-success"><small>正常</small></span>
									</div>
									<div class="col-xs-3 text-right">
										<btn class="btn btn-sm btn-success btn-icon">
										<i class="fa fa-envelope"></i></btn>
									</div>
								</div>
							</li>
							<li>
								<div class="row">
									<div class="col-xs-3">
										<div class="avatar">
											<img src="assets/img/faces/face-3.jpg" alt="Circle Image"
												class="img-circle img-no-padding img-responsive">
										</div>
									</div>
									<div class="col-xs-6">
										宁乡农田 <br /> <span class="text-danger"><small>正常</small></span>
									</div>
									<div class="col-xs-3 text-right">
										<btn class="btn btn-sm btn-success btn-icon">
										<i class="fa fa-envelope"></i></btn>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-8 col-md-7">
				<div class="card">
					<div class="header">
						<h4 class="title">编辑个人资料</h4>
					</div>
					<div class="content">
						<form>
							<div class="row">
								<div class="col-md-5">
									<div class="form-group">
										<label>公司</label> <input type="text"
											class="form-control border-input" disabled
											placeholder="Company" value="${userInfo.company}">
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>用户名</label> <input type="text"
											class="form-control border-input" placeholder="Username"
											value="${userInfo.name}">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="exampleInputEmail1">邮箱地址</label> <input
											type="email" class="form-control border-input"
											placeholder="Email" value="${userInfo.email}">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>姓名</label> <input type="text"
											class="form-control border-input" placeholder="Company"
											value="${userInfo.linkman}">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>联系电话</label> <input type="text"
											class="form-control border-input" placeholder="Last Name"
											value="${userInfo.phone}">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>详细地址</label> <input type="text"
											class="form-control border-input" placeholder="Home Address"
											value="洋湖街道学士路755号中大检测">
									</div>
								</div>
							</div>
							
							 <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>省</label>
                                                <input type="text" class="form-control border-input" placeholder="Province" value="湖南省">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>市</label>
                                                <input type="text" class="form-control border-input" placeholder="City" value="长沙市">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>区、县</label>
                                                <input type="text" class="form-control border-input" placeholder="	
Region" value="岳麓区">
                                            </div>
                                        </div>
                                    </div>
							
							
							
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>原始密码</label> <input type="password"
											class="form-control border-input" placeholder="old_pwd"
											value="${userInfo.password}">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>新密码</label> <input type="password"
											class="form-control border-input" placeholder="newpwd"
											value="Australia">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>确认密码</label> <input type="password"
											class="form-control border-input" placeholder="ZIP Code">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>个人说明</label>
										<textarea rows="5" class="form-control border-input"
											placeholder="Here can be your description" name="Mike">Oh so, your weak rhyme
You doubt I'll bother, reading into it
I'll probably won't, left to my own devices
But that's the difference in our opinions.</textarea>
									</div>
								</div>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-info btn-fill btn-wd">更新信息</button>
							</div>
							<div class="clearfix"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
