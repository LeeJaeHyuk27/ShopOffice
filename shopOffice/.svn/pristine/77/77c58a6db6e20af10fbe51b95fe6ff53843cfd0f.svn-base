<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  
  <main id="main" class="main">

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
		  <div class="card">
            <div class="card-body">
              <!-- Table with hoverable rows -->
              <table class="table table-hover" style="width:33%; float:left;" >
                <thead>
                  <tr style = 'text-align: center;'>
                    <th colspan='2' scope="col">대분류</th>
                  </tr>
                  <tr style = 'text-align: center;'>
                  	<td>대분류코드</td>
                  	<td>대분류명</td>
                  </tr>
                </thead>
                <tbody id="level1" >
                </tbody>
              </table>
              <table class="table table-hover" style="width:33%; float:left;">
              	<thead>
                  <tr style = 'text-align: center;'>
                    <th colspan='2' scope="col">중분류</th>
                  </tr>
                  <tr style = 'text-align: center;'>
                  	<td>중분류코드</td>
                  	<td>분류명</td>
                  </tr>
                 </thead>
                 <tbody id="level2" >
                </tbody>
              </table>
              <table class="table table-hover" style="width:33%; float:left;">
              	<thead>
                  <tr style = 'text-align: center;'>
                    <th colspan='2' scope="col">소분류</th>
                  </tr>
                  <tr style = 'text-align: center;'>
                  	<td>소분류코드</td>
                  	<td>분류명</td>
                  </tr>
                 </thead>
                 <tbody id="level3" >
                </tbody>
              </table>
            </div>
          </div>
          <div class="card">
            <div class="card-body" style="padding-top: 20px;">
              <!-- General Form Elements -->
              <form id="searchform">
              <input type='hidden' id='hctCd' name='ctCd'>
              <input type='hidden' id='ctLevel1' name='ctLevel'>
              <table class="col-lg-12" >
              	<tr>
              		<td><strong>카테고리 선택</strong></td>
              	</tr>
              	<tr>
    				<td style="padding: 0;">
        				<div class="row mb-4">
            				<div class="col-sm-2">
               					 <select id="1" name="1" onchange="setCt1(this)">
                    				<option value="">=== 대분류 선택 ===</option>
               					 </select>
            				</div>
            			<div class="col-sm-2">
                			<select id="2" name="2" onchange="setCt2(this)">
                    			<option value="">=== 중분류 선택 ===</option>
                			</select>
            			</div>
            			<div class="col-sm-2">
               				 <select id="3" name="3" onchange="appear(this)">
                    			<option value="">=== 소분류 선택 ===</option>
                			</select>
            			</div>
        			 </div>
    			   </td>
				</tr>
				<tr>
					<td>카테고리명
						<input type = 'text' id = 'insert' name = 'ctName'>
						<button type="button" class="btn btn-info" onclick='insert1();'>등록</button>
						<button type="button" class="btn btn-info" onclick='update();'>수정</button>
					</td>
				</tr>
              </table>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
  <form id="hiddenform1">
  		<input type = 'hidden' id = 'ctCd1' name = 'upCtCd'>
  </form>
  <form id="hiddenform2">
  		<input type = 'hidden' id = 'ctCd2' name = 'upCtCd'>
  </form>
  <form id="hiddenform3">
  		<input type = 'hidden' id = 'ctCd3' name = 'upCtCd'>
  </form>
  <form id="hiddenform">
  		<input type = 'hidden' id = 'ctLevel' name = 'ctLevel'>
  </form>
  <form id="hidden">
  		<input type = 'hidden' id = 'ctCd' name = 'ctCd'>
  </form>
<script>

	//카테고리 추가
	function insert1(){
		if($('#3').val()!=''){
			$('#hctCd').val($('#3').val());
		}else if($('#2').val()!=''){
			$('#hctCd').val($('#2').val());
			$('#ctLevel1').val(3);
		}else if($('#1').val()!=''){
			$('#hctCd').val($('#1').val());
			$('#ctLevel1').val(2);
		}else{
			$('#hctCd').val('');
			$('#ctLevel1').val(1);
		}
		call_server(searchform, "/goods/insertCt", insertCt);
	}
	function insertCt(cnt){
		if(cnt>0){
			alert("등록완료!");
			search();
		}else{
			alert("등록실패!");
		}
	}
	//카테고리 이름 변경하기
	function update(){
		if($('#3').val()!=''){
			$('#hctCd').val($('#3').val());
		}else if($('#2').val()!=''){
			$('#hctCd').val($('#2').val());
		}else if($('#1').val()!=''){
			$('#hctCd').val($('#1').val());
		}
		call_server(searchform, "/goods/updateCtName", updateCtName);
	}
	function updateCtName(cnt){
		if(cnt>0){
			alert("수정완료!");
			search();
		}else{
			alert("수정실패!");
		}
	}

	//카테고리 이름 불러오기
	function appear(obj){
		var code = $(obj).val();
		$('#ctCd').val(code);
		call_server(hidden, "/goods/getName", getName);
	}
	function getName(vo){
		$('#insert').val(vo.ctName);
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
		$('#2').append("<option value=''>=== 중분류 선택 ===</option>");
		for(var i = 0; i < list.length; i++){
			str = "<option value="+list[i].ctCd+">"+list[i].ctName+"</option>";
			$('#2').append(str);
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
		$('#3').append("<option value=''>=== 소분류 선택 ===</option>");
		for(var i = 0; i < list.length; i++){
			str = "<option value="+list[i].ctCd+">"+list[i].ctName+"</option>";
			$('#3').append(str);
		}
	}


	//대분류 띄우기
	$(function(){
		call_server(hiddenform1, "/goods/getLevel1List", getLevel1List);
	});
	function getLevel1List(list){
		for(var i = 0; i < list.length; i++){
			str = "<tr onclick=\"getLevel2('"+list[i].ctCd+"');\" style=\"cursor:pointer;\">";
			str += "<td>"+list[i].ctCd+"</td>";
			str += "<td>"+list[i].ctName+"</td>";
			str += "</tr>";
			$('#level1').append(str);
		}
	}
	//중분류 띄우기
	function getLevel2(ctCd){
		$('#ctCd2').val(ctCd);
		call_server(hiddenform2, "/goods/getLevel2List", getLevel2List);
	};
	function getLevel2List(list){
		$('#level2').empty();
		$('#level3').empty();
		for(var i = 0; i < list.length; i++){
			str = "<tr onclick=\"getLevel3('"+list[i].ctCd+"');\" style=\"cursor:pointer;\">";
			str += "<td>"+list[i].ctCd+"</td>";
			str += "<td>"+list[i].ctName+"</td>";
			str += "</tr>";
			$('#level2').append(str);
		}
	}
	//소분류 띄우기
	function getLevel3(ctCd){
		$('#ctCd3').val(ctCd);
		call_server(hiddenform3, "/goods/getLevel3List", getLevel3List);
	};
	function getLevel3List(list){
		$('#level3').empty();
		for(var i = 0; i < list.length; i++){
			str = "<tr>";
			str += "<td>"+list[i].ctCd+"</td>";
			str += "<td>"+list[i].ctName+"</td>";
			str += "</tr>";
			$('#level3').append(str);
		}
	}

	
</script>