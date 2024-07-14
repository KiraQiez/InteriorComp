
<<% String Header="Staff List"; %>
<% String dHeader="Staff"; %>
<%@ include file="StaffHeader.jsp" %>
    <div class="breadcrumb">
        <a href="StaffstaffS.jsp">Staff</a> / <a href="#" class="active">Staff List</a>
    </div>

    <div class="content">
        <h1>Staff List</h1>
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
        
        <sql:query var="staff_list" dataSource="${myDatasource}">
            SELECT * FROM STAFF 
            ORDER BY staffID 
            OFFSET <%= offset %> ROWS 
            FETCH NEXT <%= rowsPerPage %> ROWS ONLY
        </sql:query>

        <div class="table-container">
            <div class="header-actions">
                <form action="StaffstaffSLC.jsp" method="get" style="display:inline;">
                    <button class="action-button">Create Staff</button>
                </form>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Staff ID</th>
                        <th>Name</th>
                        <th>Type</th>
                        <th>Age</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty staff_list.rows}">
                            <tr><td colspan="5">No staff available.</td></tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="row" items="${staff_list.rows}">
                                <tr>
                                    <td><c:out value="${row.staffID}"/></td>
                                    <td><c:out value="${row.staffName}"/></td>
                                    <td><c:out value="${row.staffType}"/></td>
                                    <td><c:out value="${row.staffAge}"/></td>
                                    <td class="actions">
                                        <form action="StaffDetails.jsp" method="get" style="display:inline;">
                                            <input type="hidden" name="staffID" value="${row.staffID}"/>
                                            <button type="submit" class="view-button">View</button>
                                        </form>
                                        <form action="StaffUpdate.jsp" method="get" style="display:inline;">
                                            <input type="hidden" name="staffID" value="${row.staffID}"/>
                                            <button type="submit" class="view-button">Update</button>
                                        </form>
                                        <form action="DeleteStaffServlet" method="post" style="display:inline;">
                                            <input type="hidden" name="staffID" value="${row.staffID}"/>
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
                            Staff created successfully!
                        </c:when>
                        <c:otherwise>
                            Staff creation failed: <c:out value="${sessionScope.createMessage}" />
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
                            Staff deleted successfully!
                        </c:when>
                        <c:otherwise>
                            Staff deletion failed: <c:out value="${sessionScope.deleteMessage}" />
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
                            Staff updated successfully!
                        </c:when>
                        <c:otherwise>
                            Staff update failed: <c:out value="${sessionScope.updateMessage}" />
                        </c:otherwise>
                    </c:choose>
                </div>
                <%
                    session.removeAttribute("updateResult");
                    session.removeAttribute("updateMessage");
                %>
            </c:if>

            <div class="pagination-container">
                <form action="StaffList.jsp" method="get" style="display:inline;">
                    <input type="hidden" name="page" value="<%= currentPage > 1 ? currentPage - 1 : 1 %>" />
                    <button type="submit" class="pagination-button">Prev</button>
                </form>
                <span>Page <%= currentPage %></span>
                <form action="StaffList.jsp" method="get" style="display:inline;">
                    <input type="hidden" name="page" value="<%= currentPage + 1 %>" />
                    <button type="submit" class="pagination-button">Next</button>
                </form>
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
