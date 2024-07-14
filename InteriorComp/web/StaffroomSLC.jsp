<% String Header="Room Create" ; %>
<% String dHeader="Room"; %>
    <%@ include file="StaffHeader.jsp" %>
    <%if (!"Admin".equals(rank)) {
        response.sendRedirect("noPermS.jsp");
        return;
    }%>
                <div class="breadcrumb">
                    <a href="StaffroomS.jsp">Room</a> / <a href="StaffroomSL.jsp">Room List</a> / <a href="#"
                        class="active">Create Room</a>
                </div>
                <div class="back-button" onclick="history.back()">
                    <i class="fas fa-arrow-left"></i> Back
                </div>
                <div class="content">
                    <div class="form-container">
                        <h1>Create Room</h1>
                        <form action="CreateRoomServlet" method="post">
                            <div class="form-group">
                                <label for="roomType">Room Type:</label>
                                <select id="roomType" name="roomType" required>
                                    <option value="Normal">Normal</option>
                                    <option value="Deluxe">Deluxe</option>
                                    <option value="Luxury">Luxury</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="block">Block:</label>
                                <select id="block" name="block" required>
                                    <option value="A">Block A</option>
                                    <option value="B">Block B</option>
                                    <option value="C">Block C</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="capacity">Capacity:</label>
                                <input type="number" id="capacity" name="capacity" required>
                            </div>

                            <button type="submit">Create Room</button>
                        </form>
                    </div>
                </div>
                </div>
                </div>
                </body>

                </html>