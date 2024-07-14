<% String Header="Report List" ; %>
                <% String dHeader="Report" ; %>
                    <%@ include file="StaffHeader.jsp" %>
            <div class="breadcrumb">
                <a href="StaffreportSL.jsp">Report</a> / <a href="#" class="active">Report List</a>
            </div>

            <div class="content">
                <h1>Report List</h1>
                <%
                    int rowsPerPage = 10; 
                    int currentPage = 1; 
                    String pageParam = request.getParameter("page");
                    
                    if (pageParam != null) {
                        try {
                            currentPage = Integer.parseInt(pageParam);
                        } catch (NumberFormatException e) {
                            currentPage = 1; 
                        }
                    }
                    int offset = (currentPage - 1) * rowsPerPage;
                 %>
                
                <sql:query var="report_list" dataSource="${myDatasource}">
                    SELECT reportID, reportTitle, reportStatus 
                    FROM REPORT 
                    ORDER BY reportID 
                    OFFSET <%= offset %> ROWS 
                    FETCH NEXT <%= rowsPerPage %> ROWS ONLY
                </sql:query>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Report ID</th>
                                <th>Title</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${empty report_list.rows}">
                                    <tr><td colspan="4">No reports available.</td></tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="row" items="${report_list.rows}">
                                        <tr>
                                            <td><c:out value="${row.reportID}"/></td>
                                            <td><c:out value="${row.reportTitle}"/></td>
                                            <td><c:out value="${row.reportStatus}"/></td>
                                            <td class="actions">
                                                <form action="StaffreportSLV.jsp" method="get" style="display:inline;">
                                                    <input type="hidden" name="reportID" value="${row.reportID}"/>
                                                    <button type="submit" class="view-button">View</button>
                                                </form>
                                                <form action="StaffreportSLU.jsp" method="get" style="display:inline;">
                                                    <input type="hidden" name="reportID" value="${row.reportID}"/>
                                                    <button type="submit" class="view-button">Update</button>
                                                </form>
                                                <form action="DeleteReportServlet" method="post" style="display:inline;">
                                                    <input type="hidden" name="reportID" value="${row.reportID}"/>
                                                    <button type="submit" class="view-button">Delete</button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>

                    <c:if test="${sessionScope.createResult != null}">
                        <div id="alert-box" class="alert-box show">
                            <c:choose>
                                <c:when test="${sessionScope.createResult}">
                                    Report created successfully!
                                </c:when>
                                <c:otherwise>
                                    Report creation failed: <c:out value="${sessionScope.createMessage}" />
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <%
                            session.removeAttribute("createResult");
                            session.removeAttribute("createMessage");
                        %>
                    </c:if>

                    <c:if test="${sessionScope.deleteResult != null}">
                        <div id="alert-box" class="alert-box show">
                            <c:choose>
                                <c:when test="${sessionScope.deleteResult}">
                                    Report deleted successfully!
                                </c:when>
                                <c:otherwise>
                                    Report deletion failed: <c:out value="${sessionScope.deleteMessage}" />
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <%
                            session.removeAttribute("deleteResult");
                            session.removeAttribute("deleteMessage");
                        %>
                    </c:if>

                    <c:if test="${sessionScope.updateResult != null}">
                        <div id="alert-box" class="alert-box show">
                            <c:choose>
                                <c:when test="${sessionScope.updateResult}">
                                    Report updated successfully!
                                </c:when>
                                <c:otherwise>
                                    Report update failed: <c:out value="${sessionScope.updateMessage}" />
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <%
                            session.removeAttribute("updateResult");
                            session.removeAttribute("updateMessage");
                        %>
                    </c:if>

                    <div class="pagination-container">
                        <form action="StaffreportSL.jsp" method="get" style="display:inline;">
                            <input type="hidden" name="page" value="<%= currentPage > 1 ? currentPage - 1 : 1 %>" />
                            <button type="submit" class="pagination-button">Prev</button>
                        </form>
                        <span>Page <%= currentPage %></span>
                        <form action="StaffreportSL.jsp" method="get" style="display:inline;">
                            <input type="hidden" name="page" value="<%= currentPage + 1 %>" />
                            <button type="submit" class="pagination-button">Next</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        const alertBox = document.getElementById('alert-box');
        
        if (alertBox) {
            setTimeout(() => {
                alertBox.classList.remove('show');
            }, 3000);
        }
    </script>
</body>
</html>
