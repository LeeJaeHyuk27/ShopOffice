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
		                  <label for="inputText" class="col-sm-1 col-form-label">거래처명</label>
		                  <div class="col-sm-2">
		                    <input type="text" class="form-control" id="supplierName1" name="supplierName">
		                  </div>
		                </div>
		           <td>
		           <td rowspan="2">
		                <div class="row mb-4">
		                  <label for="inputText" class="col-sm-1 col-form-label">거래처상태</label>
		                  <div class="col-sm-2">
		                    <select name="supplierStatus" >
   								<option value=>=== 선택 ===</option>
   								<option value="거래중">거래중</option>
    							<option value="거래중지">거래중지</option>
    						</select>
		                  </div>
		                </div>		
              		</td>
              		<td>
              			<button type="button" class="btn btn-info" onclick = 'supSearch(1);'>조회</button>
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
                    <th scope="col">거래처 코드</th>
                    <th scope="col">거래처명</th>
                    <th scope="col">대표명</th>
                    <th scope="col">전화번호</th>
                    <th scope="col">담당자명</th>
                    <th scope="col">담당자 연락처</th>
                    <th scope="col">담당자 이메일</th>
                    <th scope="col">거래처</th>
                    <th scope="col">등록일</th>
                  </tr>
                </thead>
                <tbody id="tbody">
                </tbody>
              </table>
              <!-- End Table with hoverable rows -->
			  <nav aria-label="Page navigation example">
                <ul class="pagination" id="supPaging">
                </ul>
              </nav><!-- End Pagination with icons -->
			   	
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
  <div class="modal fade" id="supplierInfo" tabindex="-1">
       <div class="modal-dialog modal-xl modal-dialog-centered">
         <div class="modal-content">
           <div class="modal-header">
           	
             <h5 class="modal-title">거래처 등록/수정</h5>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
           </div>
           <div class="modal-body">
           <form id="modalform">
             <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">거래처코드</th>
                    <td><input type="text" style = 'text-align: right;' id="supplierCd" name="supplierCd" readonly>(거래처코드는 수정이 불가합니다.)</td>
                  </tr>
                  <tr>
                    <th scope="col">거래처명</th>
                    <td><input type='text' style = 'text-align: right;' id="supplierName" name="supplierName"></td>
                  </tr>
                  <tr>
                    <th scope="col">대표명</th>
                    <td><input type='text' style = 'text-align: right;' id="supplierCeo" name="supplierCeo"></td>
                  </tr>
                  <tr>
                    <th scope="col">전화번호</th>
                    <td><input type='text' style = 'text-align: right;' id="phone" name="phone"></td>
                  </tr>
                  <tr>
                    <th scope="col">담당자명</th>
                    <td><input type='text' style = 'text-align: right;' id="opName" name="opName"></td>
                  </tr>
                  <tr>
                    <th scope="col">담당자연락처</th>
                    <td><input type='text' style = 'text-align: right;' id="opPhone" name="opPhone"></td>
                  </tr>
                  <tr>
                    <th scope="col">담당자이메일</th>
                     <td>
                   	  <input type='text' style = 'text-align: right;' id="opEmail" name="opEmail">@
                      <input type='text' style = 'text-align: right;' id="email" name="email">
                      <select id="emailChoice" name="emailChoice" onchange="setEmail(this)">
   					  	<option value="직접입력">===직접입력===</option>
   					  	<option value="email.com">email.com</option>
    				  	<option value="naver.com">naver.com</option>
    				  </select>
                     </td>
                  </tr>
                  <tr>
                    <th scope="col">거래상태</th>
                    <td>
		               <div class="col-sm-2">
		                  <select id="supplierStatus" name="supplierStatus" >
   						  	<option value=>=== 선택 ===</option>
   						  	<option value="거래중">거래중</option>
   						  	<option value="거래중지">거래중지</option>
    					  </select>
		               </div>
                  </tr>
                </thead>
                <tbody id="tbodyDt">
              	</tbody>
              </table>
              </form>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-primary" onclick = 'update();'>수정</button>
             <button type="button" class="btn btn-primary" onclick = 'register();'>등록</button>
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
           </div>
         </div>
       </div>
     </div><!-- End Vertically centered Modal-->
  <form id="hiddenform">
  		<input type = 'hidden' id = 'supplierCd1' name = 'supplierCd'>
  </form>
  <form id="hiddenform1">
  		<input type = 'hidden' id = '' name = 'email'>
  </form>
 
