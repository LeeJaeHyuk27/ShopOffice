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
		              	<div class="row mb-1">
		                  <label for="inputText" class="col-sm-2 col-form-label">거래처명</label>
		                  <div class="col-sm-2">
		                    <input type="text" class="form-control" id="supplierName" name="supplierName">
		                  </div>
		                </div>
		           <td>
		           <td>
              			<div class="row mb-3">
		                  <label for="inputDate" class="col-sm-2 col-form-label">발주일</label>
		                  <div class="col-sm-2">
		                    <input type="date" class="form-control" id="incomeDtFrom" name="incomeDtFrom">
		                  </div>
		                  ~
		                  <div class="col-sm-2">
		                    <input type="date" class="form-control" id="incomeDtTo" name="incomeDtTo">
		                  </div>
		                  
		                </div>
              		</td>
              		<td>
              			<button type="button" class="btn btn-info" onclick = 'supOrderSearch(1);'>조회</button>
              			<button type="button" class="btn btn-info" onclick = 'regSup();'>신규</button>
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
                    <th scope="col">거래처코드</th>
                    <th scope="col">거래처명</th>
                    <th scope="col">발주번호</th>
                    <th scope="col">발주일</th>
                    <th scope="col">상품코드</th>
                    <th scope="col">상품명</th>
                    <th scope="col">발주수량</th>
                    <th scope="col">입고단가</th>
                    <th scope="col">상태</th>
                    <th scope="col">입고일</th>
                  </tr>
                </thead>
                <tbody id="tbody">
                </tbody>
              </table>
              <!-- End Table with hoverable rows -->
			  <nav aria-label="Page navigation example">
                <ul class="pagination" id="supOrderPaging">
                </ul>
              </nav><!-- End Pagination with icons -->
			   	
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
  <div class="modal fade" id="supOrderInfo" tabindex="-1">
       <div class="modal-dialog modal-xl modal-dialog-centered">
         <div class="modal-content">
           <div class="modal-header">
           	
             <h5 class="modal-title">상품발주</h5>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
           </div>
           <div class="modal-body">
           <form id="modalform">
             <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col" class="col-sm-1">거래처</th>
                    <td>
		               <div class="col-sm-2">
		                  <select id="supplierName1" name="supplierName" >
   						  	<option value=>=== 선택 ===</option>
    					  </select>
		               </div>
                  </tr>
                </thead>
              </table>
              <table class="table table-hover" border='3'>
                <thead>
                  <tr>
                    <th scope="col" class="col-sm-1">대표자명</th>
                    <td><input type="text" style = 'text-align: right;' id="supplierCeo" name="supplierCeo" ></td>
                    <th scope="col" class="col-sm-1">전화번호</th>
                    <td><input type="text" style = 'text-align: right;' id="phone" name="phone" ></td>
                  </tr>
                  <tr>
                    <th scope="col" class="col-sm-1">담당자명</th>
                    <td><input type="text" style = 'text-align: right;' id="opName" name="opName" ></td>
                    <th scope="col" class="col-sm-1">연락처</th>
                    <td><input type="text" style = 'text-align: right;' id="opPhone" name="opPhone" ></td>
                  </tr>
                  <tr>
                    <th scope="col" class="col-sm-1">이메일</th>
                    <td><input type="text" style = 'text-align: right;' id="opEmail" name="opEmail" ></td>
                    <th scope="col" class="col-sm-1">상태</th>
                    <td><input type="text" style = 'text-align: right;' id="supplierStatus" name="supplierStatus" ></td>
                  </tr>
                </thead>
              </table>
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col" class="col-sm-1">주문상품</th>
                    <td><button type="button" class="btn btn-info" onclick = 'plus();'>+</button></td>
                  </tr>
                  <tr>
                    <th scope="col">상품코드</th>
                    <th scope="col">상품명</th>
                    <th scope="col">단가</th>
                    <th scope="col">수량</th>
                    <th scope="col">삭제</th>
                  </tr>
                </thead>
                <tbody id="tbodyDt">
              	</tbody>
              </table>
              </form>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-primary" onclick = 'ordering();'>발주</button>
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
           </div>
           
         </div>
       </div>
     </div><!-- End Vertically centered Modal-->
  <form id="hiddenform">
  		<input type = 'hidden' id = 'supplierCd' name = 'supplierCd'>
  </form>
  <form id="hiddenform1">
  		<input type = 'hidden' id = 'goodsCdh' name = 'goodsCd'>
  		<input type = 'hidden' id = 'goodsCnt'>
  </form>
 
