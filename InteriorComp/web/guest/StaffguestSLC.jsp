
        <% String Header="Student Create" ; %>
            <% String dHeader="Student" ; %>
                <%@ include file="StaffHeader.jsp" %>
                    <div class="breadcrumb">
                        <a href="StaffguestS.jsp">Guest</a> / <a href="StaffguestSL.jsp">Guest List</a> / <a href="#"
                            class="active">Create Guest</a>
                    </div>
                    <div class="back-button" onclick="history.back()">
                        <i class="fas fa-arrow-left"></i> Back
                    </div>
                    <div class="content">
                        <div class="form-container">
                            <form action="CreateGuestServlet" method="post">
                                <div class="form-group">
                                    <label for="stdID">ID:</label>
                                    <input type="text" id="stdID" name="stdID" required>
                                </div>
                                <div class="form-group">
                                    <label for="stdName">Name:</label>
                                    <input type="text" id="stdName" name="stdName" required>
                                </div>
                                <div class="form-group">
                                    <label for="stdIC">IC:</label>
                                    <input type="text" id="stdIC" name="stdIC" required>
                                </div>
                                <div class="form-group">
                                    <label for="stdPhone">Phone No:</label>
                                    <input type="text" id="stdPhone" name="stdPhone" required>
                                </div>
                                <div class="form-group">
                                    <label for="stdAddress">Address:</label>
                                    <input type="text" id="stdAddress" name="stdAddress" required>
                                </div>
                                <div class="form-group">
                                    <label for="stdIncome">Income:</label>
                                    <input type="text" id="stdIncome" name="stdIncome" required>
                                </div>
                                <div class="form-group">
                                    <label for="stdParentPhoneNum">Parent Phone No:</label>
                                    <input type="text" id="stdParentPhoneNum" name="stdParentPhoneNum" required>
                                </div>
                                <button type="submit">Create Guest</button>
                            </form>
                        </div>
                    </div>
                    </div>
                    </div>
                    </body>

                    </html>