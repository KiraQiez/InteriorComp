<% String Header="Staff List"; %>
<% String dHeader="Staff"; %>
<%@ include file="StaffHeader.jsp" %>
            <div class="breadcrumb">
                <a href="StaffstaffS.jsp">Staff</a> / <a href="#" class="active">Update Staff</a>
            </div>

            <div class="content">
                <div class="profile-container">
                    <h1>Update Staff</h1>
                    <c:set var="staffID" value="${param.id}" />

                    <!-- SQL Query to fetch staff details -->
                    <sql:query var="staff" dataSource="${myDatasource}">
                        SELECT STAFFID, STAFFNAME, STAFFTYPE, STAFFAGE FROM STAFF WHERE STAFFID = ?
                        <sql:param value="${staffID}" />
                    </sql:query>

                    <form class="profile-form" action="UpdateStaffServlet" method="POST">
                        <div class="form-section-title">Personal Information</div>
                        <div class="form-group">
                            <label for="id">ID:</label>
                            <c:if test="${not empty staff.rows}">
                                <input type="text" id="id" name="id" value="${staff.rows[0].STAFFID}" readonly>
                            </c:if>
                        </div>
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <c:if test="${not empty staff.rows}">
                                <input type="text" id="name" name="name" value="${staff.rows[0].STAFFNAME}">
                            </c:if>
                        </div>
                        <div class="form-group">
                            <label for="type">Staff Type:</label>
                            <select id="type" name="type">
                                <c:if test="${not empty staff.rows}">
                                    <option value="Admin" <c:if test="${staff.rows[0].STAFFTYPE == 'Admin'}">selected</c:if>>Admin</option>
                                    <option value="Manager" <c:if test="${staff.rows[0].STAFFTYPE == 'Manager'}">selected</c:if>>Manager</option>
                                    <option value="Receptionist" <c:if test="${staff.rows[0].STAFFTYPE == 'Receptionist'}">selected</c:if>>Receptionist</option>
                                    <option value="Housekeeper" <c:if test="${staff.rows[0].STAFFTYPE == 'Housekeeper'}">selected</c:if>>Housekeeper</option>
                                    <option value="Chef" <c:if test="${staff.rows[0].STAFFTYPE == 'Chef'}">selected</c:if>>Chef</option>
                                </c:if>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="age">Age:</label>
                            <c:if test="${not empty staff.rows}">
                                <input type="number" id="age" name="age" value="${staff.rows[0].STAFFAGE}">
                            </c:if>
                        </div>
                        <input type="hidden" name="id" value="${staffID}">
                        <div class="form-buttons">
                            <input type="submit" value="Save Changes">
                            <form action="DeleteStaffServlet" method="POST" style="margin: 0;">
                                <input type="hidden" name="id" value="${staffID}">
                                <button type="submit" class="delete-button">Delete</button>
                            </form>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
