<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .table-container {
    display: flex;
  }
  .table-container > div {
    flex: 1;
    margin: 0 10px; /* Adjust margin as needed */
  }
</style>
</head>
<body>
 <main id="main" class="main">

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body" style="padding-top: 20px;">
              <!-- General Form Elements -->
              <table class="col-lg-12">
              	<tr>
					<td style = 'text-align: center;'>회원
					<input type="text" style = 'text-align: center;' class="form-control" id="dashboardUser" readonly></td>
					<td style = 'text-align: center;'>판매상품
					<input type="text" style = 'text-align: center;' class="form-control" id="dashboardGoods" readonly></td>
					<td style = 'text-align: center;'>거래처
					<input type="text" style = 'text-align: center;' class="form-control" id="dashboardSupplier" readonly></td>
					<td style = 'text-align: center;'>금일주문
					<input type="text" style = 'text-align: center;' class="form-control" id="dashboardOrder" readonly></td>
				</tr>
				<tr>
					<td style = 'text-align: center;'>결제완료
					<input type="text" style = 'text-align: center;' class="form-control" id="statusLv1" readonly></td>
					<td style = 'text-align: center;'>배송준비중
					<input type="text" style = 'text-align: center;' class="form-control" id="statusLv2" readonly></td>
					<td style = 'text-align: center;'>배송중
					<input type="text" style = 'text-align: center;' class="form-control" id="statusLv3" readonly></td>
					<td style = 'text-align: center;'>배송완료
					<input type="text" style = 'text-align: center;' class="form-control" id="statusLv4" readonly></td>
				</tr>
              </table>             
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">월간 매출현황</h5>
              <!-- Line Chart -->
              <canvas id="lineChart" style="max-height: 400px;"></canvas>
              <!-- End Line CHart -->
            </div>
          </div>
        </div>
         <div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">월간 주문현황</h5>
              <!-- Bar Chart -->
              <canvas id="barChart" style="max-height: 400px;"></canvas>
              <!-- End Bar CHart -->
            </div>
          </div>
        </div>
        </div>
        <div class="table-container">
		<div>
        <table class="table table-hover" >
        	<thead>
        		<tr><th scope="col">주간 주문정보</th></tr>
            	<tr>
                	<th scope="col">No</th>
                    <th scope="col">주문번호</th>
                    <th scope="col">회원ID</th>
                    <th scope="col">회원명</th>
                    <th scope="col">상품명</th>
                    <th scope="col">금액</th>
                    <th scope="col">상태</th>
                </tr>
            </thead>
            <tbody id="tbody1">
            </tbody>
        </table>    
		</div>
		<div>
		  <table class="table table-hover">
            <thead>
            	<tr><th scope="col">주간 입고상품</th></tr>
            	<tr>
                	<th scope="col">No</th>
                    <th scope="col">주문번호</th>
                    <th scope="col">거래처명</th>
                    <th scope="col">상품명</th>
                    <th scope="col">금액</th>
                    <th scope="col">상태</th>
                </tr>
            </thead>
            <tbody id="tbody2">
            </tbody>
          </table>
		</div>
		</div>
    </section>
  </main>
  <form id="hiddenform">
  		<input type = 'hidden' id = '' name = ''>
  </form>
    <form id="hiddenform1">
  		<input type = 'hidden' id = '' name = ''>
  </form>
</body>
</html>

