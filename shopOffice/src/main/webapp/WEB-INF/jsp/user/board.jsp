<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <title>회원문의</title>
  
  <main id="main" class="main">

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body" style="padding-top: 20px;">
              <!-- General Form Elements -->
              <form id="searchform">
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
		                  <label for="inputText" class="col-sm-1 col-form-label">답변여부</label>
		                  <div class="col-sm-2">
		                    <select name="replyYn" >
   								<option value=>=== 선택 ===</option>
   								<option value="Y">Y</option>
    							<option value="N">N</option>
    						</select>
		                  </div>
		                </div>		
              		</td>
              		<td rowspan="2">
              			<button type="button" class="btn btn-info" onclick = 'search(1);'>조회</button>
              		</td>
              	</tr>
              	<tr>
              		<td>
              			<div class="row mb-3">
		                  <label for="inputDate" class="col-sm-1 col-form-label">등록일</label>
		                  <div class="col-sm-2">
		                    <input type="date" class="form-control" id="regDtFrom" name="regDtFrom">
		                  </div>
		                  ~
		                  <div class="col-sm-2">
		                    <input type="date" class="form-control" id="regDtTo" name="regDtTo">
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
                    <th scope="col">문의유형</th>
                    <th scope="col">회원ID</th>
                    <th scope="col">회원명</th>
                    <th scope="col">제목</th>
                    <th scope="col">문의 등록일</th>
                    <th scope="col">답변여부</th>
                    <th scope="col">답변등록일</th>
                  </tr>
                </thead>
                <tbody id="tbody" >
                
                </tbody>
              </table>
              <!-- End Table with hoverable rows -->
			  <nav aria-label="Page navigation example">
                <ul class="pagination" id="boardPaging">
                </ul>
              </nav><!-- End Pagination with icons -->
			   	
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>

 <div class="modal fade" id="boardInfo" tabindex="-1">
       <div class="modal-dialog modal-xl modal-dialog-centered">
         <div class="modal-content">
           <div class="modal-header">
           	
             <h5 class="modal-title">고객문의</h5>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
           </div>
           <div class="modal-body">
           <form id="replyform" name="replyform">
           	<input type='hidden' id='val1' name="userId">
           	<input type='hidden' id='val2' name="boardSeq">
             <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">제목</th>
                    <td scope="col" id="title"></td>
                  </tr>
                  <tr>
                    <th scope="col">유형</th>
                    <td scope="col" id="boardType"></td>
                  </tr>
                  <tr>
                    <th scope="col">회원ID/명</th>
                    <td scope="col" id="userId1"></td>
                  </tr>
                  <tr>
                    <th scope="col">문의일</th>
                    <td scope="col" id="regDt"></td>
                  </tr>
                  <tr>
                    <th scope="col">첨부파일</th>
                    <td scope="col" id="attchFile"></td>
                  </tr>
                  <tr>
                    <th scope="col">문의내용</th>
                    <td scope="col" id="content"></td>
                  </tr>
                  <tr>
                    <th scope="col">답변내용</th>
                    <td><textarea id="replyContent" name="replyContent" rows = "5" cols="40"> </textarea></td>
                  </tr>
                  
                </thead>
              </table>
              </form>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-primary" onclick = 'reply();'>답변등록</button>
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
           </div>
           
         </div>
       </div>
     </div><!-- End Vertically centered Modal-->
    <form id="hiddenform">
  		<input type = 'hidden' id = 'boardSeq' name = 'boardSeq'>
  		<input type = 'hidden' id = 'userId' name = 'userId'>
  </form>
<script>

	function reply(){
		call_server(replyform, '/user/reply', getReply);
		
	}
	
	function getReply(cnt){
		if(cnt>0){
			alert("답변등록완료!");
			//. modal. 닫고.
			// search실행.
			$('#boardInfo').modal('hide');
			search();
		}else{
			alert("답변등록실패!");
		}
	}


	function search(no){
		$('#currentPage').val(no);
		call_server(searchform, '/user/getBoardList', getBoardList);
	}
    function getBoardList(vo){
    	list = vo.boardList;
    	$('#tbody').empty();
    		for(var i=0; i<list.length; i++){
    			str = "<tr onclick=\"boardDetail('"+list[i].userId+"','"+list[i].boardSeq+"');\" style=\"cursor:pointer;\">";
    			str += "<th scope=\"row\">"+((Number(vo.currentPage)-1)*vo.countPerPage+(i+1))+"</th>";
				str += "<td>"+list[i].boardSeq+"</td>";
				str += "<td>"+list[i].boardType+"</td>";
				str += "<td>"+list[i].userId+"</td>";
				str += "<td>"+list[i].userName+"</td>";
				str += "<td>"+list[i].title+"</td>";
				str += "<td>"+list[i].regDt+"</td>";
				str += "<td>"+list[i].replyYn+"</td>";
				if(list[i].replyDt == null){
					str += "<td>"+"-"+"</td>";
				}else{
					str += "<td>"+list[i].replyDt+"</td>";
				}
				str += "</tr>";
				$('#tbody').append(str);
	    	}
    		setPaging(boardPaging, vo.startPage, vo.endPage, 'search');
	}
	function boardDetail(id,Seq){
		//$('#boardInfo').modal('show');
		$('#boardSeq').val(Seq);
		$('#userId').val(id);
		call_server(hiddenform, '/user/getBoardDtl', getBoardDtl);
	}
	function getBoardDtl(vo){
		$('#val1').val(vo.userId);
		$('#val2').val(vo.boardSeq);
		$('#title').text(vo.title);
		$('#boardType').text(vo.boardType);
		$('#userId1').text(vo.userId+"/"+vo.userName);
		$('#regDt').text(vo.regDt);
		$('#attchFile').text(vo.attchFile);
		$('#content').text(vo.content);
		$('#replyContent').val(vo.replyContent);
		$('#boardInfo').modal('show');
	
	}
</script>
<script src="/assets/js/paging.js"></script>