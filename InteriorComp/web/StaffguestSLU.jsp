<% String Header="Student Update" ; %>
                <% String dHeader="Student" ; %>
                    <%@ include file="StaffHeader.jsp" %>
                   <% String stdID = request.getParameter("stdID");%>
            <div class="breadcrumb">
                <a href="StaffguestS.jsp">Guest</a> / <a href="StaffguestSL.jsp">Guest List</a> / <a href="#" class="active">Update Guest</a>
            </div>
            <div class="back-button" onclick="history.back()">
                <i class="fas fa-arrow-left"></i> Back
            </div>
            <div class="content">
                <div class="form-container">
                    <sql:query var="guestDetails" dataSource="${myDatasource}">
                        SELECT * FROM STUDENT WHERE stdID = ?
                        <sql:param value="<%= stdID %>" />
                    </sql:query>
                    <c:forEach var="guest" items="${guestDetails.rows}">
                        <form action="UpdateGuestServlet" method="post">
                            <input type="hidden" name="stdID" value="${guest.stdID}">
                            <div class="form-group">
                                <label for="stdID">ID:</label>
                                <input type="text" id="stdID" name="stdID" value="${guest.stdID}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="stdName">Name:</label>
                                <input type="text" id="stdName" name="stdName" value="${guest.stdName}" required>
                            </div>
                            <div class="form-group">
                                <label for="stdIC">IC:</label>
                                <input type="text" id="stdIC" name="stdIC" value="${guest.stdIC}" required>
                            </div>
                            <div class="form-group">
                                <label for="stdPhone">Phone No:</label>
                                <input type="text" id="stdPhone" name="stdPhone" value="${guest.stdPhone}" required>
                            </div>
                            <div class="form-group">
                                <label for="stdAddress">Address:</label>
                                <input type="text" id="stdAddress" name="stdAddress" value="${guest.stdAddress}" required>
                            </div>
                            <div class="form-group">
                                <label for="stdIncome">Income:</label>
                                <input type="text" id="stdIncome" name="stdIncome" value="${guest.stdIncome}" required>
                            </div>
                            <div class="form-group">
                                <label for="stdParentPhoneNum">Parent Phone No:</label>
                                <input type="text" id="stdParentPhoneNum" name="stdParentPhoneNum" value="${guest.stdParentPhoneNum}" required>
                            </div>
                            <button type="submit">Update Guest</button>
                        </form>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
