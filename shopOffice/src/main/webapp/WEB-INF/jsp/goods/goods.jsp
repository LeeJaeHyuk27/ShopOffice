<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <title>상품조회</title>
  
  <main id="main" class="main">

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body" style="padding-top: 20px;">
              <!-- General Form Elements -->
              <form id="searchform">
              <input type='hidden' id='currentPage' name='currentPage'>
              	<input type = 'hidden' id = 'ctCd' name = 'ctCd'>
              <table class="col-lg-12" >
              	<tr>
              		<td>
		              	<div class="row mb-6">
		                  <label for="inputText" class="col-sm-1 col-form-label">상품명</label>
		                  <div class="col-sm-2">
		                    <input type="text" class="form-control" id="goodsName" name="goodsName">
		                  </div>
		                </div>
		           <td>
		           <td rowspan="2">
		                <div class="row mb-6">
		                  <label for="inputText" class="col-sm-1 col-form-label">상품상태</label>
		                  <div class="col-sm-2">
		                    <select name="goodsStatus" >
   								<option value=>=== 선택 ===</option>
   								<option value="판매중">판매중</option>
    							<option value="판매완료">판매완료</option>
    						</select>
		                  </div>
		                </div>		
              		</td>
              		<td>
		              	<div class="row mb-6">
		                  <label for="inputText" class="col-sm-1 col-form-label">거래처</label>
		                  <div class="col-sm-2">
		                    <select id="supplierCd" name="supplierCd" >
   								<option value=>=== 선택 ===</option>
    						</select>
		                  </div>
		                </div>
		            </td>
              		<td rowspan="2">
              			<button type="button" class="btn btn-info" onclick = 'goodsSearch(1);'>조회</button>
              			<button type="button" class="btn btn-info" onclick = 'insert();'>등록</button>
              		</td>
              	</tr>
              	<tr>
              		<td><strong>카테고리 선택</strong></td>
              	</tr>
              	<tr>
    				<td style="padding: 0;">
        				<div class="row mb-4">
            				<div class="col-sm-2">
               					 <select id="1" name="1" onchange="setCt1(this)">
                    				<option value="">=== 대분류 ===</option>
               					 </select>
            				</div>
            			<div class="col-sm-2">
                			<select id="2" name="2" onchange="setCt2(this)">
                    			<option value="">=== 중분류 ===</option>
                			</select>
            			</div>
            			<div class="col-sm-2">
               				 <select id="3" name="3" >
                    			<option value="">=== 소분류 ===</option>
                			</select>
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
                    <th scope="col">상품코드</th>
                    <th scope="col">상품명</th>
                    <th scope="col">카테고리</th>
                    <th scope="col">판매가</th>
                    <th scope="col">재고량</th>
                    <th scope="col">등록일</th>
                    <th scope="col">상품상태</th>
                  </tr>
                </thead>
                <tbody id="tbody" >
                
                </tbody>
              </table>
              <!-- End Table with hoverable rows -->
			  <nav aria-label="Page navigation example">
                <ul class="pagination" id="goodsPaging">
                </ul>
              </nav><!-- End Pagination with icons -->
			   	
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>

 <div class="modal fade" id="goodsInfo" tabindex="-1">
       <div class="modal-dialog modal-xl modal-dialog-centered">
         <div class="modal-content">
           <div class="modal-header">
           	
             <h5 class="modal-title">상품등록/수정</h5>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
           </div>
           <div class="modal-body">
           <form id="goodsform" name="goodsform" enctype="multipart/form-data">
           	<input type = 'hidden' id = 'ctCd1' name = 'ctCd'>
             <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">상품코드</th>
                    <td><input type="text" style = 'text-align: right;' id="goodsCd" name="goodsCd" readonly>(상품코드는 수정이 불가합니다.)</td>
                  </tr>
                  <tr>
                    <th scope="col">상품명</th>
                    <td><input type='text' style = 'text-align: right;' id="goodsName1" name="goodsName"></td>
                  </tr>
                  <tr>
                    <th scope="col">정상가</th>
                    <td><input type='text' style = 'text-align: right;' id="normalPrice" name="normalPrice">원</td>
                    <th scope="col">판매가</th>
                    <td><input type='text' style = 'text-align: right;' id="sellPrice" name="sellPrice">원</td>
                  </tr>
                  <tr>
                    <th scope="col">재고수량</th>
                    <td><input type='text' style = 'text-align: right;' id="ivQty" name="ivQty">개</td>
                    <th scope="col">상품상태</th>
                    <td>
                    	<select id="goodsStatus" name="goodsStatus" >
   							<option value=>=== 선택 ===</option>
   							<option value="판매중">판매중</option>
    						<option value="판매완료">판매완료</option>
    					</select>
                    </td>
                  </tr>
                  <tr>
                    <th scope="col">카테고리</th>
                    <td>
                    	<select id="1dtl" onchange="setCt1(this)">
                    		<option value="">=== 대분류 ===</option>
               			</select>
               			<select id="2dtl" onchange="setCt2(this)">
                    		<option value="">=== 중분류 ===</option>
                		</select>
                		<select id="3dtl" >
                    		<option value="">=== 소분류 ===</option>
                		</select>
               		</td>
                    <th scope="col">거래처</th>
		           	<td>
		               <div class="col-sm-2">
		                  <select id="supplierCd1" name="supplierCd" >
   						  	<option value=>=== 선택 ===</option>
    					  </select>
		               </div>
		            </td>
                  </tr>
                  <tr>
                    <th scope="col">썸네일</th>
                    <td><input type='file' style = 'text-align: right;' id="thumbnailFile" name="thumbnailFile"></td>
                  </tr>
                  <tr>
                    <th scope="col">이미지</th>
                    <td id="file-list"><!--a href="#this" onclick="addFile()">+</a-->
                    <input type='file' style = 'text-align: right;' id="atcFileList" multiple="multiple" name="atcFileList"></td>
                  </tr>
                  <tr>
                    <th scope="col">설명</th>
                    <td><textarea id="content" name="content" rows = "5" cols="40"> </textarea></td>
                  </tr>
                </thead>
              </table>
              </form>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-primary" onclick = 'register();'>저장</button>
             <button type="button" class="btn btn-primary" onclick = 'update();'>수정</button>
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
           </div>
           
         </div>
       </div>
     </div><!-- End Vertically centered Modal-->
  <form id="hiddenform2">
  		<input type = 'hidden' id = 'ctCd2' name = 'upCtCd'>
  </form>
  <form id="hiddenform3">
  		<input type = 'hidden' id = 'ctCd3' name = 'upCtCd'>
  </form>
  <form id="hiddenform">
  		<input type = 'hidden' id = 'ctLevel' name = 'ctLevel'>
  </form>
  <form id="hform">
  		<input type = 'hidden' id = 'supplierCd' name = 'supplierCd'>
  </form>
  <form id="detailform">
  		<input type = 'hidden' id = 'gCd' name = 'goodsCd'>
  </form>