<script>
	// 대쉬보드 정보 call
	$(function(){
		call_server(hiddenform, "/main/dashboardInfo", dashboardInfo);
		call_server(hiddenform, "/main/salesChart", salesChart);
		call_server(hiddenform, "/main/orderChart", orderChart);
		call_server(hiddenform, "/order/getWeekOrder", getWeekOrder);
		call_server(hiddenform, "/supplier/getWeekSupOrder", getWeekSupOrder);
	});
	// 주간 주문정보
	function getWeekOrder(list){
		for(var i = 0; i < list.length; i++){
			str = "<tr><th scope=\"row\">"+(i+1)+"</th>";
			str += "<td>"+list[i].orderNo+"</td>";
			str += "<td>"+list[i].userId+"</td>";
			str += "<td>"+list[i].userName+"</td>";
			str += "<td>"+list[i].orderGoodsName+"</td>";
			str += "<td>"+list[i].orderPrice+"</td>";
			str += "<td>"+list[i].orderStatus+"</td>";
			str += "</tr>";
			$('#tbody1').append(str);
		}
	}
	// 주간 발주정보
	function getWeekSupOrder(list){
		for(var i = 0; i < list.length; i++){
			str = "<tr><th scope=\"row\">"+(i+1)+"</th>";
			str += "<td>"+list[i].orderNo+"</td>";
			str += "<td>"+list[i].supplierName+"</td>";
			str += "<td>"+list[i].goodsName+"</td>";
			str += "<td>"+list[i].orderPrice+"</td>";
			str += "<td>"+list[i].orderStatus+"</td>";
			str += "</tr>";
			$('#tbody2').append(str);
		}
	}
	
	function dashboardInfo(vo){
		$('#dashboardUser').val(vo.userCount);
		$('#dashboardGoods').val(vo.goodsCount);
		$('#dashboardSupplier').val(vo.supplierCount);
		$('#dashboardOrder').val(vo.orderCount);
		$('#statusLv1').val(vo.statusLv1);
		$('#statusLv2').val(vo.statusLv2);
		$('#statusLv3').val(vo.statusLv3);
		$('#statusLv4').val(vo.statusLv4);
	}

	var currentDate = new Date();
	var dateSet = [];
	// 31일 전 날짜
	var thirtyOneDaysAgo = new Date(currentDate.getTime() - 31 * 24 * 60 * 60 * 1000);
	// 현재 날짜부터 31일 전까지의 날짜 출력
	for(var i = thirtyOneDaysAgo; i <= currentDate; i.setDate(i.getDate() + 1)) {
	    var day = ('0' + (i.getMonth() + 1)).slice(-2) + '.' + ('0' + i.getDate()).slice(-2);
	    dateSet.push(day);
	}

	
	// 대쉬보드 매출차트 불러오기
	var salesList = [];
	function salesChart(list){
		for(var i = 0; i < list.length; i++){
			salesList.push(list[i].price);
		}
		setLineChart();
	}
	function setLineChart(){
            new Chart($('#lineChart'), {
              type: 'line',
              data: {
            	 labels: dateSet,
                //labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                datasets: [{
                  label: 'Line Chart',
                  data: salesList,
                  //data: [65, 59, 80, 81, 56, 55, 40],
                  fill: false,
                  borderColor: 'rgb(75, 192, 192)',
                  tension: 0.1
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
	// 대쉬보드 주문차트 불러오기
	var orderList = [];
	function orderChart(list){
		for(var i = 0; i < list.length; i++){
			orderList.push(list[i].orderCount);
		}
		setBarChart();
	}
	function setBarChart(){
		new Chart($('#barChart'), {
	        type: 'bar',
	        data: {
	          labels: dateSet,
	          datasets: [{
	            label: 'Bar Chart',
	            data: orderList,
	            backgroundColor: [
	              'rgba(255, 99, 132, 0.2)',
	              'rgba(255, 159, 64, 0.2)',
	              'rgba(255, 205, 86, 0.2)',
	              'rgba(75, 192, 192, 0.2)',
	              'rgba(54, 162, 235, 0.2)',
	              'rgba(153, 102, 255, 0.2)',
	              'rgba(201, 203, 207, 0.2)'
	            ],
	            borderColor: [
	              'rgb(255, 99, 132)',
	              'rgb(255, 159, 64)',
	              'rgb(255, 205, 86)',
	              'rgb(75, 192, 192)',
	              'rgb(54, 162, 235)',
	              'rgb(153, 102, 255)',
	              'rgb(201, 203, 207)'
	            ],
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
</script>