<script>

	// 거래처 조회
	function supSearch(no){
		$('#currentPage').val(no);
		call_server(searchform, '/supplier/getSupList', getSupList);
	}
	function getSupList(vo){
		list = vo.supplierList;
		$('#tbody').empty();
		for(var i = 0; i < list.length; i++){
			str = "<tr onclick=\"supDetail('"+list[i].supplierCd+"');\" style=\"cursor:pointer;\">";
			str += "<th scope=\"row\">"+((Number(vo.currentPage)-1)*vo.countPerPage+(i+1))+"</th>";
			str += "<td>"+list[i].supplierCd+"</td>";
			str += "<td>"+list[i].supplierName+"</td>";
			str += "<td>"+list[i].supplierCeo+"</td>";
			str += "<td>"+list[i].phone+"</td>";
			str += "<td>"+list[i].opName+"</td>";
			str += "<td>"+list[i].opPhone+"</td>";
			str += "<td>"+list[i].opEmail+"</td>";
			str += "<td>"+list[i].supplierStatus+"</td>";
			str += "<td>"+list[i].regDt+"</td>";
			str += "</tr>";
			$('#tbody').append(str);
		}
		setPaging(supPaging, vo.startPage, vo.endPage, 'supSearch');
	}
	// 거래처 수정/등록 모달 띄우기
	function supDetail(cd){
		$('#supplierCd1').val(cd);
		call_server(hiddenform, '/supplier/getSupDtl', getSupDtl);
	}
	function getSupDtl(vo){
		$('#supplierCd').val(vo.supplierCd);
		$('#supplierName').val(vo.supplierName);
		$('#supplierCeo').val(vo.supplierCeo);
		$('#phone').val(vo.phone);
		$('#opName').val(vo.opName);
		$('#opPhone').val(vo.opPhone);
	    var opEmailParts = vo.opEmail.split('@');
	    var opEmailFirstPart = opEmailParts[0];
	    $('#opEmail').val(opEmailFirstPart);
	    $('#email').val(opEmailParts[1]);
		$('#supplierStatus').val(vo.supplierStatus);	
		$('#supplierInfo').modal('show');
	}
	// 거래처 수정
	function update(){
		$("#email").removeAttr('disabled');
		call_server(modalform, '/supplier/updateSupplier', updateSupplier);
	}
	function updateSupplier(cnt){
		if(cnt>0){
			alert("수정완료!");
			$('#supplierInfo').modal('hide');
			search();
		}else{
			alert("수정실패!");
		}
	}
	// 이메일 선택
	$(function() {
	    $("#emailChoice").change(function() {
	        var selectedValue = $(this).val();
	        var emailInput = $("#email");
	        
	        if (selectedValue === '직접입력') {
	            emailInput.val(''); // 입력값 비우기
	            emailInput.prop('disabled', false); // 입력 활성화
	        } else {
	            emailInput.val(selectedValue);
	            emailInput.prop('disabled', true); // 입력 비활성화
	        }
	    });   
	});
	// 거래처 등록
	function regSup(){
		$('#modalform')[0].reset();
		$('#supplierInfo').modal('show');
	}
	function register(){
		$("#email").removeAttr('disabled');
		call_server(modalform, '/supplier/insertSupplier', insertSupplier);
	}
	function insertSupplier(cnt){
		if(cnt>0){
			alert("등록완료!");
			$('#supplierInfo').modal('hide');
			search();
		}else{
			alert("등록실패!");
		}
	}
</script>
<script src="/assets/js/paging.js"></script>