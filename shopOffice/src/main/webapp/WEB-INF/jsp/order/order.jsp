<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  
  <main id="main" class="main">

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body" style="padding-top: 20px;">
              <!-- General Form Elements -->
              <form id="searchform">
              <input type='hidden' id='currentPage' name='currentPage'>
              <table class="col-lg-12" >
              	<tr>
              		<td>
		              	<div class="row mb-4">
		                  <label for="inputText" class="col-sm-1 col-form-label">회원명</label>
		                  <div class="col-sm-2">
		                    <input type="text" class="form-control" name="userName">
		                  </div>
		                </div>
		           <td>
		           <td rowspan="2">
		                <div class="row mb-4">
		                  <label for="inputText" class="col-sm-1 col-form-label">주문상태</label>
		                  <div class="col-sm-2">
		                    <select name="orderStatus" >
   								<option value=>=== 선택 ===</option>
   								<option value="배송준비중">배송준비중</option>
    							<option value="배송중">배송중</option>
    							<option value="배송완료">배송완료</option>
    						</select>
		                  </div>
		                </div>		
              		</td>
              		<td rowspan="2">
		                <div class="row mb-4">
		                  <label for="inputText" class="col-sm-1 col-form-label">결제수단</label>
		                  <div class="col-sm-2">
		                    <select name="payment" >
   								<option value=>=== 선택 ===</option>
   								<option value="카드결제">카드결제</option>
   								<option value="무통장입금">무통장입금</option>
   								<option value="핸드폰결제">핸드폰결제</option>
    						</select>
		                  </div>
		                </div>		
              		</td>
              		<td rowspan="2">
              			<button type="button" class="btn btn-info" onclick = 'orderSearch(1);'>조회</button>
              		</td>
              	</tr>
              	<tr>
              		<td>
              			<div class="row mb-3">
		                  <label for="inputDate" class="col-sm-1 col-form-label">주문일</label>
		                  <div class="col-sm-2">
		                    <input type="date" class="form-control" id="orderDtFrom" name="orderDtFrom">
		                  </div>
		                  ~
		                  <div class="col-sm-2">
		                    <input type="date" class="form-control" id="orderDtTo" name="orderDtTo">
		                  </div>
		                  
		                </div>
              		</td>
              	</tr>
              	<tr>
              		<td>
              			<button type="button" class="btn btn-primary" onclick = 'statusChange1();'>일괄 배송중 처리</button>
              			<button type="button" class="btn btn-primary" onclick = 'statusChange2();'>일괄 배송완료 처리</button>
              		</td>
              	</tr>
              </table>
                
                
                
              </form>
              
            </div>
          </div>
           <div class="card">
            <div class="card-body">
              <!-- Table with hoverable rows -->
              <form id="dataform">
              <table class="table table-hover">
                <thead>
                  <tr>
                  	<th><input type="checkbox" name="ckAll"></th>
                    <th scope="col">No</th>
                    <th scope="col">주문번호</th>
                    <th scope="col">회원ID</th>
                    <th scope="col">회원명</th>
                    <th scope="col">상품명</th>
                    <th scope="col">주문금액</th>
                    <th scope="col">결제수단</th>
                    <th scope="col">주문상태</th>
                    <th scope="col">주문일</th>
                  </tr>
                </thead>
                <tbody id="tbody" >
                
                </tbody>
              </table>
              </form>
              <!-- End Table with hoverable rows -->
			  <nav aria-label="Page navigation example">
                <ul class="pagination" id="orderPaging">
                </ul>
              </nav><!-- End Pagination with icons -->
			   	
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
  <div class="modal fade" id="orderInfo" tabindex="-1">
       <div class="modal-dialog modal-xl modal-dialog-centered">
         <div class="modal-content">
           <div class="modal-header">
             <h5 class="modal-title">주문상세정보</h5>
             <button type="button" class="btn btn-primary" id="btnStep1" >결제완료</button>
             <button type="button" class="btn btn-primary" id="btnStep2" onclick = 'change1();'>배송준비중</button>
             <button type="button" class="btn btn-primary" id="btnStep3" onclick = 'change1();'>배송중</button>
             <button type="button" class="btn btn-primary" id="btnStep4" onclick = 'change1();'>배송완료</button>
             <button type="button" class="btn btn-primary" id="btnStep5" onclick = 'change1();'>주문취소</button>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
           </div>
           <div class="modal-body">
           <form id="modalform">
           	<input type='hidden' id='status' name='orderStatus'>
             <table class="table table-hover">
                <thead>
                  <tr>
                    <td scope="col" style="padding-right: 10px;">주문번호</td>
                    <td><input type="text" id="orderNo" name="orderNo"></td>
                  </tr>
                  <tr>
                    <td scope="col">회원명</td>
                    <td><input type="text" id="userName" name="userName" readonly></td>
                  </tr>
                  <tr>
                    <td scope="col">상품명</td>
                    <td><input type="text" id="orderGoodsName" name="orderGoodsName" readonly></td>
                  </tr>
                  <tr>
                    <td scope="col">주문일</td>
                    <td><input type="text" id="orderDt" name="orderDt" readonly></td>
                  </tr>
                  <tr>
                    <td scope="col">주문금액</td>
                    <td><input type="text" id="orderPrice" name="orderPrice" readonly></td>
                  </tr>
                  <tr>
                    <td scope="col">주문상태</td>
                    <td><input type="text" id="orderStatus" readonly></td>
                  </tr>
                  <tr>
                    <td scope="col">수취인</td>
                    <td><input type="text" id="receiveName" name="receiveName" readonly></td>
                  </tr>
                  <tr>
                    <td scope="col">수취인 연락처</td>
                    <td><input type="text" id="receivePhone" name="receivePhone" readonly></td>
                  </tr>
                  <tr>
                    <td scope="col">배송지 주소</td>
                    <td><input type="text" id="addr" name="addr" size=50 readonly></td>
                  </tr>
                  <tr>
                    <td scope="col">메모</td>
                    <td><textarea id="memo" name="memo" rows = "5" cols="40" readonly></textarea></td>
                  </tr>
                </thead>
              </table>
              <table class="table table-hover">
                <thead>
                <tr>
                	<th>주문이력</th>
                </tr>
                  <tr>
                    <td scope="col">No</td>
                    <td scope="col">카테고리</td>
                    <td scope="col">상품코드</td>
                    <td scope="col">상품명</td>
                    <td scope="col">구매단가</td>
                    <td scope="col">구매수량</td>
                    <td scope="col">재고수량</td>
                  </tr>
                </thead>
                <tbody id="goodsDtl">
              	</tbody>
              </table>
              <table>
                <tr>
               		<th>결제정보</th>
                </tr>
                <tr>
                	<td scope="col">결제유형</td>
                	<td><input type="text" id="payment" name="payment" readonly></td>
                </tr>
              </table>
              </form>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
           </div>
           
         </div>
       </div>
     </div><!-- End Vertically centered Modal-->
  <form id="hiddenform">
  		<input type='hidden' id='no' name='orderNo'>
  </form>
 
