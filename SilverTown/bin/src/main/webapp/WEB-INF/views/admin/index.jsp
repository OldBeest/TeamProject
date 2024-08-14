<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.net.InetAddress" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% Date now = new Date();%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>관리자 페이지</title>

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
     <script>
                                    $(function(){
                                    	
                                    	function unix_time_convert(time){
                                    		var convert_time = new Date(time * 1000);
                                    		
                                    		return convert_time;             		
                                    	}
                     	
                                    	function server_clock(){
                                    		/*
                                    		$.ajax({
                                        		url : "http://localhost:8181/admin/actuator/metrics/application.ready.time",
                                        		method : 'get',
                                        		data : {},
                                        		dataType : 'json',
                                        		success : function(data){
                                        			//console.log(data.measurements[0].value);
                                        			$(".ready_time").html("서버 가동시간 : " + data.measurements[0].value + "초"); 
                                        		},
                                        		error : function(){
                                        			alert("실패");
                                        		}
                                        	});
                                    		*/
                                    		
                                    		var processStartTimeUrl = window.location.hostname === 'localhost' ?
                                    				'http://localhost:8181/admin/actuator/metrics/process.start.time' :
                                    				'http://192.168.0.147:8181/admin/actuator/metrics/process.start.time';
                                    		
                                    		$.ajax({
                                        		//url : "http://localhost:8181/admin/actuator/metrics/process.start.time",
                                        		url : processStartTimeUrl, // 외부에서 접속했을 때 실패 안뜬다..!
                                        		method : 'get',
                                        		data : {},
                                        		dataType : 'json',
                                        		success : function(data){
                                        			//console.log(data.measurements[0].value);
                                        			var now = unix_time_convert(data.measurements[0].value);
                                        			var now1 = new Date();
                                        			var uptime = Math.floor((now1 - now)/1000)
                                        			$(".start_time").html("서버 시작시간 : " + now); 
                                        			$(".ready_time").html("서버 가동시간 : " + Math.floor(uptime / 3600)+ " 시간 "+ Math.floor((uptime % 3600) / 60) + " 분 " + uptime % 60 + " 초"); 
                                        		},
                                        		error : function(){
                                        			alert("실패");
                                        		}
                                        	});
                                    	}
                                    	server_clock(); //맨처음에 한번 실행
										setInterval(server_clock, 1000); //1초 주기로 새로실행                            	
                                    });
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
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                        <a href="/index" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i>홈으로 돌아가기</a>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- 서버상태 표시 -->
                        
                        <div class="col-xl-12 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="clock text-xl font-weight-bold text-primary text-uppercase mb-1">
                                                </div>
                                             		
                                             		<!-- 실시간 날짜, 시간 출력 -->
													<script>
		                        
														const clock = document.querySelector(".clock");
		
														let day = ['일', '월', '화', '수', '목', '금', '토'];
														function getClock() {

															let today = new Date();
		
															let dateFormat1 = today.getFullYear() + '년 ' + (today.getMonth()+1) + '월 '
																+ today.getDate() + '일 ' + day[today.getDay()] + '요일 '
																+ today.getHours() + '시 ' + today.getMinutes() + '분 '
																+ today.getSeconds() + '초'
																
															clock.innerText = "현재시간 : " + dateFormat1;
														}
		
														getClock(); //맨처음에 한번 실행
														setInterval(getClock, 1000); //1초 주기로 새로실행
													</script>

											<div class="text-xl display-4 font-weight-bold text-primary text-uppercase mb-1">
												서버상태
												
											</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            	<!-- 서버 가동시간, 시작 시간 표시 -->
												<p class="start_time"></p>
												<p class="ready_time"></p>
                                            </div>    
                                            <div>
												<span>&nbsp오늘 방문자 : ${vDto.visitors }명</span>
												<!-- 
												<a href="/admin/countOne">방문자 1 증가</a>
												<a href="/admin/countMinus">방문자 1 감소</a>
												 -->
                                            </div>                                                                                         
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            	<span class="web-server"><i class="fa fa-smile-o" style="color : green"></i>&nbsp웹 서버 &nbsp</span>
                                            	<span class="db-server"></span>
                                            	<span class="data-api"><i class="fa fa-smile-o" style="color : green"></i>&nbsp공공데이터 서버&nbsp</span>
                                            	<span class="login-api"></span>
                                            	<span class="map-api"></span>
                                            	<span class="fail-sample"><i class="fa fa-sad-tear" style="color : red"></i>&nbsp샘플 테스트</span>
                                            	<script>
                                            	
                                            		const isLocal = location.hostname === "localhost";
                                            		const baseURL = isLocal ? "http://localhost:8181" : "http://192.168.0.147:8181" ;
                                            	
                                            		function api_status(url, type){
                                            			var url = url;
                                            			fetch(url).then(function(response){
                                            				$(type).html('<i class="fa fa-smile-o" style="color : green"></i>&nbsp' + "KaKao" + type + '서버');
                                            			}
                                            			).catch(function(response){
                                                			$(type).html('<i class="fa fa-sad-tear" style="color : red"></i>&nbsp' + "KaKao" +type + '서버');
                                                		}
                                                		);
	
                                            		}
                                           			login_url = "https://cors-anywhere.herokuapp.com//https://kauth.kakao.com/oauth/authorize"
                                           			map_url = "https://cors-anywhere.herokuapp.com//dapi.kakao.com/v2/maps/sdk.js?appkey=cdc2d072d7111e6601d60fd3932bb8b1."
                                           			api_status(login_url, '.login-api');
                                           			api_status(map_url, '.map-api');
                                           			
                                           			//db서버 상태 확인
                                           			$.ajax({
                                                		//url : "http://localhost:8181/admin/actuator/health",
                                                		url : baseURL + '/admin/actuator/health',
                                                		method : 'get',
                                                		data : {},
                                                		dataType : 'json',
                                                		success : function(data){
                                                			console.log(data.components.db.status)
                         		                            if(data.components.db.status=="UP"){
                                                			$(".db-server").html('<i class="fa fa-smile-o" style="color : green"></i>&nbsp' + "Oracle" + '서버');                 		                            	
                         		                            }
                         		                            else{
                                                				$(".db-server").html('<i class="fa fa-sad-tear" style="color : red"></i>&nbsp' + "Oracle" + '서버');                 		                            	
                         		                            }
                                                		},
                                                		error : function(){
                                                			alert("실패");
                                                		}
                                                	});
                                            	</script>
                                            	
                                      	
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                        

                    <!-- Content Row -->

                    <div class="row">

                        <!-- 방문자 Area Chart -->
                        <div class="col-xl-12 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">방문자 현황</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#" id="prevMonth">이전 달</a>
                                            <a class="dropdown-item" href="#" id="nextMonth">다음 달</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Content Column -->
                        <div class="col-lg-6 mb-4">

                            
							
							<!-- color system

                            <div class="row">
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-primary text-white shadow">
                                        <div class="card-body">
                                            Primary
                                            <div class="text-white-50 small">#4e73df</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-success text-white shadow">
                                        <div class="card-body">
                                            Success
                                            <div class="text-white-50 small">#1cc88a</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-info text-white shadow">
                                        <div class="card-body">
                                            Info
                                            <div class="text-white-50 small">#36b9cc</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-warning text-white shadow">
                                        <div class="card-body">
                                            Warning
                                            <div class="text-white-50 small">#f6c23e</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-danger text-white shadow">
                                        <div class="card-body">
                                            Danger
                                            <div class="text-white-50 small">#e74a3b</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-secondary text-white shadow">
                                        <div class="card-body">
                                            Secondary
                                            <div class="text-white-50 small">#858796</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-light text-black shadow">
                                        <div class="card-body">
                                            Light
                                            <div class="text-black-50 small">#f8f9fc</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-dark text-white shadow">
                                        <div class="card-body">
                                            Dark
                                            <div class="text-white-50 small">#5a5c69</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
							 -->
                            

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
    <script src="/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/js/demo/chart-line-demo.js"></script>
    <script src="/js/demo/chart-bar-demo2.js"></script>

</body>

</html>