<%@ page import="com.keduit.domain.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp" %>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">게시판</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                헤더
                <button id="regBtn" type="button" class="btn btn-primary btn-xs pull-right">게시글 등록</button>
                <%--                <button id="regBtn" type="button" class="btn btn-primary btn-xl pull-right" onclick="location.href='register'">게시글 등록</button>--%>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <table width="100%" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>No</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>등록일</th>
                        <th>갱신일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%--&lt;%&ndash;                            <% List<BoardVO> boardList = (List<BoardVO>) request.getAttribute("list");&ndash;%&gt;--%>
                    <%--&lt;%&ndash;                                for (BoardVO board : boardList) {&ndash;%&gt;--%>
                    <%--&lt;%&ndash;                            %>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;                            <tr>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;                                <td><%= board.getBno() %></td>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;                                <td><%= board.getTitle() %></td>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;                                <td><%= board.getWriter() %></td>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;                                <td><%= board.getRegdate() %></td>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;                                <td><%= board.getUpdatedate() %></td>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;                            </tr>&ndash;%&gt;--%>
                    <%--                            <%--%>
                    <%--                                }--%>
                    <%--                            %>--%>
                    <c:forEach items="${list}" var="board">
                        <tr>
                            <td><c:out value="${board.bno}"/></td>
                            <td><a href="${board.bno}" class="move"><c:out value="${board.title}"/></a></td>
                                <%--                            <td><a href="/board/read?bno=${board.bno}&pageNum=${cri.pageNum}&amount=${cri.amount}"><c:out value="${board.title}"/></a></td>--%>
                            <td><c:out value="${board.writer}"/></td>
                            <td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td><fmt:formatDate value="${board.updatedate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-lg-12">
                        <form class="form-inline mt-3" id="searchForm" action="/board/list" method="get">
                            <select name="type" class="form-control form-select-lg mb-3 " aria-label="Default select example">
<%--                                <option selected value="">검색 조건</option>--%>
                                <option value="T"
                                        <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}"/>
                                >제목</option>
                                <option value="C"
                                        <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}"/>
                                >내용</option>
                                <option value="W"
                                        <c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : ''}"/>
                                >글쓴이</option>
                                <option value="TC"
                                        <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : ''}"/>
                                >제목 + 내용</option>
                                <option value="TW"
                                        <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected' : ''}"/>
                                >제목 + 글쓴이</option>
                                <option value="TWC"
                                        <c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected' : ''}"/>
                                >전체</option>
                            </select>
                            <input name="keyword" class="form-control mr-sm-2" type="search"
                                   value="${pageMaker.cri.keyword}"
                                   placeholder="검색" aria-label="Search">
                            <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                            <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                            <button class="btn btn-outline-success my-2 my-sm-0">검색</button>
                        </form>
                    </div>
                </div>
                <div class="mx-auto">
                    <ul class="pagination">
                        <c:if test="${pageMaker.prev}">
                            <li class="paginate_button previous">
                                <a href="${pageMaker.startPage -1}">Previous</a>
                            </li>
                        </c:if>
                        <c:forEach var="num"
                                   begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                            <li class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : ""}"><a
                                    href="${num}">${num}</a></li>
                        </c:forEach>
                        <c:if test="${pageMaker.next}">
                            <li class="paginate_button next">
                                <a href="${pageMaker.endPage+1}">next</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
                <form id="actionForm" action="/board/list" method="get">
                    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                    <input type="hidden" name="type" value="${pageMaker.cri.type}">
                    <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                </form>
                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
                                </button>
                                <h4 class="modal-title" id="myModalLabel"></h4>
                            </div>
                            <div class="modal-body">
                                쳐리가 완료되었습니다.
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>

<script type="text/javascript">
    $(document).ready(function () {
        const result = '<c:out value="${result}"/>'
        checkModal(result);
        history.replaceState({}, null, null);

        function checkModal(result) {
            if (result === '' || history.state) {
                console.log("checkModal cancle");
                return;
            }
            if (parseInt(result) > 0) {
                console.log("checkModal accept");
                $(".modal-body").html("게시글 " + parseInt(result) + "번이 등록됨")
            }
            $("#myModal").modal("show");
        }


        $("#regBtn").click(function () {
            self.location = "register";
        })

    })
    const actionForm = $("#actionForm");
    $(".paginate_button a").on("click", function (e) {
        e.preventDefault();
        console.log("actionForm============================ : ");
        actionForm.find("input[name='pageNum']").val($(this).attr("href"));
        actionForm.attr("action", "/board/list");
        actionForm.submit();
    });

    $(".move").on("click", function (e) {
        e.preventDefault();
        actionForm.find("input[name='bno']").remove()
        actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
        actionForm.attr("action", "/board/read");
        actionForm.submit();
    });

    const searchForm = $("#searchForm");
    $("#searchForm button").on("click", function (e){
        // if(!searchForm.find("option:selected").val()){
        //     alert("검색 종류를 선택해야함");
        //     e.preventDefault();
        //     return false;
        // }

        if(!searchForm.find("input[name='keyword']").val()){
            alert("검색할 키워드를 입력해주세요")
            e.preventDefault();
            return false;
        }
        searchForm.find("input[name='pageNum]").val(1);
        searchForm.submit();
    })


</script>
<!-- /.row -->
<%@include file="../includes/footer.jsp" %>