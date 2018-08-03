<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

    <!--  화면구성 div Start /////////////////////////////////////-->
		<div class="tab-pane fade active show" id="user-settings" style="width: 1100px; height: 680px;">
              <div class="tile user-settings">
                <h4 class="line-head">
                 <i class="fa fa-pencil-square-o"></i>
                 공지사항 등록</h4>
                <form enctype="multipart/form-data">
                
                    <div class="row mb-8">
                    <div class="col-md-8">
                      <label>&nbsp;&nbsp;&nbsp;</label>
                      <input class="form-control" type="text" id="boardTitle"
						name="boardTitle" placeholder="Title">
                    </div>
                    </div>
                    
                     <div class="row mb-8">
                    <div class="col-md-8">
                      <label>&nbsp;&nbsp;&nbsp;</label>
                      <textarea class="form-control" type="text" id="boardContent"
						name="boardContent" ></textarea>
                    </div>
                    </div>
                    
                  <div class="row mb-10">
                    <div class="col-md-12">
                      <button class="btn btn-primary" type="button" style="margin-top: 10px;"><i class="fa fa-fw fa-lg fa-check-circle"></i>제출</button>
                    
                    </div>
                  </div>
			
		</form>
		<!-- form End /////////////////////////////////////-->
		</div>
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