<script>
	// 파일 추가
	function addFile() {
    	var str = "<input type=\'file\' style = \'text-align: right;\' id=\"atcFileList\" name=\"atcFileList\">";
    	$("#file-list").append(str);
    	/*
    	$("a[name='file-delete']").on("click", function(e) {
        	e.preventDefault();
        	deleteFile($(this));
    	});
    	*/
	}

	//상품 등록
	function insert(){
		$('#goodsform')[0].reset();
		$('#goodsInfo').modal('show');
	}
	function register(){
		if($('#3dtl').val() != ''){
			cd = $('#3dtl').val();
			$('#ctCd1').val(cd);
		}else if($('#3dtl').val() == '' && $('#2dtl').val() != ''){
			cd = $('#2dtl').val();
			$('#ctCd1').val(cd);
		}else if($('#2dtl').val() == '' && $('#1dtl').val() != ''){
			cd = $('#1dtl').val();
			$('#ctCd1').val(cd);
		}
		call_server(goodsform, '/goods/insertGoods', insertGoods);
		imgcall_server(form_file, '/goods/insertGoods', insertGoods);
	}
	function insertGoods(cnt){
		if(cnt>0){
			alert("등록완료!");
			$('#goodsInfo').modal('hide');
			search();
		}else{
			alert("등록실패!");
		}
	}
	//상품 수정
	function update(){
		if($('#3dtl').val() != ''){
			cd = $('#3dtl').val();
			$('#ctCd1').val(cd);
		}else if($('#3dtl').val() == '' && $('#2dtl').val() != ''){
			cd = $('#2dtl').val();
			$('#ctCd1').val(cd);
		}else if($('#2dtl').val() == '' && $('#1dtl').val() != ''){
			cd = $('#1dtl').val();
			$('#ctCd1').val(cd);
		}
		call_server(goodsform, '/goods/updateGoods', updateGoods);
	}
	function updateGoods(cnt){
		if(cnt>0){
			alert("수정완료!");
			$('#goodsInfo').modal('hide');
			search();
		}else{
			alert("수정실패!");
		}
	}
	//상품 조회
	function goodsSearch(no){
		$('#currentPage').val(no);
		var cd;
		if($('#3').val() != ''){
			cd = $('#3').val();
			$('#ctCd').val(cd);
		}else if($('#3').val() == '' && $('#2').val() != ''){
			cd = $('#2').val();
			$('#ctCd').val(cd);
		}else if($('#2').val() == '' && $('#1').val() != ''){
			cd = $('#1').val();
			$('#ctCd').val(cd);
		}
		call_server(searchform, "/goods/getGoodsList", getGoodsList);
	}
	function getGoodsList(vo){
		list = vo.goodsList;
		$('#tbody').empty();
		for(var i = 0; i < list.length; i++){
			str ="<tr onclick=\"goodsDetail('"+list[i].goodsCd+"');\" style=\"cursor:pointer;\">";
			str +="<th scope=\"row\">"+((Number(vo.currentPage)-1)*vo.countPerPage+(i+1))+"</th>";
			str += "<td>"+list[i].goodsCd+"</td>";
			str += "<td>"+list[i].goodsName+"</td>";
			str += "<td>"+list[i].ctName+"</td>";
			str += "<td>"+list[i].sellPrice+"</td>";
			str += "<td>"+list[i].ivQty+"</td>";
			str += "<td>"+list[i].regDt+"</td>";
			str += "<td>"+list[i].goodsStatus+"</td>";
			str += "</tr>";
			$('#tbody').append(str);
		}
		setPaging(goodsPaging, vo.startPage, vo.endPage, 'goodsSearch');
	}

	//상품 상세조회
	function goodsDetail(cd){
		$('#gCd').val(cd);
		call_server(detailform, '/goods/getGoodsDtl', getGoodsDtl);
	}
	function getGoodsDtl(vo){
		$('#goodsform')[0].reset();
		$('#goodsCd').val(vo.goodsCd);
		$('#goodsName1').val(vo.goodsName);
		$('#normalPrice').val(vo.normalPrice);
		$('#sellPrice').val(vo.sellPrice);
		$('#ivQty').val(vo.ivQty);
		$('#image').val(vo.image);
		$('#content').val(vo.content);
		$('#goodsStatus').val(vo.goodsStatus);
		$('#supplierCd1').val(vo.supplierCd);		
		$('#goodsInfo').modal('show');
	}

	
	
	// 거래처 콤보박스
	$(function(){
		call_server(hform, "/sup/getSupNameList", getSupNameList);
	});
	function getSupNameList(list){
		var str;
		for(var i = 0; i < list.length; i++){
			str += "<option value="+list[i].supplierCd+">"+list[i].supplierName+"</option>";
		}
		$('#supplierCd').append(str);
		$('#supplierCd1').append(str);
	}

