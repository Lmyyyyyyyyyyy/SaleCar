<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>曙阳汽车销售</title>
<link rel="stylesheet" href="<%=basePath%>/css/index1.css">
<link rel="stylesheet" href="<%=basePath%>/css/all.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<link href="<%=basePath%>/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="<%=basePath%>/css/style1.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
<script src="<%=basePath%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="<%=basePath%>/js/simpleCart.min.js"> </script>
<body>
<div class="shell">
  <div class="shell-top">
    <div class="word">
      <h2>Welcome to</h2>
      <h2>曙阳汽车销售中心</h2>
    </div>
    <video controls="controls">
      <source src="synth city by VISUALDON 4K 60 FPS.mp4" type="video/mp4" />
    </video>
  </div>
  <div class="shell-main">
    <div class="shell-main-nav">
      <div class="logo">
        <img src="image/logo.jpg" alt="">
        <span>曙阳汽车销售</span>
      </div>
      <ul>
        <li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
        <li><a href="${pageContext.request.contextPath}/product/showAllProducts">汽车产品</a></li>
        <c:if test="${sessionScope.user!=null }">
          欢迎${sessionScope.user.username }回来!|
          <a href="${pageContext.request.contextPath}/exit.jsp">退出</a>
          <%
            if(session.getAttribute("merchant")!=null)
              session.removeAttribute("merchant");
          %>
        </c:if>
        <c:if test="${sessionScope.user ==null }">
          <li><a href="${pageContext.request.contextPath}/login.jsp">登录</a></li>
          &nbsp;&nbsp;|&nbsp;&nbsp;
          <li><a href="${pageContext.request.contextPath}/register1.jsp">注册</a></li>
        </c:if>
        <li><a id="goto_order" href="${pageContext.request.contextPath}/order/findOrderListByUserId">我的订单</a></li>
        <li><a id="goto_cart" href="${pageContext.request.contextPath}/cart.jsp">我的购物车</a></li>
        <div class="nav-box"></div>
      </ul>
    </div>
    <div class="shell-main-bottom1">
      <h2><span>在</span>售商品:</h2>
    </div>
    <div class="gallery">
      <div class="container">
        <div class="gallery-grids">
          <div class="col-md-8 gallery-grid glry-one">
            <a href="${pageContext.request.contextPath}/product/showAllProducts"><img src="image/g1.png" class="img-responsive" alt=""/>
              <div class="gallery-info">
                <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> view</p>
                <a class="shop"href="${pageContext.request.contextPath}/product/showAllProducts">SHOP NOW</a>
                <div class="clearfix"> </div>
              </div>
            </a>
            <div class="galy-info">
              <p>迈巴赫</p>
              <div class="galry">
                <div class="prices">
                  <h5 class="item_price">146.80-248.80万元</h5>
                </div>
                <div class="rating">
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                </div>
                <div class="clearfix"></div>
              </div>
            </div>
          </div>
          <div class="col-md-4 gallery-grid glry-two">
            <a href="${pageContext.request.contextPath}/product/showAllProducts"><img src="image/g2.png" class="img-responsive" alt=""/>
              <div class="gallery-info galrr-info-two">
                <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> view</p>
                <a class="shop" href="${pageContext.request.contextPath}/product/showAllProducts">SHOP NOW</a>
                <div class="clearfix"> </div>
              </div>
            </a>
            <div class="galy-info">
              <p>Panamera</p>
              <div class="galry">
                <div class="prices">
                  <h5 class="item_price">93.30-247.60万元</h5>
                </div>
                <div class="rating">
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                </div>
                <div class="clearfix"></div>
              </div>
            </div>
          </div>
          <div class="col-md-3 gallery-grid ">
            <a href="${pageContext.request.contextPath}/product/showAllProducts"><img src="image/g3.png" class="img-responsive" alt=""/>
              <div class="gallery-info">
                <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> view</p>
                <a class="shop" href="${pageContext.request.contextPath}/product/showAllProducts">SHOP NOW</a>
                <div class="clearfix"> </div>
              </div>
            </a>
            <div class="galy-info">
              <p>蔚来ET7</p>
              <div class="galry">
                <div class="prices">
                  <h5 class="item_price">49.80-59.60万元</h5>
                </div>
                <div class="rating">
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                </div>
                <div class="clearfix"></div>
              </div>
            </div>
          </div>
          <div class="col-md-3 gallery-grid ">
            <a href="${pageContext.request.contextPath}/product/showAllProducts"><img src="image/g4.png" class="img-responsive" alt=""/>
              <div class="gallery-info">
                <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> view</p>
                <a class="shop" href="${pageContext.request.contextPath}/product/showAllProducts">SHOP NOW</a>
                <div class="clearfix"> </div>
              </div>
            </a>
            <div class="galy-info">
              <p>宝马X5</p>
              <div class="galry">
                <div class="prices">
                  <h5 class="item_price">60.50-77.40万元</h5>
                </div>
                <div class="rating">
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                </div>
                <div class="clearfix"></div>
              </div>
            </div>
          </div>
          <div class="col-md-3 gallery-grid ">
            <a href="${pageContext.request.contextPath}/product/showAllProducts"><img src="image/g5.png" class="img-responsive" alt=""/>
              <div class="gallery-info">
                <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> view</p>
                <a class="shop" href="${pageContext.request.contextPath}/product/showAllProducts">SHOP NOW</a>
                <div class="clearfix"> </div>
              </div>
            </a>
            <div class="galy-info">
              <p>雷克萨斯ES</p>
              <div class="galry">
                <div class="prices">
                  <h5 class="item_price">29,49-48.89万元</h5>
                </div>
                <div class="rating">
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                </div>
                <div class="clearfix"></div>
              </div>
            </div>
          </div>
          <div class="col-md-3 gallery-grid ">
            <a href="${pageContext.request.contextPath}/product/showAllProducts"><img src="image/g6.png" class="img-responsive" alt=""/>
              <div class="gallery-info">
                <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> view</p>
                <a class="shop" href="${pageContext.request.contextPath}/product/showAllProducts">SHOP NOW</a>
                <div class="clearfix"> </div>
              </div>
            </a>
            <div class="galy-info">
              <p>比亚迪-秦PLUS</p>
              <div class="galry">
                <div class="prices">
                  <h5 class="item_price">11.18-17.58万元</h5>
                </div>
                <div class="rating">
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                </div>
                <div class="clearfix"></div>
              </div>
            </div>
          </div>
          <div class="col-md-3 gallery-grid ">
            <a href="${pageContext.request.contextPath}/product/showAllProducts"><img src="image/g7.png" class="img-responsive" alt=""/>
              <div class="gallery-info">
                <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> view</p>
                <a class="shop" href="${pageContext.request.contextPath}/product/showAllProducts">SHOP NOW</a>
                <div class="clearfix"> </div>
              </div>
            </a>
            <div class="galy-info">
              <p>比亚迪-汉</p>
              <div class="galry">
                <div class="prices">
                  <h5 class="item_price">21。48-32.98万元</h5>
                </div>
                <div class="rating">
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                </div>
                <div class="clearfix"></div>
              </div>
            </div>
          </div>
          <div class="col-md-3 gallery-grid ">
            <a href="${pageContext.request.contextPath}/product/showAllProducts"><img src="image/g8.png" class="img-responsive" alt=""/>
              <div class="gallery-info">
                <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> view</p>
                <a class="shop" href="${pageContext.request.contextPath}/product/showAllProducts">SHOP NOW</a>
                <div class="clearfix"> </div>
              </div>
            </a>
            <div class="galy-info">
              <p>保时捷-911</p>
              <div class="galry">
                <div class="prices">
                  <h5 class="item_price">127.80-250.00万元</h5>
                </div>
                <div class="rating">
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                </div>
                <div class="clearfix"></div>
              </div>
            </div>
          </div>
          <div class="col-md-3 gallery-grid ">
            <a href="${pageContext.request.contextPath}/product/showAllProducts"><img src="image/g9.png" class="img-responsive" alt=""/>
              <div class="gallery-info">
                <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> view</p>
                <a class="shop" href="${pageContext.request.contextPath}/product/showAllProducts">SHOP NOW</a>
                <div class="clearfix"> </div>
              </div>
            </a>
            <div class="galy-info">
              <p>沃尔沃S90</p>
              <div class="galry">
                <div class="prices">
                  <h5 class="item_price">40.69-50.59万元</h5>
                </div>
                <div class="rating">
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                </div>
                <div class="clearfix"></div>
              </div>
            </div>
          </div>
          <div class="col-md-3 gallery-grid ">
            <a href="${pageContext.request.contextPath}/product/showAllProducts"><img src="image/g10.png" class="img-responsive" alt=""/>
              <div class="gallery-info">
                <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> view</p>
                <a class="shop" href="${pageContext.request.contextPath}/product/showAllProducts">SHOP NOW</a>
                <div class="clearfix"> </div>
              </div>
            </a>
            <div class="galy-info">
              <p>宝马7系</p>
              <div class="galry">
                <div class="prices">
                  <h5 class="item_price">82.80-261.20万元</h5>
                </div>
                <div class="rating">
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                  <span>☆</span>
                </div>
                <div class="clearfix"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--//gallery-->
    <div class="shell-main-bottom">
      <h2><span>合</span>作品牌:</h2>
      <div class="shell-main-bottom-bottom">
        <ul>
          <li>
            <img src="./image/logo2.png" alt="">
            <h2>一汽大众:</h2>
            <span>提供价位与需求，我们将在最短的时间按照您的需求推出最划算方案</span>
          </li>
          <li>
            <img src="./image/logo4.png" alt="">
            <h2>雷克萨斯:</h2>
            <span>提供价位与需求，我们将在最短的时间按照您的需求推出最划算方案</span>
          </li>
          <li>
            <img src="./image/logo5.png" alt="">
            <h2>宝马旗舰:</h2>
            <span>提供价位与需求，我们将在最短的时间按照您的需求推出最划算方案</span>
          </li>
          <li>
            <img src="./image/logo9.png" alt="">
            <h2>一汽奥迪:</h2>
            <span>提供价位与需求，我们将在最短的时间按照您的需求推出最划算方案</span>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <div class="shell-main-footer">
    <span>版权所有-曙阳汽车销售</span>
  </div>
