<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주소 검색</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f0f8ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            width: 400px;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .results {
            margin-top: 20px;
        }
        .address-item {
            padding: 10px;
            background: #f9f9f9;
            border-radius: 5px;
            cursor: pointer;
            margin-bottom: 5px;
        }
        .address-item:hover {
            background: #e9e9e9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>주소 검색</h2>
        <input type="text" id="addressInput" placeholder="도로명 또는 지번 입력">
        <button id="searchButton">검색</button>

        <div class="results">
            <!-- 검색 결과가 이곳에 표시됩니다. -->
        </div>
    </div>

    <script>
        $(document).ready(function() {
            $("#searchButton").on("click", function() {
                var query = $("#addressInput").val().trim();
                if (!query) {
                    alert("검색어를 입력하세요.");
                    return;
                }

                // 샘플 주소 목록
                var sampleAddresses = [
                    // 서울특별시
                    "서울특별시 강남구 역삼동 123-45",
                    "서울특별시 서초구 서초동 678-90",
                    "서울특별시 종로구 삼청동 111-22",
                    "서울특별시 마포구 상암동 333-44",
                    "서울특별시 송파구 잠실동 555-66",

                    // 경기도
                    "경기도 수원시 영통구 매탄동 777-88",
                    "경기도 성남시 분당구 정자동 999-00",
                    "경기도 고양시 일산동구 마두동 111-22",
                    "경기도 용인시 기흥구 보정동 333-44",
                    "경기도 안양시 동안구 비산동 555-66",

                    // 인천광역시
                    "인천광역시 남동구 구월동 123-45",
                    "인천광역시 부평구 부평동 678-90",
                    "인천광역시 연수구 송도동 111-22",
                    "인천광역시 서구 청라동 333-44",
                    "인천광역시 중구 항동 555-66"
                ];

                // 검색어를 포함한 주소만 필터링
                var filteredAddresses = sampleAddresses.filter(function(address) {
                    return address.includes(query);
                });

                var resultsContainer = $(".results");
                resultsContainer.empty(); // 기존 결과 제거

                if (filteredAddresses.length > 0) {
                    filteredAddresses.forEach(function(address) {
                        var addressItem = $("<div>").addClass("address-item").text(address);
                        addressItem.on("click", function() {
                            selectAddress(address);
                        });
                        resultsContainer.append(addressItem);
                    });
                } else {
                    resultsContainer.append("<div>검색 결과가 없습니다.</div>");
                }
            });

            // 주소 선택 시 부모 페이지로 전달
            function selectAddress(address) {
                window.opener.postMessage({ address: address }, "*");
                window.close(); // 팝업 창 닫기
            }
        });
    </script>
</body>
</html>