<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

  <title>로그인</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      background: url(https://i.ibb.co/nnCb7gV/6845078.png) no-repeat;
      height: 100vh;
      font-family: sans-serif;
      background-size: cover;
      background-repeat: no-repeat;
      background-position: center;
      overflow: hidden
    }

    .loginBox {
      margin-top: 10px
    }

    @media screen and (max-width: 600px) {
      body {
        background-size: cover fixed;
        /* : fixed */
      }
    }

    #particles-js {
      height: 100%
    }

    .loginBox {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      width: 350px;
      min-height: 200px;
      background: #000000;
      border-radius: 10px;
      padding: 40px;
      box-sizing: border-box
    }

    .user {
      margin: 0 auto;
      display: block;
      margin-bottom: 20px
    }

    h3 {
      margin: 0;
      padding: 0 0 20px;
      color: #59238F;
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
      background: #59238F;
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

    a:hover {
      color: #00ffff
    }

    p {
      color: #0000ff
    }
  </style>
</head>

<body>

  <nav class="navbar navbar-expand-md navbar-dark bg-primary">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Navbar</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Link</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
              aria-expanded="false">
              Dropdown
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="#">Action</a></li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li>
                <hr class="dropdown-divider">
              </li>
              <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
          </li>
        </ul>
        <form class="d-flex">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
      </div>
    </div>
  </nav>

  <div class="loginBox"> <img class="user" src="https://i.ibb.co/yVGxFPR/2.png" height="100px" width="100px">
    <h3>로그인</h3>
    <form method="post" action="/myapp/member/login.do">
      <div class="inputBox"> <input type="text" name="id" placeholder="아이디" id="id" required> </div>
      <div class="inputBox"> <input type="password" name="pwd" placeholder="비밀번호" id="pwd"> </div>
      <input type="submit" value="로그인">
    </form> <a href="/myapp/member/register.do">회원가입</a>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
    integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
    integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
    crossorigin="anonymous"></script>

</body>

</html>