//대분류 콤보박스
$(function(ctLevel){
	$('#ctLevel').val('1');
	call_server(hiddenform, "/goods/getCategory", getCategory);
});
function getCategory(list){
	var str;
	for(var i = 0; i < list.length; i++){
		str += "<option value="+list[i].ctCd+">"+list[i].ctName+"</option>"
	}
	$('#1').append(str);
	$('#1dtl').append(str);
}

//중분류 콤보박스
function setCt1(obj){
	var upCtCd = $(obj).val();
	$('#ctCd2').val(upCtCd);
	call_server(hiddenform2, "/goods/getLevel2List", getLevel2Combo);
	var code = $(obj).val();
	$('#ctCd').val(code);
	call_server(hidden, "/goods/getName", getName);
}

function getLevel2Combo(list){
	$('#2').empty();
	$('#2dtl').empty();
	$('#2').append("<option value=''>=== 중분류 ===</option>");
	$('#2dtl').append("<option value=''>=== 중분류 ===</option>");
	for(var i = 0; i < list.length; i++){
		str = "<option value="+list[i].ctCd+">"+list[i].ctName+"</option>";
		$('#2').append(str);
		$('#2dtl').append(str);
	}
}

//소분류 콤보박스
function setCt2(obj){
	var upCtCd = $(obj).val();
	$('#ctCd3').val(upCtCd);
	call_server(hiddenform3, "/goods/getLevel3List", getLevel3Combo);
	var code = $(obj).val();
	$('#ctCd').val(code);
	call_server(hidden, "/goods/getName", getName);
}

function getLevel3Combo(list){
	$('#3').empty();
	$('#3dtl').empty();
	$('#3').append("<option value=''>=== 소분류 ===</option>");
	$('#3dtl').append("<option value=''>=== 소분류 ===</option>");
	for(var i = 0; i < list.length; i++){
		str = "<option value="+list[i].ctCd+">"+list[i].ctName+"</option>";
		$('#3').append(str);
		$('#3dtl').append(str);
	}
}

</script>
<script src="/assets/js/paging.js"></script>