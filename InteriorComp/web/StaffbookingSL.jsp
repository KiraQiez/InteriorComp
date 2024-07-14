<% String Header="Booking List" ; %>
<% String dHeader="Booking" ; %>
<%@ include file="StaffHeader.jsp" %>
                <div class="breadcrumb">
                    <a href="StaffbookingS.jsp">Booking</a> / <a href="StaffbookingSL.jsp" class="active">Booking List</a>
                </div>

                <div class="content">
                    <h1>Booking</h1>
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

                    <sql:query var="book_list" dataSource="${myDatasource}">
                        SELECT * FROM BOOKING B JOIN SESSION S ON B.SESSIONID= S.SESSIONID WHERE BOOKSTATUS='PENDING'
                        ORDER BY BOOKINGID
                        OFFSET <%= offset%> ROWS 
                        FETCH NEXT <%= rowsPerPage%> ROWS ONLY
                    </sql:query>

                    <div class="table-container">
                        <div class="header-actions">
                            <form action="AcceptAllBooking" method="post" style="display:inline;">
                                <button class="action-button">Accept All Booking</button>
                            </form>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>Booking ID</th>
                                    <th>Booking Date</th>
                                    <th>Student ID</th>
                                    <th>Session</th>
                                    <th>Book Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${empty book_list.rows}">
                                        <tr><td colspan="6">No pending booking.</td></tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="row" items="${book_list.rows}">
                                            <tr>
                                                <td><c:out value="${row.bookingID}"/></td>
                                                <td><c:out value="${row.bookingDate}"/></td>
                                                <td><c:out value="${row.STDID}"/></td>
                                                <td><c:out value="${row.SESSIONNAME}"/></td>
                                                <td><c:out value="${row.BOOKSTATUS}"/></td>
                                                <td class="actions">
                                                    <form action="AcceptBookingServlet" method="get" style="display:inline;">
                                                        <input type="hidden" name="bookingID" value="${row.bookingID}"/>
                                                        <button type="submit" class="view-button">Accept</button>
                                                    </form>
                                                        
                                                    <form action="StaffBookingDetails.jsp" method="get" style="display:inline;">
                                                        <input type="hidden" name="bookingID" value="${row.bookingID}"/>
                                                        <button type="submit" class="view-button">View</button>
                                                    </form>
                                                    
                                                    <form action="RejectBookingServlet" method="get" style="display:inline;">
                                                        <input type="hidden" name="bookingID" value="${row.bookingID}"/>
                                                        <button type="submit" class="view-button">Reject</button>
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
                                        Room created successfully!
                                    </c:when>
                                    <c:otherwise>
                                        Room creation failed: <c:out value="${sessionScope.createMessage}" />
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <%
                                session.removeAttribute("createResult");
                                session.removeAttribute("createMessage");
                            %>
                        </c:if>

                        <c:if test="${sessionScope.acceptResult != null}">
                            <div id="alert-box" class="alert-box show">
                                <c:choose>
                                    <c:when test="${sessionScope.acceptResult}">
                                        Booking accepted successfully!
                                    </c:when>
                                    <c:otherwise>
                                        Booking fail to be accepted!: <c:out value="${sessionScope.acceptMessage}" />
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <%
                                session.removeAttribute("acceptResult");
                                session.removeAttribute("acceptMessage");
                            %>
                        </c:if>

                        <c:if test="${sessionScope.rejectResult != null}">
                            <div id="alert-box" class="alert-box show">
                                <c:choose>
                                    <c:when test="${sessionScope.rejectResult}">
                                        Booking rejected!
                                    </c:when>
                                    <c:otherwise>
                                        Booking rejection failed: <c:out value="${sessionScope.rejectMessage}" />
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <%
                                session.removeAttribute("rejectResult");
                                session.removeAttribute("rejectMessage");
                            %>
                        </c:if>

                        <div class="pagination-container">
                            <form action="StaffroomSL.jsp" method="get" style="display:inline;">
                                <input type="hidden" name="page" value="<%= currentPage > 1 ? currentPage - 1 : 1%>" />
                                <button type="submit" class="pagination-button">Prev</button>
                            </form>
                            <span>Page <%= currentPage%></span>
                            <form action="StaffroomSL.jsp" method="get" style="display:inline;">
                                <input type="hidden" name="page" value="<%= currentPage + 1%>" />
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
