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
<%@include file="../includes/header.jsp"%>

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">글 작성</h1>
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
                                <form action="/board/register" method="post" accept-charset="UTF-8">
                                    <div class="form-group">
                                        <input class="form-control" placeholder="제목" name="title">
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="작성자" name="writer">
                                    </div>
                                    <div class="form-group">
                                        <label>내용</label>
                                        <textarea class="form-control" rows="10" name="content"></textarea>
                                    </div>
                                    <button type="submit" class="btn btn-default">작성</button>
                                    <button type="reset" class="btn btn-default">취소</button>
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

<%@include file="../includes/footer.jsp"%>
