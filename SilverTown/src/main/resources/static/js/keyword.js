$(function(){
    //입력 버튼 클릭
    $("#submit-place").on("click", function(){
        keyword = $("#place").val();
        
        //장소 검색 개체
        var ps = new kakao.maps.services.Places();
        if(kakao.maps.services.Status.OK == "OK"){
            ps.keywordSearch(keyword, function(data, status, pagination){
                
				//console.log(data);
                $("#y-cor").val(data[0].y);    				
                $("#x-cor").val(data[0].x);    				
                
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(data[0].y, data[0].x), // 지도의 중심좌표
                    level: 4 // 지도의 확대 레벨
                };  
            
                // 지도를 생성합니다    
                var map = new kakao.maps.Map(mapContainer, mapOption);
                
				//주변시설 로컬 api 요청
				api_ajax(data[0].y, data[0].x); 
                
            });
        }
    });

    //지도에 마커, 이름 표시
    //검색 결과가 여러개일 경우
    function annotate_place(documents){
        for(var i=0; i<1; i++){
            var coords = new kakao.maps.LatLng(documents[i].y, documents[i].x);
            
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">' + documents[i].place_name + '</div>'
            });
            infowindow.open(map, marker);
        }
        
    }

    //검색결과가 하나일 경우
    function annotate_place1(documents){
        var coords = new kakao.maps.LatLng(documents.y, documents.x);
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        
        });
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + documents.place_name + '</div>'
        });
        infowindow.open(map, marker);
        
    }

    //api key
    let REST_API_KEY = 'cdc2d072d7111e6601d60fd3932bb8b1';
    
    //현재 좌표 얻어오기
    var y_cor = 37.502606607304955
    var x_cor = 126.7599195351163

    //지도 그리기
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(y_cor, x_cor), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };  

    // 지도를 생성합니다    
    var map = new kakao.maps.Map(mapContainer, mapOption); 
    
    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    function api_ajax(y_cor, x_cor){
		
    //카카오로컬 api 요청
    $.ajax({
        beforeSend : function(xhr){
            xhr.setRequestHeader("Authorization", "KakaoAK cdc2d072d7111e6601d60fd3932bb8b1")
        },
        url : "https://dapi.kakao.com/v2/local/search/keyword.json?query='대학병원'&category_group_code=HP8&y=" + y_cor +"&x=" + x_cor + "&radius=10000&sort=distance",
        type : "get",
        data : {},
        dataType : "json",
        success : function(data){
      
            for(var i=0; i<data.documents.length; i++){
                if((data.documents[i].category_name.slice(-4) == "대학병원") || (data.documents[i].category_name.slice(-4) == "종합병원")){
                    annotate_place1(data.documents[i]);
                    $("#hostpital .place-name").text("이름 : " + data.documents[i].place_name)
                    $("#hostpital .place-address").text("주소 : " + data.documents[i].road_address_name)
                    $("#hostpital .distance").text("거리 : " + data.documents[i].distance + "m")
                    $("#hostpital .place-phone").text("전화번호 : " + data.documents[i].phone)
                    $("#hostpital .place-x").text("x좌표(경도) : " + data.documents[i].x)
                    $("#hostpital .place-y").text("y좌표(위도) : " + data.documents[i].y)
					break;
                }
            }
			if(i == data.documents.length){
                $("#hostpital .place-name").text("검색된 결과가 없습니다.");
				return false;					
			}
            
        },
        error : function(){
            console.log("실패");
        }
    }
    
        
    );

    $.ajax({
        beforeSend : function(xhr){
            xhr.setRequestHeader("Authorization", "KakaoAK cdc2d072d7111e6601d60fd3932bb8b1")
        },
        url : "https://dapi.kakao.com/v2/local/search/category.json?category_group_code=PM9&y=" + y_cor +"&x=" + x_cor + "&radius=10000&sort=distance&size=1",
        type : "get",
        data : {},
        dataType : "json",
        success : function(data){
            
            annotate_place(data.documents);

            $("#pharmacy .place-name").text("이름 : " + data.documents[0].place_name)
            $("#pharmacy .place-address").text("주소 : " + data.documents[0].road_address_name)
            $("#pharmacy .distance").text("거리 : " + data.documents[0].distance + "m")
            $("#pharmacy .place-phone").text("전화번호 : " + data.documents[0].phone)
            $("#pharmacy .place-x").text("x좌표(경도) : " + data.documents[0].x)
            $("#pharmacy .place-y").text("y좌표(위도) : " + data.documents[0].y)

            
        },
        error : function(){
            console.log("실패");
        }
    }
    
        
    );

    $.ajax({
        beforeSend : function(xhr){
            xhr.setRequestHeader("Authorization", "KakaoAK cdc2d072d7111e6601d60fd3932bb8b1")
        },
        url : "https://dapi.kakao.com/v2/local/search/category.json?category_group_code=CS2&y=" + y_cor +"&x=" + x_cor + "&radius=10000&sort=distance&size=1",
        type : "get",
        data : {},
        dataType : "json",
        success : function(data){
            
            annotate_place(data.documents);

            $("#convenience-store .place-name").text("이름 : " + data.documents[0].place_name)
            $("#convenience-store .place-address").text("주소 : " + data.documents[0].road_address_name)
            $("#convenience-store .distance").text("거리 : " + data.documents[0].distance + "m")
            $("#convenience-store .place-phone").text("전화번호 : " + data.documents[0].phone)
            $("#convenience-store .place-x").text("x좌표(경도) : " + data.documents[0].x)
            $("#convenience-store .place-y").text("y좌표(위도) : " + data.documents[0].y)

            
        },
        error : function(){
            console.log("실패");
        }
    }
    
        
    );
    }
    
});//jquery
