<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %>
<style>
	a {
  text-decoration: none;
  color:black;
	}
</style>
<body>
<div class="container">
	<div class="row">
		<div class="col justify-content-end">
			<button class="col btn btn-outline-primary btn-sm">글작성</button>
		</div>
	</div>
  <table class="table table-hover">
  <tbody id="notice">
  </tbody>
</table>
<ul class="pagination justify-content-center">
	    <li class="page-item disabled">
	      <a class="page-link">&laquo; Previous</a>
	    </li>
	    <li class="page-item active" aria-current="page">
	    	<a class="page-link" href="#">1</a></li>
	    <li class="page-item">
	        <a class="page-link" href="#">2</a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#">Next &raquo;</a>
	    </li>
</ul>
</div>

<script>
 	function searchFunction(){
 		$.ajax({
 			type:"POST",
 			url:"/notice/noticeAllSelect.jsp",
 			success:function(data){
 				var notices = JSON.parse(data.trim());
 				var str="";
 				for(var i=0; i < notices.length; i++){
 					str += "<tr><small><td>" + notices[i].bNo + "</small></td>";
 					str += "<td class=\"w-75\"><a href='/notice/noticeDetail.jsp?bNo="+notices[i].bNo+ "'>" + notices[i].title + "</a></td>";
 					str += "<td>" + notices[i].regDate +"</td></tr>";

 				}
 				$('#notice').html(str);
 			}
 			
 		});
 	}
 	
 	
 	
 	window.onload = function(){
 		searchFunction();
 	}
 	
 </script>
</body>
</html>