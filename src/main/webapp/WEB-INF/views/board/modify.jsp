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
        <h1 class="page-header">수정</h1>
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
                        <form accept-charset="UTF-8">
                            <input type="hidden" name="pageNum" value="${cri.pageNum}">
                            <input type="hidden" name="amount" value="${cri.amount}">
                            <input type="hidden" name="type" value="${cri.type}">
                            <input type="hidden" name="keyword" value="${cri.keyword}">
                            <div class="form-group">
                                <label>글 번호</label>
                                <input class="form-control" name="bno" value="${board.bno}" readonly>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="등록일자" name="regdate"
                                       value="<fmt:formatDate value="${board.regdate}" pattern="yyyy/MM/dd HH:mm:ss"/>"
                                       readonly>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="수정일자" name="updatedate"
                                       value="<fmt:formatDate value="${board.updatedate}" pattern="yyyy/MM/dd HH:mm:ss"/>"
                                       readonly>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="제목" name="title" value="${board.title}">
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="작성자" name="writer" value="${board.writer}"
                                       readonly>
                            </div>
                            <div class="form-group">
                                <label>내용</label>
                                <textarea class="form-control" rows="10" name="content">${board.content}</textarea>
                            </div>
                            <button type="button" data-oper="modify" class="btn btn-default">작성</button>
                            <button type="button" data-oper="remove" class="btn btn-danger">삭제</button>
                            <button type="button" data-oper="list" class="btn btn-info">목록</button>
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
<script>
    $(document).ready(function () {
        const formObj = $("form");
        $('button').on('click', function (e) {
            e.preventDefault();
            const operation = $(this).data("oper");

            console.log(operation);

            switch (operation) {
                case "remove" :
                    formObj.attr("action", "/board/remove")
                        .attr("method", "Post");
                    break;
                case "modify" :
                    formObj.attr("action", "/board/modify")
                        .attr("method", "Post");
                    break;
                case "list" :
                    formObj.attr("action", "/board/list")
                        .attr("method", "Get");
                    //깊은복제
                    const pageNumTag = $("input[name='pageNum']").clone();
                    const amountTag = $("input[name='amout']").clone();
                    const typeTag = $("input[name='type']").clone();
                    const keywordTag = $("input[name='keyword']").clone();

                    formObj.empty();
                    formObj.append(pageNumTag);
                    formObj.append(amountTag);
                    formObj.append(typeTag);
                    formObj.append(keywordTag);
                    break;
            }

            formObj.submit();

        })
    });
</script>
<%@include file="../includes/footer.jsp" %>
