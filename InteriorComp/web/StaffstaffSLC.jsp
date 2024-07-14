
<<% String Header="Staff List"; %>
<% String dHeader="Staff"; %>
<%@ include file="StaffHeader.jsp" %>
            <div class="breadcrumb">
                <a href="StaffstaffS.jsp">Staff</a> / <a href="StaffstaffSL.jsp">Staff List</a> / <a href="#" class="active">Create Staff</a>
            </div>
            <div class="back-button" onclick="history.back()">
                <i class="fas fa-arrow-left"></i> Back
            </div>
            <div class="content">
                <div class="form-container">
                    <form action="CreateStaffServlet" method="post">
                        <div class="form-section-title"><strong>User Information</strong></div>
                        <br>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="username">Username:</label>
                            <input type="text" id="username" name="username" required>
                        </div>
                        <div class="form-section-title"><strong>Staff Information</strong></div>
                        <br>
                        
                        <div class="form-group">
                            <label for="staffName">Staff Name:</label>
                            <input type="text" id="staffName" name="staffName" required>
                        </div>
                        <div class="form-group">
                            <label for="staffType">Staff Type:</label>
                            <select id="staffType" name="staffType" required>
                                <option value="Admin">Admin</option>
                                <option value="Manager">Manager</option>
                                <option value="Receptionist">Receptionist</option>
                                <option value="Housekeeper">Housekeeper</option>
                                <option value="Chef">Chef</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="staffAge">Staff Age:</label>
                            <input type="number" id="staffAge" name="staffAge" required>
                        </div>
                        <button type="submit">Create Staff</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
