<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.chartByStockCode {
		display: none
	}
</style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script>

// 검색
   $(document).ready(function(){
     $("#myInput").on("keyup", function() {
       var value = $(this).val().toLowerCase();
       $("#myTable tr").filter(function() {
         $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
       });
     });
   });
   
//	관심종목에 추가
   $(document).ready(function() {
	 
	   $('.addFavoriteBtn').click(function() {
		   let btn = this;
		   let elements = $(this).attr('id').split('-');
		   alert(elements[0] + ' : ' + elements[1] + ' : ' + elements[2])
		   
		   $.ajax({
			   url : '${pageContext.request.contextPath}/stock/addFavorite',
			   type: 'post',
			   data : {
				   id : elements[1],
				   code : elements[2],
				   name : elements[0]
			   }, success : function() {
				   alert('성공')
				   $(btn).attr('disabled', true)
			   }, error : function() {
				   alert('실패')
			   }
		   });
	   })
   })
   
// 그래프  
   $(document).ready(function(){
	   $(".chart").click(function(){
		   let code = $(this).attr('name');
		   $('#'+code).toggle();

	   })  
   })
</script>
</head>
<body>
<!-- header -->
   <jsp:include page="/header.jsp" />
    
    <section class="hero-wrap hero-wrap-2" style="background-image: url('resources/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
             <p class="breadcrumbs"><span class="mr-2"><a href="${ pageContext.request.contextPath }">Home <i class="fa fa-chevron-right"></i></a></span> <span>주식관리 <i class="fa fa-chevron-right"></i></span></p>
            <h1 class="mb-3 bread">주가 변동 현황</h1>
          </div>
        </div>
      </div>
    </section>
     <section class="ftco-section">
		
      <div class="container">
        <input class="form-control" id="myInput" type="text" placeholder="Search..">
        <table class="table table-bordered table-hover">
       <thead>
         <tr align="center">
           <th align="center" style="width: 15%">종목명</th>
           <th align="center" style="width: 10%">분류</th>
           <th align="center" style="width: 10%">기준</th>
           <th align="center" style="width: 10%">주가</th>
           <th align="center" style="width: 10%">보러가기</th>
           <th align="center" style="width: 10%">선택</th>
         </tr>
       </thead>
       <tbody id="myTable">
       <c:forEach items="${ stockList }" var="stock" varStatus="loop">
         <tr>
           <td align="center">${ stock.name }</td>
           <td align="center">${ stock.sector }</td>
           <td align="center">${ stock.reg_date }</td>
           <td align="center">${ stock.price }원</td>
           <td><button type="button" class="chart" name="${ stock.code }"> 그래프</button>	<div class="chartByStockCode" id ="${ stock.code }"><img id="img_chart_area" src="https://ssl.pstatic.net/imgfinance/chart/item/area/day/${ stock.code }.png"></div>		</td>
           <td><input type="button" class="addFavoriteBtn" id="${stock.name }-${loginVO.id}-${stock.code}" <c:if test="${stock.flag == 1 }">disabled </c:if> value="관심종목으로 등록"></td>
         </tr>
       </c:forEach>
       </tbody>
     </table>
    </div>
    </section>
  <!-- footer -->
   <jsp:include page="/footer.jsp"></jsp:include>

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
<script src="${ pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/popper.min.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/jquery.easing.1.3.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/jquery.waypoints.min.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/jquery.stellar.min.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/jquery.animateNumber.min.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/google-map.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/main.js"></script>


</body>
</html>