<script>
	//버튼기능 구현
	function change1(){
		var orderStatus = event.target.innerText;
		$('#status').val(orderStatus);
		call_server(modalform, '/order/statusUpdate', statusUpdate);
	}

	function statusUpdate(cnt){
		if(cnt>0){
			alert("처리완료!");
			$('#orderInfo').modal('hide');
			search();
		}else{
			alert("처리실패!");
		}
	}

	// 주문 조회
	function orderSearch(no){
		$('#currentPage').val(no);
		call_server(searchform, '/order/getOrderList', getOrderList);
	}
	
	function getOrderList(vo){  
		list = vo.orderList;
		$('#tbody').empty();
			for(var i = 0; i < list.length; i++){
				str = "<tr onclick=\"orderDetail('"+list[i].orderNo+"');\" style=\"cursor:pointer;\">";
				str += "<td><input type=\"checkbox\" name=\"ordernolist["+i+"]\" value='"+list[i].orderNo+"'></td>";
				str += "<th scope=\"row\">"+((Number(vo.currentPage)-1)*vo.countPerPage+(i+1))+"</th>";
				str += "<td>"+list[i].orderNo+"</td>";
				str += "<td>"+list[i].userId+"</td>";
				str += "<td>"+list[i].userName+"</td>";
				str += "<td>"+list[i].orderGoodsName+"</td>";
				str += "<td>"+list[i].orderPrice+"</td>";
				str += "<td>"+list[i].payment+"</td>";
				str += "<td>"+list[i].orderStatus+"</td>";
				str += "<input type='hidden' name='orderStatus' value='"+list[i].orderStatus+"'>";
				str += "<td>"+list[i].orderDt+"</td>";
				str += "</tr>";
				$('#tbody').append(str);
		}
		setPaging(orderPaging, vo.startPage, vo.endPage, 'orderSearch');
	}
	// 주문 상세 조회
	function orderDetail(no){
		$('#no').val(no);
		call_server(hiddenform, '/order/getOrderDtl', getOrderDtl);
	}
	function getOrderDtl(vo){
		$('#orderNo').val(vo.orderNo);
		$('#userName').val(vo.userName);
		$('#orderGoodsName').val(vo.orderGoodsName);
		$('#orderDt').val(vo.orderDt);
		$('#orderPrice').val(vo.orderPrice);
		$('#orderStatus').val(vo.orderStatus);
		$('#receiveName').val(vo.receiveName);
		$('#receivePhone').val(vo.receivePhone);
		$('#addr').val(vo.addr);
		$('#memo').val(vo.memo);
		$('#payment').val(vo.payment);
		if(vo.orderStatus == '결제완료'){
			//버튼 비활성화
			$('#btnStep1').prop("disabled", true);
			$('#btnStep2').prop("disabled", false);
			$('#btnStep3').prop("disabled", true);
			$('#btnStep4').prop("disabled", true);
			$('#btnStep5').prop("disabled", false);
			//버튼 색상 변경
			$('#btnStep1').css("background-color", "#FF0000");
			$('#btnStep2').css("background-color", "#0040FF");
			$('#btnStep3').css("background-color", "#848484");
			$('#btnStep4').css("background-color", "#848484");
			$('#btnStep5').css("background-color", "#0040FF");
		}
		if(vo.orderStatus == '배송준비중'){
			//버튼 비활성화
			$('#btnStep1').prop("disabled", true);
			$('#btnStep2').prop("disabled", true);
			$('#btnStep3').prop("disabled", false);
			$('#btnStep4').prop("disabled", true);
			$('#btnStep5').prop("disabled", false);
			//버튼 색상 변경
			$('#btnStep1').css("background-color", "#848484");
			$('#btnStep2').css("background-color", "#FF0000");
			$('#btnStep3').css("background-color", "#0040FF");
			$('#btnStep4').css("background-color", "#848484");
			$('#btnStep5').css("background-color", "#0040FF");
		}
		if(vo.orderStatus == '배송중'){
			//버튼 비활성화
			$('#btnStep1').prop("disabled", true);
			$('#btnStep2').prop("disabled", true);
			$('#btnStep3').prop("disabled", true);
			$('#btnStep4').prop("disabled", false);
			$('#btnStep5').prop("disabled", true);
			//버튼 색상 변경
			$('#btnStep1').css("background-color", "#848484");
			$('#btnStep2').css("background-color", "#848484");
			$('#btnStep3').css("background-color", "#FF0000");
			$('#btnStep4').css("background-color", "#0040FF");
			$('#btnStep5').css("background-color", "#848484");
		}
		if(vo.orderStatus == '배송완료'){
			//버튼 비활성화
			$('#btnStep1').prop("disabled", true);
			$('#btnStep2').prop("disabled", true);
			$('#btnStep3').prop("disabled", true);
			$('#btnStep4').prop("disabled", true);
			$('#btnStep5').prop("disabled", true);
			//버튼 색상 변경
			$('#btnStep1').css("background-color", "#848484");
			$('#btnStep2').css("background-color", "#848484");
			$('#btnStep3').css("background-color", "#848484");
			$('#btnStep4').css("background-color", "#FF0000");
			$('#btnStep5').css("background-color", "#848484");
		}
		//주문상품
		list = vo.orderGoods;
		$('#goodsDtl').empty();
		for (var i = 0; i < list.length; i++){
			var str = "<tr>";
			str += "<th scope=\"row\">"+(i+1)+"</th>";
			str += "<td>"+list[i].ctName+"</td>";
			str += "<td>"+list[i].goodsCd+"</td>";
			str += "<td>"+list[i].goodsName+"</td>";
			str += "<td>"+list[i].unitPrice+"</td>";
			str += "<td>"+list[i].buyQty+"</td>";
			str += "<td>"+list[i].ivQty+"</td>";
			str += "</tr>";
			$('#goodsDtl').append(str);
		}
		$('#orderInfo').modal('show');
	}
	
	// 체크박스
	$("input[name=ckAll]").click(function(){
	    if($("input[name=ckAll]").prop("checked")){
	    	$('input[name^="ordernolist"]').prop('checked', true);   // 전체 체크
	    }else{
	    	$('input[name^="ordernolist"]').prop('checked', false);  // 전체 체크 해제
	    }
	})
	
	// 일괄 처리
	function statusChange1(){
		call_server(dataform, '/order/updateOrder', updateOrder);
	}
	function statusChange2(){
		call_server(dataform, '/order/updateOrder1', updateOrder1);
	}
	
	function updateOrder(cnt){
		if(cnt>0){
			alert("처리완료!");
			search();
		}else{
			alert("처리실패!");
		}
	}

	function updateOrder1(cnt){
		if(cnt>0){
			alert("처리완료!");
			search();
		}else{
			alert("처리실패!");
		}
	}
</script>
<script src="/assets/js/paging.js"></script>