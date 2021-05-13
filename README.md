# amado-templet 쇼핑몰

# 목차
- [사용기술](#사용기술)
- [다이어그램](#다이어그램)
- [디렉토리 구조](#디렉토리-구조)
- [화면구현 및 설명](#화면구현-및-설명)

## 사용 기술
- 백엔드
  - Java
  - MySQL
  - Spring Framework
  - MyBatis
  - Tiles Framework
- 프론트엔드
  - HTML
  - CSS
  - Javascript
  - JQuery
  - Bootstrap
- 서버
  - Apache
- 개발툴
  - Eclipse
  - MySQL Workbench

## 클래스 다이어그램

## 다이어그램
### Class Diagram

### ER-Diagram

### 디렉토리 구조
```
├───java
│   └───com
│       └───myspring
│           └───myapp
│               │   HomeController.java
│               │   
│               ├───board
│               │   ├───cotroller
│               │   │       BoardController.java
│               │   │       BoardControllerImpl.java
│               │   │       RestBoardController.java
│               │   │       RestBoardControllerImpl.java
│               │   │       
│               │   ├───dao
│               │   │       BoardDAO.java
│               │   │       BoardDAOImpl.java
│               │   │       
│               │   ├───service
│               │   │       BoardService.java
│               │   │       BoardServiceImpl.java
│               │   │       
│               │   └───vo
│               │           BoardVO.java
│               │           ReplyVO.java
│               │           
│               ├───cart
│               │   ├───controller
│               │   │       CartController.java
│               │   │       CartControllerImpl.java
│               │   │       
│               │   ├───dao
│               │   │       CartDAO.java
│               │   │       CartDAOImpl.java
│               │   │       
│               │   ├───service
│               │   │       CartService.java
│               │   │       CartServiceImpl.java
│               │   │       
│               │   └───vo
│               │           CartVO.java
│               │           
│               ├───common
│               │   ├───base
│               │   │       BaseController.java
│               │   │       
│               │   ├───file
│               │   │       FileDownloadController.java
│               │   │       
│               │   ├───interceptor
│               │   │       ViewNameInterceptor.java
│               │   │       
│               │   ├───log
│               │   │       LoggingAdvice.java
│               │   │       
│               │   └───pagination
│               │           Pagination.java
│               │           
│               ├───member
│               │   ├───controller
│               │   │       MemberController.java
│               │   │       MemberControllerImpl.java
│               │   │       
│               │   ├───dao
│               │   │       MemberDAO.java
│               │   │       MemberDAOImpl.java
│               │   │       
│               │   ├───service
│               │   │       MemberService.java
│               │   │       MemberServiceImple.java
│               │   │       
│               │   └───vo
│               │           MemberVO.java
│               │           
│               └───product
│                   ├───controller
│                   │       ProductController.java
│                   │       ProductControllerImpl.java
│                   │       
│                   ├───dao
│                   │       ProductDAO.java
│                   │       ProductDAOImpl.java
│                   │       
│                   ├───service
│                   │       ProductService.java
│                   │       ProductServiceImpl.java
│                   │       
│                   └───vo
│                           ProductVO.java
│                           
├───resources
│   │   log4j.xml
│   │   
│   ├───META-INF
│   ├───mybatis
│   │   ├───mappers
│   │   │       board.xml
│   │   │       cart.xml
│   │   │       member.xml
│   │   │       product.xml
│   │   │       
│   │   └───model
│   │           modelConfig.xml
│   │           
│   └───tiles
│           tiles.xml
│           
└───webapp
    ├───resources
    │   ├───.sass-cache
    │   │   ├───23fb10bb6531a16595cc9a8cbcaeb8f40f41ec84
    │   │   │       style.scssc
    │   │   │       _mixin.scssc
    │   │   │       _responsive.scssc
    │   │   │       _theme_color.scssc
    │   │   │       _variables.scssc
    │   │   │       
    │   │   └───997c61c8c2a2a831333fab68bc2254612bdf8817
    │   │           style.scssc
    │   │           _mixin.scssc
    │   │           _responsive.scssc
    │   │           _theme_color.scssc
    │   │           _variables.scssc
    │   │           
    │   ├───css
    │   │       animate.css
    │   │       bootstrap.min.css
    │   │       classy-nav.min.css
    │   │       core-style.css
    │   │       core-style.css.map
    │   │       font-awesome.min.css
    │   │       jquery-ui.min.css
    │   │       magnific-popup.css
    │   │       nice-select.css
    │   │       owl.carousel.css
    │   │       style.css
    │   │       
    │   ├───fonts
    │   │       fontawesome-webfont.eot
    │   │       fontawesome-webfont.svg
    │   │       fontawesome-webfont.ttf
    │   │       fontawesome-webfont.woff
    │   │       fontawesome-webfont.woff2
    │   │       FontAwesome.otf
    │   │       helveticaneue_medium-webfont.ttf
    │   │       helveticaneue_medium-webfont.woff
    │   │       helveticaneue_medium-webfont.woff2
    │   │       helvetica_neu_bold-webfont.ttf
    │   │       helvetica_neu_bold-webfont.woff
    │   │       helvetica_neu_bold-webfont.woff2
    │   │       
    │   ├───img
    │   │   ├───bg-img
    │   │   │       1.jpg
    │   │   │       2.jpg
    │   │   │       3.jpg
    │   │   │       4.jpg
    │   │   │       5.jpg
    │   │   │       6.jpg
    │   │   │       7.jpg
    │   │   │       8.jpg
    │   │   │       9.jpg
    │   │   │       cart1.jpg
    │   │   │       cart2.jpg
    │   │   │       cart3.jpg
    │   │   │       
    │   │   ├───core-img
    │   │   │       cart.png
    │   │   │       close.png
    │   │   │       favicon.ico
    │   │   │       favorites.png
    │   │   │       login.png
    │   │   │       logo.png
    │   │   │       logo2.png
    │   │   │       logout.png
    │   │   │       paypal.png
    │   │   │       search.png
    │   │   │       
    │   │   └───product-img
    │   │           pro-big-1.jpg
    │   │           pro-big-2.jpg
    │   │           pro-big-3.jpg
    │   │           pro-big-4.jpg
    │   │           product1.jpg
    │   │           product2.jpg
    │   │           product3.jpg
    │   │           product4.jpg
    │   │           product5.jpg
    │   │           product6.jpg
    │   │           
    │   ├───js
    │   │   │   active.js
    │   │   │   bootstrap.min.js
    │   │   │   classy-nav.min.js
    │   │   │   map-active.js
    │   │   │   plugins.js
    │   │   │   popper.min.js
    │   │   │   
    │   │   └───jquery
    │   │           jquery-2.2.4.min.js
    │   │           
    │   └───scss
    │           style.scss
    │           _mixin.scss
    │           _responsive.scss
    │           _theme_color.scss
    │           _variables.scss
    │           
    └───WEB-INF
        │   web.xml
        │   
        ├───classes
        ├───config
        │   └───jdbc
        │           jdbc.properties
        │           
        ├───diagram
        │       UML.ucls
        │       
        ├───lib
        │       ojdbc6.jar
        │       
        ├───spring
        │   │   action-mybatis.xml
        │   │   root-context.xml
        │   │   
        │   └───appServlet
        │           servlet-context.xml
        │           
        └───views
            │   checkout.jsp
            │   index.jsp
            │   
            ├───board
            │       articleForm.jsp
            │       articleRead.jsp
            │       boardList.jsp
            │       
            ├───cart
            │       cart.jsp
            │       
            ├───common
            │       footer.jsp
            │       header.jsp
            │       layout.jsp
            │       side.jsp
            │       
            ├───member
            │       login.jsp
            │       register.jsp
            │       
            └───product
                    product_add.jsp
                    product_details.jsp
                    shop.jsp
```

## 화면구현 및 설명
  - [index](#index)
  - [로그인](#로그인)
  - [회원가입](#회원가입)
  - [PRODUCT](#PRODUCT)
    - [SHOP](#shop)
    - [상품등록](#상품등록)
  - [CART](#cart)
  - [BOARD](#board)
    - [글 목록](#글-목록)
    - [글 보기](#글-보기)
    - [글 쓰기](#글-쓰기)


### index
![index](https://user-images.githubusercontent.com/70364742/118134712-32031680-b43d-11eb-822a-b6a5895a78d6.png)
- sidebar, footer 고정
- 관리자(admin)로 로그인시 상품등록 항목 추가
- 로그인한 아이디 표시
- 각 상품 이미지 클릭시 SHOP으로 이동

### 로그인
![login](https://user-images.githubusercontent.com/70364742/118134782-42b38c80-b43d-11eb-9747-5f78d0445683.png)
- 로그인 완료하면 세션에 로그인 정보와 로그인 여부값 저장

### 회원가입
![register](https://user-images.githubusercontent.com/70364742/118134819-4cd58b00-b43d-11eb-9e46-961f5bfd560c.png)

### PRODUCT
#### SHOP
![shop](https://user-images.githubusercontent.com/70364742/118134901-62e34b80-b43d-11eb-823e-36a7117d62d7.png)
- View에서 선택한 수 만큼 상품리스트 출력
- 총 상품 개수와 View에 선택된 수에 따른 pagnation 클래스를 사용한 페이징 처리.
- 상품 이미지, 이름 클릭시 해당 상품 상세보기 화면으로 이동  
- 상품 카트에 추가하기
  - 로그인: 카트 아이콘 클릭시 Ajax 사용하여 카트에 상품 추가후 modal 이용한 팝업창 생성.  
  - 비로그인: 로그인후 가능하다는 modal 팝업창 생성

#### 상품등록
![addProduct01](https://user-images.githubusercontent.com/70364742/118135010-7d1d2980-b43d-11eb-8294-e94666878b88.png)
![addProduct02](https://user-images.githubusercontent.com/70364742/118135020-7f7f8380-b43d-11eb-8bfb-218fcdd1f51a.png)


- 관리자로 로그인한 경우에만 보이는 메뉴를 통해 이동
- 이미지 파일 선택하면 자바스크립트를 통해 filereader 사용하여 선택한 이미지를 보여준다.
- 이미지의 경우 upload 메소드를 이용하여 지정해 놓은 저장소에 저장한다.
- 이미지 사용은 공통 기능에서 fileDownloadController의 메소드를 통해 이미지를 받는다.

### CART

- 페이지 로딩할 때 각 상품의 금액을 더해서 총 금액을 계산하여 변경
- 상품 삭제시 팝업창으로 삭제여부 한번 더 확인후 상품 코드값 전달하고 세션에서 아이디 받아서 해당 상품 삭제
- 수량 증가/감소는 각각 기호 아이콘에 onclick 이벤트로 현재 값에서 증가/감소 후, change() 메소드에 매개변수 전달하여 Ajax 사용하여 변경하고, 총 금액을 다시 계산하여 변경

### BOARD
#### 글 목록
!이미지
- 글 제목옆에 댓글 수 표시
- 해당 글 이동시 조회수 증가
!팝업창 이미지
- 로그인 안한 경우 로그인 화면으로 이동. 로그인 완료 후 같이 전달한 페이지(action)값으로 글 쓰기 페이지로 이동
- pagination 클래스 사용하여 페이징 처리

#### 글 보기
- 댓글 CRUD  
수정/삭제 버튼은 본인의 것만 표시.  
Ajax를 통한 CRUD
  - 목록: 댓글이 있는 경우 페이지 로딩시 댓글 목록 전체 가져와서 댓글 수 만큼 추가
  - 추가: 글 번호, 아이디, 글 내용 전달하여 댓글 추가
  - 수정: 댓글 번호, 아이디, 글 내용으로 수정할 댓글창 활성화하여 수정후 저장
  - 삭제: 댓글 번호 전달하여 해당 글 삭제

#### 글 쓰기
- form에서 아이디, 글 제목, 글 내용 전달하여 글 저장.


