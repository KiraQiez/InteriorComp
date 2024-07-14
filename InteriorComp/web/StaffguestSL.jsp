
            <% String Header="Student List" ; %>
                <% String dHeader="Student" ; %>
                    <%@ include file="StaffHeader.jsp" %>
                        <sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver"
                            url="jdbc:derby://localhost:1527/InteriorDB" user="root" password="root" />
                        <div class="breadcrumb">
                            <a href="StaffguestS.jsp">Guest</a> / <a href="#" class="active">Guest List</a>
                        </div>

                        <div class="content">
                            <h1>Guest List</h1>
                            <% int rowsPerPage=10; int currentPage=1; String pageParam=request.getParameter("page"); if
                                (pageParam !=null) { try { currentPage=Integer.parseInt(pageParam); } catch
                                (NumberFormatException e) { currentPage=1; } } int offset=(currentPage - 1) *
                                rowsPerPage; %>

                                <sql:query var="student_list" dataSource="${myDatasource}">
                                    SELECT s.stdID, s.stdName, s.stdIC, s.stdPhone, s.stdIncome, b.roomID
                                    FROM STUDENT s
                                    LEFT JOIN BOOKING b ON s.stdID = b.stdID
                                    ORDER BY s.stdID
                                    OFFSET <%= offset %> ROWS
                                        FETCH NEXT <%= rowsPerPage %> ROWS ONLY
                                </sql:query>

                                <div class="table-container">
                                
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>IC</th>
                                                <th>Phone No</th>
                                                <th>Room ID</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:choose>
                                                <c:when test="${empty student_list.rows}">
                                                    <tr>
                                                        <td colspan="7">No data available.</td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach var="row" items="${student_list.rows}">
                                                        <tr>
                                                            <td>
                                                                <c:out value="${row.stdID}" />
                                                            </td>
                                                            <td>
                                                                <c:out value="${row.stdName}" />
                                                            </td>
                                                            <td>
                                                                <c:out value="${row.stdIC}" />
                                                            </td>
                                                            <td>
                                                                <c:out value="${row.stdPhone}" />
                                                            </td>
                                                            <td>
                                                                <c:out
                                                                    value="${row.roomID != null ? row.roomID : 'No Data'}" />
                                                            </td>
                                                            <td class="actions">
                                                                <form action="StaffguestDetails.jsp" method="get"
                                                                    style="display:inline;">
                                                                    <input type="hidden" name="stdID"
                                                                        value="${row.stdID}" />
                                                                    <button type="submit"
                                                                        class="view-button">View</button>
                                                                </form>
                                                                <form action="StaffguestSLU.jsp" method="get"
                                                                    style="display:inline;">
                                                                    <input type="hidden" name="stdID"
                                                                        value="${row.stdID}" />
                                                                    <button type="submit"
                                                                        class="view-button">Update</button>
                                                                </form>
                                                                <form action="DeleteGuestServlet" method="post"
                                                                    style="display:inline;">
                                                                    <input type="hidden" name="stdID"
                                                                        value="${row.stdID}" />
                                                                    <button type="submit"
                                                                        class="view-button">Delete</button>
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
                                                    Guest created successfully!
                                                </c:when>
                                                <c:otherwise>
                                                    Guest creation failed:
                                                    <c:out value="${sessionScope.createMessage}" />
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <% session.removeAttribute("createResult");
                                            session.removeAttribute("createMessage"); %>
                                    </c:if>

                                    <c:if test="${sessionScope.deleteResult != null}">
                                        <div id="alert-box" class="alert-box show">
                                            <c:choose>
                                                <c:when test="${sessionScope.deleteResult}">
                                                    Guest deleted successfully!
                                                </c:when>
                                                <c:otherwise>
                                                    Guest deletion failed:
                                                    <c:out value="${sessionScope.deleteMessage}" />
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <% session.removeAttribute("deleteResult");
                                            session.removeAttribute("deleteMessage"); %>
                                    </c:if>

                                    <c:if test="${sessionScope.updateResult != null}">
                                        <div id="alert-box" class="alert-box show">
                                            <c:choose>
                                                <c:when test="${sessionScope.updateResult}">
                                                    Guest updated successfully!
                                                </c:when>
                                                <c:otherwise>
                                                    Guest update failed:
                                                    <c:out value="${sessionScope.updateMessage}" />
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <% session.removeAttribute("updateResult");
                                            session.removeAttribute("updateMessage"); %>
                                    </c:if>

                                    <div class="pagination-container">
                                        <form action="StaffguestSL.jsp" method="get" style="display:inline;">
                                            <input type="hidden" name="page"
                                                value="<%= currentPage > 1 ? currentPage - 1 : 1 %>" />
                                            <button type="submit" class="pagination-button">Prev</button>
                                        </form>
                                        <span>Page <%= currentPage %></span>
                                        <form action="StaffguestSL.jsp" method="get" style="display:inline;">
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