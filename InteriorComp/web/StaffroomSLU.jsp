   <% String Header="Room Update" ; %>
<% String dHeader="Room"; %>
    <%@ include file="StaffHeader.jsp" %>
            
    <%String roomId = request.getParameter("roomID");%>
                <div class="breadcrumb">
                    <a href="StaffroomS.jsp">Room</a> / <a href="StaffroomSL.jsp">Room List</a> / <a href="#" class="active">Update Room</a>
                </div>
                <div class="back-button" onclick="history.back()">
                    <i class="fas fa-arrow-left"></i> Back
                </div>
                <div class="content">
                    <div class="form-container">
                        <h1>Update Room</h1>
                        <sql:query var="roomDetails" dataSource="${myDatasource}">
                            SELECT * FROM ROOM WHERE ROOMID = ?
                            <sql:param value="<%= roomId%>" />
                        </sql:query>
                            
                        <sql:query var="blockList" dataSource="${myDatasource}">
                            SELECT BLOCKID FROM BLOCK
                        </sql:query>
                        <c:forEach var="room" items="${roomDetails.rows}">
                            <form action="UpdateRoomServlet" method="post">
                                <div class="form-group">
                                    <label for="roomID">Room ID:</label>
                                    <input type="text" id="roomID" name="roomID" value="${room.roomID}" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="roomType">Room Type:</label>
                                    <select id="roomType" name="roomType" required>
                                        <option value="Normal" <c:if test="${room.roomType == 'Normal'}">selected</c:if>>Normal</option>
                                        <option value="Deluxe" <c:if test="${room.roomType == 'Deluxe'}">selected</c:if>>Deluxe</option>
                                        <option value="Luxury" <c:if test="${room.roomType == 'Luxury'}">selected</c:if>>Luxury</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="block">Block:</label>
                                        <select id="block" name="block" required>
                                        <c:forEach var="block" items="${blockList.rows}">
                                            <option value="${block.BLOCKID}" <c:if test="${room.blockID == block.BLOCKID}">selected</c:if>>Block ${block.BLOCKID}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="capacity">Capacity:</label>
                                    <input type="number" id="capacity" name="capacity" value="${room.maxCapacity}" required>
                                </div>

                                <div class="form-group">
                                    <label for="availability">Availability:</label>
                                    <select id="availability" name="availability" required>
                                        <option value="Empty" <c:if test="${room.availability == 'Empty'}">selected</c:if>>Empty</option>
                                        <option value="Partially Occupied" <c:if test="${room.availability == 'Partially Occupied'}">selected</c:if>>Partially Occupied</option>
                                        <option value="Full" <c:if test="${room.availability == 'Full'}">selected</c:if>>Full</option>
                                        </select>                                
                                    </div>

                                    <button type="submit">Update Room</button>
                                </form>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
