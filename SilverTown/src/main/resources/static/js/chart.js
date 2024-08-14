$(function(){
    // http://cors-anywhere.herokuapp.com에서 데모서버 반드시 활성화
    $.ajax({
        url : 'http://cors-anywhere.herokuapp.com/https://sgisapi.kostat.go.kr/OpenAPI3/auth/authentication.json',
        type : 'get',
        data : {
                consumer_key : '379eca75d6fa4ea99d47',
                consumer_secret : '175fbd65f24945d4a895',
        },
        dataType : 'json',
        async : false,
        success : function(data){

            access_token = data.result.accessToken;
            console.log(access_token);

            //var year = prompt("연도를 입력하세요");
            //console.log(year);
			/*
            $.ajax({
                //url : `http://cors-anywhere.herokuapp.com/https://sgisapi.kostat.go.kr/OpenAPI3/stats/searchpopulation.json?year=${year}&age_type=40&accessToken=${access_token}`,
                url : `http://cors-anywhere.herokuapp.com/https://sgisapi.kostat.go.kr/OpenAPI3/stats/searchpopulation.json?year=2022&age_type=40&accessToken=${access_token}`,
                type : 'get',
                data : {},
                dataType : 'json',
                async : false,
                success : function(data){
                    var json = JSON.stringify(data);
                    var obj = JSON.parse(json);

                    console.log(obj);
                    const ctx = document.getElementById('myChart');
                    var legion_arr = [];
                    var people_arr = [];

                    for(var i=0; i<17; i++){
                        legion_arr.push(obj.result[i].adm_nm);
                        people_arr.push(obj.result[i].population);
                    }
                    new Chart(ctx, {
                        type: 'bar',
                        data: {
                        labels: legion_arr,
                        datasets: [{
                            label: `전국 70대 이상 인구(${year}년도 기준)`,
                            data: people_arr,
                            borderWidth: 1
                        }]
                        },
                        options: {
                        scales: {
                            y: {
                            beginAtZero: true
                            }
                        }
                        }
                    });
                }


            });*/

        }
        

    });
      
        
});