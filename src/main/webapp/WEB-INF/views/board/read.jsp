<%--
  Created by IntelliJ IDEA.
  User: keduit
  Date: 2023-09-12
  Time: 오후 3:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../includes/header.jsp" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">글</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label>${board.bno}</label>
                            <input type="hidden" class="form-control" placeholder="번호" name="bno" value="${board.bno}" readonly>
                        </div>
                        <div class="form-group">
                            <label>${board.title}</label>
                            <input type="hidden" class="form-control" placeholder="제목" name="title" value="${board.title}" readonly>
                        </div>
                        <div class="form-group">
                            <label>${board.writer}</label>
                            <input type="hidden" class="form-control" placeholder="작성자" name="writer" value="${board.writer}"
                                   readonly>
                        </div>
                        <div class="form-group">
                            <label>내용</label>
                            <textarea class="form-control" rows="10" name="content" readonly>${board.content}</textarea>
                        </div>
                        <button data-oper="modify"
                                class="btn btn-default">수정
                        </button>
                        <button data-oper="list"
                                class="btn btn-info">목록
                        </button>

                        <form action="/board/modify" id="operform" method="get">
                            <input type="hidden" name="pageNum" value="${cri.pageNum}">
                            <input type="hidden" name="amount" value="${cri.amount}">
                            <input type="hidden" id="bno" name="bno" value="${board.bno}">
                            <input type="hidden" id="type" name="type" value="${cri.type}">
                            <input type="hidden" id="keyword" name="keyword" value="${cri.keyword}">
                        </form>
                    </div>
                    <!-- /.col-lg-6 (nested) -->
                </div>
                <!-- /.row (nested) -->
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<script type="text/javascript">
    $(document).ready(function (){
        const operForm = $("#operform");
        $("button[data-oper='modify']").on("click",function (e){
            operForm.attr("action", "/board/modify").submit();
        })
        $("button[data-oper='list']").on("click", function (e){
            operForm.find("#bno").remove();
            operForm.attr("action","/board/list").submit();
        })
    })
</script>

<%@include file="../includes/footer.jsp" %>
