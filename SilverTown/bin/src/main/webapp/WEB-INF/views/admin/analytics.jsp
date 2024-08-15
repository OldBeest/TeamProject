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

    <title>통계 페이지</title>

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
                    <h1 class="h3 mb-2 text-gray-800">회원정보 통계 페이지</h1>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Content Column -->
                        <div class="col-lg-6 mb-4">

                            <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">지역별 회원 현황</h6>
                                </div>
                                <div class="card-body">
                                    <h4 class="small font-weight-bold">서울 <span
                                            class="float-right">${seoul_per}%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width: ${seoul_per}%"
                                            aria-valuenow="${seoul_per}" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">경기 <span
                                            class="float-right">${gyeonggi_per}%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" role="progressbar" style="width: ${gyeonggi_per}%"
                                            aria-valuenow="${gyeonggi_per}" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">인천 <span
                                            class="float-right">${incheon_per}%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: ${incheon_per}%"
                                            aria-valuenow="${incheon_per}" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 mb-4">

                            <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">성별 회원 현황</h6>
                                </div>
                                <div class="card-body">
                                    <h4 class="small font-weight-bold">남성 <span
                                            class="float-right">${male_per }%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width: ${male_per }%"
                                            aria-valuenow="${male_per }" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">여성 <span
                                            class="float-right">${female_per}%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" role="progressbar" style="width: ${female_per }%"
                                            aria-valuenow="${female_per }" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
						<!-- 
                        <div class="col-lg-6 mb-4">


                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">금일 최대 조회 시설</h6>
                                </div>
                                <div class="card-body">
                                    <div class="text-center">
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;"
                                            src="/img/hospital2.jpg" alt="...">
                                    </div>
                                   	<p>총 조회 수 : 1회</p><p>최대 클릭 수 : 1회</p>
                                   	</div>
                                    <a target="_blank" rel="nofollow" href="https://undraw.co/">페이지 이동 &rarr;</a>
                                </div>
                            </div>

                        </div>
						 -->

                </div>
                <!-- content end  -->
                    <!-- Content Row -->
                    <div class="row">

                        <!-- Content Column -->
                        <div class="col-lg-6 mb-4">

                            <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">질환별 회원 현황</h6>
                                </div>
                                <div class="card-body">
                                    <h4 class="small font-weight-bold">암 <span
                                            class="float-right">${cancer_per }%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width: ${cancer_per }%"
                                            aria-valuenow="${cancer_per }" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">뇌혈관질환 <span
                                            class="float-right">${cva_per }%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" role="progressbar" style="width: ${cva_per }%"
                                            aria-valuenow="${cva_per }" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">심폐질환 <span
                                            class="float-right">${cpr_per }%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-info progress-bar-striped progress-bar-animated" role="progressbar" style="width: ${cpr_per }%"
                                            aria-valuenow="${cpr_per }" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">근골격계질환 <span
                                            class="float-right">${msd_per }%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-dark progress-bar-striped progress-bar-animated" role="progressbar" style="width: ${msd_per }%"
                                            aria-valuenow="${msd_per }" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">중추신경계질환 <span
                                            class="float-right">${cns_per }%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-success progress-bar-striped progress-bar-animated role="progressbar" style="width: ${cns_per }%"
                                            aria-valuenow="${cns_per }" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">치매 <span
                                            class="float-right">${dementia_per }%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: ${dementia_per }%"
                                            aria-valuenow="${dementia_per }" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 mb-4">

                            <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">특성 별 회원 현황</h6>
                                </div>
                                <div class="card-body">
                                    <h4 class="small font-weight-bold">도심위치 <span
                                            class="float-right">${city_p_per }%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-danger progress-bar-striped progress-bar-animated role="progressbar" style="width: ${city_p_per}%"
                                            aria-valuenow="${city_p_per }" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">대형병원인접 <span
                                            class="float-right">${bighospital_n_per }%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" role="progressbar" style="width: ${bighospital_n_per}%"
                                            aria-valuenow="${bighospital_n_per }" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">최신시설 <span
                                            class="float-right">${latest_f_per }%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-info progress-bar-striped progress-bar-animated" role="progressbar" style="width: ${latest_f_per}%"
                                            aria-valuenow="${latest_f_per }" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">여성전용 <span
                                            class="float-right">${female_s_per }%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-dark progress-bar-striped progress-bar-animated" role="progressbar" style="width: ${female_s_per}%"
                                            aria-valuenow="${female_s_per }" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">암특화치료 <span
                                            class="float-right">${cancer_s_per }%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-success progress-bar-striped progress-bar-animated" role="progressbar" style="width: ${cancer_s_per}%"
                                            aria-valuenow="${cancer_s_per }" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">치매전문 <span
                                            class="float-right">${dementia_s_per }%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: ${dementia_s_per}%"
                                            aria-valuenow="${dementia_s_per }" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
						<!-- 
                        <div class="col-lg-6 mb-4">


                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">금일 최대 조회 시설</h6>
                                </div>
                                <div class="card-body">
                                    <div class="text-center">
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;"
                                            src="/img/hospital2.jpg" alt="...">
                                    </div>
                                   	<p>총 조회 수 : 1회</p><p>최대 클릭 수 : 1회</p>
                                   	</div>
                                    <a target="_blank" rel="nofollow" href="https://undraw.co/">페이지 이동 &rarr;</a>
                                </div>
                            </div>

                        </div>
						 -->

                </div>
                <!-- content end  -->
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

</body>

</html>