<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="/js/chart.js"></script>
    <style>
      nav {
        font-size: 12pt;
        font-family: 'PT Sans', Arial, Sans-serif;
        position: relative;
        float: right;
        right: 10%;
    }
    
    nav ul {
        padding: 0;
        margin: 0 auto;
        width: auto;
    }
    
    nav li {}
    
    nav a {
        line-height: 50px;
        height: 50px;
    }
    
    nav li a {
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        -webkit-box-sizing: border-box;
    }
    
    nav li:last-child a {
        border-right: 0;
    }
    
    nav a:hover,
    nav a:active {}
    
    nav a#pull {
        display: none;
    }
    
    html {
        -webkit-touch-callout: none;
        -webkit-user-select: none;
        -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    }
    
    ul {
        /*list-style-type: none;*/
        margin: 0;
        padding: 0;
        background-color: #333;
        text-align: center;
    }
    
    li {
        /*position: relative;*/
        display: inline-block;
    }
    
    li a {
        color: #FFFFFF;
        text-align: center;
        padding: 14.5px 16px;
        text-decoration: none;
    }
    
    li a:hover {
        /*color: #597812;*/
        color: #FFD400;
        font-weight: normal;
    }
    
    .menu {
        width: 5000px;
        height: 50px;
        text-align: center;
        max-width: 100%;
        background-position: center;
        background-size: cover;
        background-color: #333333;
        color: white;
        position: absolute;
        z-index: 1;
    }
    </style>
</head>
<body topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0" style="background-color:#F6F6F6">
    <div class="menu" >
      <nav class="clearfix">
        <ul class="clearfix">
      </ul>
      <h2>사이트 스토리</h2>
      <a id="pull" href="#"></a>
    </nav>
    </div>
  </body>
</html>
