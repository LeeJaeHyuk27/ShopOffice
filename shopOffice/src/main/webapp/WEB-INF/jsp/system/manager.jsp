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
		                  <label for="inputText" class="col-sm-2 col-form-label">관리자명</label>
		                  <div class="col-sm-2">
		                    <input type="text" class="form-control" id="manageName" name="manageName">
		                  </div>
		                </div>
		           <td>
		           <td rowspan="2">
		                <div class="row mb-4">
		                  <label for="inputText" class="col-sm-3 col-form-label">퇴사여부</label>
		                  <div class="col-sm-2">
		                    <select name="leaveYn" >
   								<option value=>===선택===</option>
   								<option value="Y">Y</option>
    							<option value="N">N</option>
    						</select>
		                  </div>
		                </div>		
              		</td>
              		<td>
              			<button type="button" class="btn btn-info" onclick = 'manageSearch(1);'>조회</button>
              			<button type="button" class="btn btn-info" onclick = 'regManager();'>신규</button>
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
                    <th scope="col">관리자ID</th>
                    <th scope="col">관리자명</th>
                    <th scope="col">이메일</th>
                    <th scope="col">연락처</th>
                    <th scope="col">등록일</th>
                    <th scope="col">퇴사여부</th>
                  </tr>
                </thead>
                <tbody id="tbody">
                </tbody>
              </table>
              <!-- End Table with hoverable rows -->
			  <nav aria-label="Page navigation example">
                <ul class="pagination" id="managePaging">
                </ul>
              </nav><!-- End Pagination with icons -->
			   	
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
  <div class="modal fade" id="managerInfo" tabindex="-1">
       <div class="modal-dialog modal-xl modal-dialog-centered">
         <div class="modal-content">
           <div class="modal-header">
           	
             <h5 class="modal-title">관리자 등록/수정</h5>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
           </div>
           <div class="modal-body">
           <form id="modalform">
             <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">관리자ID</th>
                    <td><input type="text" style = 'text-align: right;' id="manageId" name="manageId"></td>
                    <th scope="col">관리자명</th>
                    <td><input type='text' style = 'text-align: right;' id="manageName1" name="manageName"></td>
                  </tr>
                  <tr>
                    <th scope="col">비밀번호</th>
                    <td><input type='password' style = 'text-align: right;' id="managePwd" name="managePwd"></td>
                    <th scope="col">비밀번호확인</th>
                    <td><input type='password' style = 'text-align: right;' id="managePwdCheck" name="managePwdCheck"></td>
                  </tr>
                  <tr>
                    <th scope="col">이메일</th>
                    <td><input type='text' style = 'text-align: right;' id="email" name="email"></td>
                  </tr>
                  <tr>
                    <th scope="col">전화번호</th>
                    <td><input type='text' style = 'text-align: right;' id="phone" name="phone"></td>
                  </tr>
                  <tr>
                    <th scope="col">퇴사여부</th>
                     <td>
                      <select id="leaveYn1" name="leaveYn">
   					  	<option value=>===선택===</option>
   					  	<option value="Y">Y</option>
    				  	<option value="N">N</option>
    				  </select>
                     </td>
                  </tr>
                </thead>
                <tbody id="tbodyDt">
              	</tbody>
              </table>
              </form>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-primary" onclick = 'save();'>저장</button>
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
           </div>
         </div>
       </div>
     </div><!-- End Vertically centered Modal-->
  <form id="hiddenform">
  		<input type = 'hidden' id = 'manageId1' name = 'manageId'>
  </form>

<script>
	// 관리자 조회
	function manageSearch(no){
		$('#currentPage').val(no);
		call_server(searchform, '/system/getManagerList', getManagerList);
	}
	function getManagerList(list){
		$('#tbody').empty();
		for(var i = 0; i < list.length; i++){
			str = "<tr onclick=\"manageDtl('"+list[i].manageId+"');\" style=\"cursor:pointer;\">";
			str += "<th scope=\"row\">"+((Number(vo.currentPage)-1)*vo.countPerPage+(i+1))+"</th>";
			str += "<td>"+list[i].manageId+"</td>";
			str += "<td>"+list[i].manageName+"</td>";
			str += "<td>"+list[i].email+"</td>";
			str += "<td>"+list[i].phone+"</td>";
			str += "<td>"+list[i].regDt+"</td>";
			str += "<td>"+list[i].leaveYn+"</td>";
			str += "</tr>";
			$('#tbody').append(str);
		}
		setPaging(managePaging, vo.startPage, vo.endPage, 'manageSearch');
	}
	// 모달창 띄우기
	function manageDtl(id){
		$('#modalform')[0].reset();
		$('#manageId1').val(id);
		call_server(hiddenform, '/system/getManagerDtl', getManagerDtl);
	}
	function getManagerDtl(vo){
		$('#manageId').val(vo.manageId);
		$('#manageName1').val(vo.manageName);
		$('#email').val(vo.email);
		$('#phone').val(vo.phone);
		$('#leaveYn1').val(vo.leaveYn);
		$('#managerInfo').modal('show');
	}
	// 관리자 신규 등록
	function regManager(){
		$('#modalform')[0].reset();
		$('#managerInfo').modal('show');
	}
	// 등록/수정 버튼
	function save(){
		if($('#managePwd').val() == $('#managePwdCheck').val()){
			call_server(modalform, '/system/saveManager', saveManager);
		}else{
			alert("비밀번호를 다시 확인해주세요");
		}
		
	}
	// 관리자 수정
	function saveManager(cnt){
		if(cnt>0){
			alert("저장완료!");
			$('#managerInfo').modal('hide');
			search();
		}else{
			alert("저장실패!");
		}
	}
</script>
<script src="/assets/js/paging.js"></script>