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
              <input type="hidden" id="currentPage" name="currentPage">
              <table class="col-lg-12" >
              	<tr>
              		<td>
		              	<div class="row mb-4">
		                  <label for="inputText" class="col-sm-1 col-form-label">회원명</label>
		                  <div class="col-sm-2">
		                    <input type="text" class="form-control" id="userName" name="userName">
		                  </div>
		                </div>
		           <td>
		           <td rowspan="2">
		                <div class="row mb-4">
		                  <label for="inputText" class="col-sm-3 col-form-label">탈퇴여부</label>
		                  <div class="col-sm-2">
		                    <select name="withDrawYn" >
   								<option value=>=== 선택 ===</option>
   								<option value="Y">Y</option>
    							<option value="N">N</option>
    						</select>
		                  </div>
		                </div>		
              		</td>
              		<td rowspan="2">
              			<button type="button" class="btn btn-info" onclick = 'usersearch(1);'>조회</button>
              		</td>
              	</tr>
              	<tr>
              		<td>
              			<div class="row mb-3">
		                  <label for="inputDate" class="col-sm-1 col-form-label">가입일</label>
		                  <div class="col-sm-2">
		                    <input type="date" class="form-control" id="joinDtFrom" name="joinDtFrom">
		                  </div>
		                  ~
		                  <div class="col-sm-2">
		                    <input type="date" class="form-control" id="joinDtTo" name="joinDtTo">
		                  </div>
		                  
		                </div>
              		</td>
              	</tr>
              </table>
                
                
                
              </form>
              
            </div>
          </div>
           <div class="card">
            <div class="card-body">
              <!-- Table with hoverable rows -->
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">No</th>
                    <th scope="col">회원ID</th>
                    <th scope="col">회원명</th>
                    <th scope="col">이메일</th>
                    <th scope="col">연락처</th>
                    <th scope="col">가입일</th>
                    <th scope="col">탈퇴여부</th>
                    <th scope="col">탈퇴일</th>
                  </tr>
                </thead>
                <tbody id="tbody" >
                
                </tbody>
              </table>
              <!-- End Table with hoverable rows -->
			  <nav aria-label="Page navigation example">
                <ul class="pagination" id="userPaging">
                </ul>
              </nav><!-- End Pagination with icons -->
			   	
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
  <div class="modal fade" id="memberInfo" tabindex="-1">
       <div class="modal-dialog modal-xl modal-dialog-centered">
         <div class="modal-content">
           <div class="modal-header">
           	
             <h5 class="modal-title">회원상세</h5>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
           </div>
           <div class="modal-body">
             <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">회원ID</th>
                    <th scope="col">회원명</th>
                    <th scope="col">이메일</th>
                    <th scope="col">연락처</th>
                    <th scope="col">주소</th>
                    <th scope="col">가입일</th>
                    <th scope="col">탈퇴여부</th>
                    <th scope="col">탈퇴일</th>
                    <th scope="col">주문횟수</th>
                    <th scope="col">주문금액</th>
                  </tr>
                </thead>
                <tbody id="tbodyDt">
              	</tbody>
              </table>
              <table class="table table-hover">
                <thead>
                <tr>
                	<td>주문이력</td>
                </tr>
                  <tr>
                    <th scope="col">No</th>
                    <th scope="col">주문번호</th>
                    <th scope="col">주문상품명</th>
                    <th scope="col">상품수량</th>
                    <th scope="col">주문금액</th>
                    <th scope="col">수취인</th>
                    <th scope="col">배송지</th>
                    <th scope="col">배송상태</th>
                    <th scope="col">주문서보기</th>
                  </tr>
                </thead>
                <tbody id="orderDtl">
              	</tbody>
              </table>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-primary">저장</button>
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
           </div>
           
         </div>
       </div>
     </div><!-- End Vertically centered Modal-->
  <form id="hiddenform">
  		<input type = 'hidden' id = 'userId' name = 'userId'>
  </form>
 
<script>
	// 회원 조회
	function usersearch(no){
		$('#currentPage').val(no);
		call_server(searchform, '/user/getList', getList);
	}
    function getList(vo){
    	list = vo.userList;
    	$('#tbody').empty();
    	for(var i=0; i<list.length; i++){
    		str = "<tr onclick=\"memberDetail('"+list[i].userId+"');\" style=\"cursor:pointer;\">";
    		str += "<th scope=\"row\">"+((Number(vo.currentPage)-1)*vo.countPerPage+(i+1))+"</th>";
    		str += "<td>"+list[i].userId+"</td>";
    		str += "<td>"+list[i].userName+"</td>";
    		str += "<td>"+list[i].email+"</td>";
    		str += "<td>"+list[i].phone+"</td>";
    		str += "<td>"+list[i].joinDt+"</td>";
    		str += "<td>"+list[i].withDrawYn+"</td>";
    		if(list[i].withDrawDt == null){
    			str += "<td>"+'-'+"</td>";
    		}else{
    			str += "<td>"+list[i].withDrawDt+"</td>";
    		}
    		str += "</tr>";
    		$('#tbody').append(str);
    	}
    	setPaging(userPaging, vo.startPage, vo.endPage, 'usersearch');
	}

	function memberDetail(id){
		//$('#memberInfo').modal('show');
		$('#userId').val(id);
		
		call_server(hiddenform, '/user/memberDetail', getUserDetail);
	}
	
	function getUserDetail(vo){
		$('#tbodyDt').empty();
		var str = "<tr>";
		str += "<td>"+vo.userId+"</td>";
		str += "<td>"+vo.userName+"</td>";
		str += "<td>"+vo.email+"</td>";
		str += "<td>"+vo.phone+"</td>";
		str += "<td>"+vo.addr+vo.addrDtl+"</td>";
		str += "<td>"+vo.joinDt+"</td>";
		str += "<td>"+vo.withDrawYn+"</td>";
		if(vo.withDrawDt == null){
			str += "<td>"+"-"+"</td>";
		}else{
			str += "<td>"+vo.withDrawDt+"</td>";
		}
		if(vo.orderCnt == null){
			str += "<td>"+"-"+"</td>";
		}else{
			str += "<td>"+vo.orderCnt+"</td>";
		}
		if(vo.orderPrice == null){
			str += "<td>"+"-"+"</td>";
		}else{
			str += "<td>"+vo.orderPrice+"</td>";
		}
		str += "</tr>";
		$('#tbodyDt').append(str);
		
		list = vo.orderlist;
		$('#orderDtl').empty();
		for (var i = 0; i < list.length; i++){
			var str = "<tr>";
			str += "<th scope=\"row\">"+(i+1)+"</th>";
			str += "<td>"+list[i].orderNo+"</td>";
			str += "<td>"+list[i].orderGoodsName+"</td>";
			str += "<td>"+list[i].buyQty+"</td>";
			str += "<td>"+list[i].orderPrice+"</td>";
			str += "<td>"+list[i].receiveName+"</td>";
			str += "<td>"+list[i].addr+"</td>";
			str += "<td>"+list[i].orderStatus+"</td>";
			str += "<td><button type='button' onclick = 'orderview();'>주문서 보기</button></td>";
			str += "</tr>";
			$('#orderDtl').append(str);
		}
		$('#memberInfo').modal('show');
	}

</script>
<script src="/assets/js/paging.js"></script>