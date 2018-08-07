<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="productDao" class="dao.ProductDAOImpl"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang chủ</title>
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/menu.css" />
<link rel="stylesheet" href="css/product.css" />
</head>
<body>
	<div id="main">
		<div id="head">
			<img src="images/banner.jpg" width="1057px" height="200px" />
		</div>
		<div id="head-link">
			<div id='menungang'>
				<ul>
					<li class='last'><a href="index.jsp"><span>Home</span></a></li>
					<li class='last'><a href="product.jsp"><span>Produtos</span></a></li>
					<c:choose>
						<c:when test="{not empty username}">
							<li class='last'><a href="cart.jsp"><span>Carrinho de compras</span></a></li>
							<li class='last'><a href="search_page.jsp"><span>Pesquisa</span></a></li>
							<li class='last' style="float: right;"><a href="LogoutServlet"><span>Sair</span></a></li>
							<li class='last' style="float: right;"><a href="update_user.jsp?username=${username}"><span>${username}</span></a></li>
						</c:when>
						<c:when test="{empty username}">
							<li class='last'><a href="search_page.jsp"><span>Pesquisa</span></a></li>
							<li class='last' style="float: right;"><a href="register.jsp"><span>Registro</span></a></li>
							<li class='last' style="float: right;"><a href="login.jsp"><span>Login</span></a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
		<div id="content">
			<div id="left"><jsp:include page="category.jsp"></jsp:include></div>
			<div id="right">
				<div id="site-wrapper" style="float: left">
					<ul class="products homepage">
						<c:forEach var="p" items="${listaProdutos}">
							<li class="preorder"><span class="tagimg"></span>
								<a href="detail.jsp?ma_san_pham=${p.ma_san_pham}">
									<img src="sanpham/${p.hinh_anh}" width=" 250px" height="250px" />
									<h3>${p.ten_san_pham}</h3>
									<h4>Giá:<fmt:formatNumber value="${p.gia_ban}" type="currency"/>VNĐ
									</h4> <span class="textkm">Khuyến mãi trị giá đến <strong>500.000₫</strong></span>
									<p class="info">
										<span>Hãng sx: ${p.hang_san_xuat}</span>
										<span>Giá: <fmt:formatNumber value="${p.gia_ban}" type="currency"/>VNĐ</span>
										<span>Thông tin: ${p.thong_tin}
									</p>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div id="footer"><jsp:include page="footer.jsp"></jsp:include></div>
	</div>
</body>
</html>