</div>
</body>
<script>
  window.addEventListener('scroll', function () {
    let top = window.scrollY
    if (top != 0) {
      $('.shell-top').css('top', '-100vh')
      $('.shell-main').css('top', '0')
      $('.shell-main-lbt-word').css('transform', 'translateY(0px)')
      $('.shell-main-lbt-word').css('backdrop-filter', 'blur(5px)')
      $('.shell-main-lbt-word h2').css('transform', 'translate(0px)')
      $('.shell-main-lbt-word span').css('transform', 'translate(0px)')

    } else {
      $('.shell-top').css('top', '0px')
      $('.shell-main').css('top', '100vh')
      $('.shell-main-lbt-word').css('transform', 'translateY(400px)')
      $('.shell-main-lbt-word').css('backdrop-filter', 'blur(0px)')
      $('.shell-main-lbt-word h2').css('transform', 'translate(520px)')
      $('.shell-main-lbt-word span').css('transform', 'translate(-620px)')
    }
    if (top > 650) {
      $('.shell-main-header-left-top').css('opacity', '1')
      $('.shell-main-header-left-top').css('transform', 'translateY(0px)')
      $('.shell-main-header-left-bottom').css('opacity', '1')
      $('.shell-main-header-left-bottom').css('transform', 'translateY(0px)')
      $('.shell-main-header-left-footer').css('opacity', '1')
      $('.shell-main-header-left-footer').css('transform', 'translateY(0px)')
    } else {
      $('.shell-main-header-left-top').css('opacity', '0')
      $('.shell-main-header-left-top').css('transform', 'translateY(400px)')
      $('.shell-main-header-left-bottom').css('opacity', '0')
      $('.shell-main-header-left-bottom').css('transform', 'translateY(400px)')
      $('.shell-main-header-left-footer').css('opacity', '0')
      $('.shell-main-header-left-footer').css('transform', 'translateY(400px)')
    }
  })
  let left = document.querySelector(".button-left")
  let right = document.querySelector(".button-right")
  let min = document.querySelectorAll(".min")
  let images = document.querySelector(".images")
  let index = 0
  let time
  function position() {
    images.style.left = (index * -100) + "%"
  }
  function add() {
    if (index >= min.length - 1) {
      index = 0
    } else {
      index++
    }
  }
  function desc() {
    if (index < 1) {
      index = min.length - 1
    } else {
      index--
    }
  }

  function timer() {
    time = setInterval(() => {
      index++
      desc()
      add()
      position()
    }, 34000)
  }

  left.addEventListener("click", () => {
    desc()
    position()
    clearInterval(time)
    timer()
  })
  // 右边的按钮和左边也是差不多
  right.addEventListener("click", () => {
    add()
    position()
    clearInterval(time)
    timer()
  })

  for (let i = 0; i < min.length; i++) {
    min[i].addEventListener("click", () => {
      index = i
      position()
      clearInterval(time)
      timer()
    })
  }

  timer()
</script>
</html>
