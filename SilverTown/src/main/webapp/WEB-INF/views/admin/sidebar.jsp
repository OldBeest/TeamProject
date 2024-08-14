<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin/index">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fa fa-wrench" aria-hidden="true"></i>
                </div>
                <div class="sidebar-brand-text mx-3">관리자 페이지</div>
            </a>
            
            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="/admin/index">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>대시보드</span></a>
            </li>
            
            <!-- Divider -->
            <hr class="sidebar-divider">
            <!-- Heading -->
            <div class="sidebar-heading">
                회원 정보 관리
            </div>
            <li class="nav-item">
                <a class="nav-link" href="/admin/members">
                	<i class="fa fa-address-card-o" aria-hidden="true"></i>
                    <span>회원 관리</span></a>
            </li>
            <!-- 
	            <li class="nav-item">
	                <a class="nav-link" href="/admin/facility">
	                    <i class="fa fa-address-card-o" aria-hidden="true"></i>
	                    <span>시설 관리</span></a>
	            </li>
             -->
            
            <!-- Divider -->
            <hr class="sidebar-divider">
            <!-- Heading -->
            <div class="sidebar-heading">
                관리
            </div>
            <li class="nav-item">
                <a class="nav-link" href="/admin/boards">
                    <i class="fa fa-list-alt" aria-hidden="true"></i>
                    <span>게시판</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/admin/crawling">
                    <i class="fa fa-list-alt" aria-hidden="true"></i>
                    <span>메인 웹크롤링 설정</span></a>
            </li>
            <!-- 
	            <li class="nav-item">
	                <a class="nav-link" href="/admin/db">
	                    <i class="fa fa-database" aria-hidden="true"></i>
	                    <span>DB</span></a>
	            </li>

             -->
            
            <!-- Divider -->
            <hr class="sidebar-divider">
            <!-- Heading -->
            <div class="sidebar-heading">
                통계
            </div>
            <li class="nav-item">
                <a class="nav-link" href="/admin/facility">
                    <i class="fa fa-building-o" aria-hidden="true"></i>
                    <span>시설 현황</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/admin/analytics">
                    <i class="fa fa-line-chart" aria-hidden="true"></i>
                    <span>회원 정보 분석</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">
        </ul>