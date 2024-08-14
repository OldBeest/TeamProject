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

    <title>DB 관리</title>

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
    	th, td{
    		text-align: center;
    	}
    </style>
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
                    <h1 class="h3 mb-2 text-gray-800">DB 관리</h1>

                    <!-- Content Row -->
                    <div class="row">

                        <div class="col-xl-12 col-lg-7">

                            <!-- Area Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">DB 리스트</h6>
                                    <input type="text">
                                    <button type="button">검색</button>
                                </div>
                                <div class="card-body"><div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>테이블명</th>
                                            <th>테이블 정보</th>
                                            <th>컬럼 개수</th>
                                            <th>등록된 데이터 개수</th>
                                            <th>등록일자 및 시간</th>
                                            <th colspan="2"></th>
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
                                            <td>DBTEST</td>
                                            <td>테스트용 DB</td>
                                            <td>7</td>
                                            <td>10</td>
                                            <td>2024-08-01</td>
                                            <td class="read-data"><button >샘플 데이터 가져와보기</button></td>
                                            <td class="admin-del"><button >삭제</button></td>
                                        </tr>
                                   		<tr>
                                            <td>USERS</td>
                                            <td>회원가입용</td>
                                            <td>10</td>
                                            <td>100</td>
                                            <td>2024-08-01</td>
                                            <td class="read-data"><button >샘플 데이터 가져와보기</button></td>
                                            <td class="admin-del"><button >삭제</button></td>
                                        </tr>
                                   		<tr>
                                            <td>POST</td>
                                            <td>게시글관리용</td>
                                            <td>10</td>
                                            <td>50</td>
                                            <td>2024-08-01</td>
                                            <td class="read-data"><button >샘플 데이터 가져와보기</button></td>
                                            <td class="admin-del"><button >삭제</button></td>
                                        </tr>
                                   		<tr>
                                            <td>VISITOR</td>
                                            <td>방문자용</td>
                                            <td>2</td>
                                            <td>7</td>
                                            <td>2024-08-01</td>
                                            <td class="read-data"><button >샘플 데이터 가져와보기</button></td>
                                            <td class="admin-del"><button >삭제</button></td>
                                        </tr>
                                        <!-- DB에서 가져올 때 형식
		                                    <c:forEach items="${list }" var="mDto">
		                                    	<tr>
		                                            <th>${mDto.id }</th>
		                                            <th>${mDto.pw }</th>
		                                            <th>${mDto.name }</th>
		                                            <th>${mDto.gender }</th>
		                                            <th>${mDto.phone }</th>
		                                            <th><fmt:formatDate value="${mDto.mdate}" pattern="yyyy-MM-dd"/> </th>
		                                            <th>${mDto.email }</th>
		                                        </tr>
		                                    </c:forEach>
                                        
                                         -->
                                    </tbody>
                                </table>
                            </div>

                                    <hr>
                                    Styling for the area chart can be found in the
                                    <code>/js/demo/chart-area-demo.js</code> file.
                                </div>
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
                        <span>Copyright &copy; Your Website 2020</span>
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
    <script src="/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/js/demo/chart-area-demo.js"></script>
    <script src="/js/demo/chart-pie-demo.js"></script>
    <script src="/js/demo/chart-bar-demo.js"></script>

</body>

</html>