<script>
	// 발주 신청
	function ordering(){
		call_server(modalform, '/supplier/insertSupOrder', insertSupOrder);
	}
	function insertSupOrder(cnt){
		if(cnt>0){
			alert("발주완료!");
			$('#supOrderInfo').modal('hide');
			search();
		}else{
			alert("발주실패!");
		}
	}
	// 발주 조회
	function supOrderSearch(no){
		$('#currentPage').val(no);
		call_server(searchform, '/supplier/getSupOrderSearch', getSupOrderSearch);
	}
	function getSupOrderSearch(vo){
		list = vo.supOrderList;
		$('#tbody').empty();
		for(var i = 0; i < list.length; i++){
			str = "<tr onclick=\"supOrderDtl('"+list[i].supplierCd+"');\" style=\"cursor:pointer;\">";
			str += "<th scope=\"row\">"+((Number(vo.currentPage)-1)*vo.countPerPage+(i+1))+"</th>";
			str += "<td>"+list[i].supplierCd+"</td>";
			str += "<td>"+list[i].supplierName+"</td>";
			str += "<td>"+list[i].orderNo+"</td>";
			str += "<td>"+list[i].incomeDt+"</td>";
			str += "<td>"+list[i].goodsCd+"</td>";
			str += "<td>"+list[i].goodsName+"</td>";
			str += "<td>"+list[i].buyQty+"</td>";
			str += "<td>"+list[i].unitPrice+"</td>";
			str += "<td>"+list[i].orderStatus+"</td>";
    		if(list[i].regDt == null){
    			str += "<td>"+'-'+"</td>";
    		}else{
    			str += "<td>"+list[i].regDt+"</td>";
    		}
			str += "</tr>";
			$('#tbody').append(str);
		}
		setPaging(supOrderPaging, vo.startPage, vo.endPage, 'supOrderSearch');
	}
	// 발주 상세조회
	function supOrderDtl(cd){
		$('#supplierCd').val(cd);
		call_server(hiddenform, '/supplier/getSupDtl', getSupDtl);
		call_server(hiddenform, '/supplier/getSupOrderDtl', getSupOrderDtl);
		$('#supOrderInfo').modal('show');
	}
	// 발주 정보 가져오기
	function getSupOrderDtl(list){
		$('#tbodyDt').empty();
		for(var i = 0; i < list.length; i++){
			var str = "<tr>";
			str += "<td>"+list[i].goodsCd+"</td>";
			str += "<td>"+list[i].goodsName+"</td>";
			str += "<td>"+list[i].unitPrice+"</td>";
			str += "<td>"+list[i].buyQty+"</td>";
			str += "<td><button type=\"button\" class=\"btn btn-primary\" onclick = \"deleteLine(this);\">삭제</button></td>"
			str += "</tr>";
			$('#tbodyDt').append(str);
		}
	}
	
	// 신규 등록
	function regSup(){
		$('#modalform')[0].reset();
		$('#tbodyDt').empty();
		$('#supOrderInfo').modal('show');
	}
	// 거래처 선택
	$(function() {
	    $("#supplierName1").change(function() {
	    	$('#tbodyDt').empty();
	    	$('#supplierCd').val($(this).val());
	    	call_server(hiddenform, '/supplier/getSupDtl', getSupDtl);
	    	
	    });   
	});
	
	// 거래처 정보 가져오기
	function getSupDtl(vo){
		$('#supplierCeo').val(vo.supplierCeo);
		$('#phone').val(vo.phone);
		$('#opName').val(vo.opName);
		$('#opPhone').val(vo.opPhone);
		$('#opEmail').val(vo.opEmail);
		$('#supplierStatus').val(vo.supplierStatus);
	}
	// 발주 추가
	var goodsCnt=0;
	function plus(){
		call_server(hiddenform, '/goods/getGoodsList', getGoodsCd);
	}
	
	// 상품코드 목록/선택
	function getGoodsCd(list){
		var str = "<tr>";
		str += "<td><select id=\"goodsCd"+goodsCnt+"\" name=\"goodsCd\" onchange=\"getName(this, "+goodsCnt+")\"><option value=>=== 선택 ===</option></select></td>";
		str += "<td><input type=\"text\" id=\"goodsName"+goodsCnt+"\" name=\"goodsName\" readonly></td>"
		str += "<td><input type=\"text\" id=\"unitPrice"+goodsCnt+"\" name=\"unitPrice\"></td>"
		str += "<td><input type=\"text\" id=\"buyQty"+goodsCnt+"\" name=\"buyQty\"></td>"
		str += "<td><button type=\"button\" class=\"btn btn-primary\" onclick = \"deleteLine(this);\">삭제</button></td>"
		str += "</tr>";
		$('#tbodyDt').append(str);
		for(var i = 0; i < list.length; i++){
			$('#goodsCd'+goodsCnt).append("<option value="+list[i].goodsCd+">"+list[i].goodsCd+"</option>");
		}
		goodsCnt++;
	}
	// 이름 불러오기
	function getName(cd, cnt){

		var gcd = $(cd).val();
		$('#goodsCdh').val(gcd);
		$('#goodsCnt').val(cnt);
		call_server(hiddenform1, '/goods/getGoodsName', getGoodsName);
	}
	function getGoodsName(vo){
		var cnt = $('#goodsCnt').val();
		$('#goodsName'+cnt).val(vo.goodsName);
	}
	
	// 삭제하기
	function deleteLine(obj) {
		$(obj).closest('tr').remove();
	}
	
	// 거래처 콤보박스
	$(function(){
		call_server(hiddenform, "/sup/getSupNameList", getSupNameList);
	});
	function getSupNameList(list){
		var str;
		for(var i = 0; i < list.length; i++){
			str += "<option value="+list[i].supplierCd+">"+list[i].supplierName+"</option>";
		}
		$('#supplierName1').append(str);
		
	}

</script>
<script src="/assets/js/paging.js"></script>