<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
  

  <title>로그인</title>
  <style>
	.user {
      margin: 0 auto;
      display: block;
      margin-bottom: 20px
    }

    h3 {
      margin: 0;
      padding: 0 0 20px;
      color: #fbb710;
      text-align: center
    }

    .loginBox input {
      width: 100%;
      margin-bottom: 20px
    }

    .loginBox input[type="text"],
    .loginBox input[type="password"] {
      border: none;
      border-bottom: 2px solid #262626;
      outline: none;
      height: 40px;
      color: #fff;
      background: transparent;
      font-size: 16px;
      padding-left: 20px;
      box-sizing: border-box
    }

    .loginBox input[type="text"]:hover,
    .loginBox input[type="password"]:hover {
      color: #42F3FA;
      border: 1px solid #42F3FA;
      box-shadow: 0 0 5px rgba(0, 255, 0, .3), 0 0 10px rgba(0, 255, 0, .2), 0 0 15px rgba(0, 255, 0, .1), 0 2px 0 black
    }

    .loginBox input[type="text"]:focus,
    .loginBox input[type="password"]:focus {
      border-bottom: 2px solid #42F3FA
    }

    .inputBox {
      position: relative
    }

    .inputBox span {
      position: absolute;
      top: 10px;
      color: #262626
    }

    .loginBox input[type="submit"] {
      border: none;
      outline: none;
      height: 40px;
      font-size: 16px;
      background: #fbb710;
      color: #fff;
      border-radius: 20px;
      cursor: pointer
    }

    .loginBox a {
      color: #262626;
      font-size: 14px;
      font-weight: bold;
      text-decoration: none;
      text-align: center;
      display: block
    }
  </style>
</head>

<body>

   	<div class="single-product-area section-padding-100 clearfix">
        <div class="container-fluid d-flex justify-content-center align-items-center h-100">
			<div class="loginBox"> <img class="user" src="https://i.ibb.co/yVGxFPR/2.png" height="100px" width="100px">
				<h3>로그인</h3>
				<form method="post" action="/myapp/member/login.do">
					<div class="inputBox"> <input type="text" name="id" placeholder="아이디" id="id" required> </div>
					<div class="inputBox"> <input type="password" name="pwd" placeholder="비밀번호" id="pwd"> </div>
					<input type="submit" value="로그인">
				</form> 
				<a href="/myapp/member/register.do">회원가입</a>
			</div>
        </div>
    </div>
