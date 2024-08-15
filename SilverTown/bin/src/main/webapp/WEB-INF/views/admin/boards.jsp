<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원 관리 페이지</title>

    <!-- Custom fonts for this template -->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		th, td{
			text-align: center;
		}
		.button{
			background : #0d790c;
			font-weight : 400;
			color : white;
			border-radius: 10%;
		}
	</style>
	<script>
	function deleteBtn(post_no){
    	if(confirm("게시글을 삭제하시겠습니까?")){
    		alert('게시물이 삭제되었습니다.')
    		location.href="/admin/boards/delete?post_no="+post_no;
    	}
    }
	</script>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
       	<%@ include file="./sidebar.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                      	<%@ include file="./topbar.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">게시판 관리</h1>
                   
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">게시판 리스트</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>아이디</th>
                                            <th>등록일자 및 시간</th>
                                            <th>조회수</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    
                                    <!-- tfoot 시작
                                    <tfoot>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Salary</th>
                                        </tr>
                                    </tfoot>
                                    tfoot 끝 -->
                                    

                                    <!-- db에서 가져오기 -->
                                    <tbody>
										<!-- 게시판 내용부분 시작 -->
										<c:forEach items="${c2dtos}" var="c2dto">
											<tr>
												<td><input type="checkbox"></td>
												<td><c:if test="${c2dto.post_indent == 0}">
														<!-- 답변 부분 번호표시 x -->
														<span class="table-notice">${c2dto.post_no}</span>
													</c:if></td>
												<td class="table-title">
														<c:forEach var="i" begin="1" end="${c2dto.post_indent}"
															step="1">↪Re:</c:forEach> ${c2dto.post_title}
												</td>
												<td>${c2dto.id}</td>
												<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${c2dto.post_reg_date}"/></td>
												<td>${c2dto.post_hit}</td>
												<td><a href="/customer/customer2_view?post_no=${c2dto.post_no}"><button class="button">이동</button></a>
												&nbsp;&nbsp;&nbsp;
												<button class="button" onclick="deleteBtn(${c2dto.post_no})">삭제</button></td>
											</tr>
										</c:forEach>
										<!-- 게시판 내용부분 끝 -->
									</tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">게시판 현황</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>게시판명</th>
                                            <th>게시판 위치</th>
                                            <th>등록된 글 수</th>
                                            <th>이동</th>
                                        </tr>
                                    </thead>
                                    
                                    <!-- tfoot 시작
                                    <tfoot>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Salary</th>
                                        </tr>
                                    </tfoot>
                                    tfoot 끝 -->
                                    

                                    <!-- db에서 가져오기 -->
                                    <tbody>
										<tr>
                                            <td>스프링 상태 페이지</td>
                                            <td>/admin/actuator</td>
                                            <td>-</td>
                                            <td><a href="/admin/actuator"><button class="button">이동</button></a></td>
                                        </tr>
										<tr>
                                            <td>자주 묻는 질문</td>
                                            <td>/customer/customer1_list</td>
                                            <td>15</td>
                                            <td><a href="/customer/customer1_list"><button class="button">이동</button></a></td>
                                        </tr>
										<tr>
                                            <td>질문 게시판</td>
                                            <td>/customer/customer2_list</td>
                                            <td>51</td>
                                            <td><a href="/customer/customer2_list"><button class="button">이동</button></a></td>
                                        </tr>
									</tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2024</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/js/demo/datatables-demo.js"></script>

</body>

</html>