<% String Header="Block Update" ; %>
<% String dHeader="Block" ; %>
    <%@ include file="StaffHeader.jsp" %>
        
        <%String blockId = request.getParameter("blockID");%>
            <div class="breadcrumb">
                <a href="StaffblockSL.jsp">Block</a> / <a href="StaffblockSL.jsp">Block List</a> / <a href="#" class="active">Update Block</a>
            </div>
            <div class="back-button" onclick="history.back()">
                <i class="fas fa-arrow-left"></i> Back
            </div>
            <div class="content">
                <div class="form-container">
                    <h1>Update Block</h1>
                    <sql:query var="blockDetails" dataSource="${myDatasource}">
                        SELECT * FROM BLOCK WHERE BLOCKID = ?
                        <sql:param value="<%= blockId %>" />
                    </sql:query>
                    <c:forEach var="block" items="${blockDetails.rows}">
                        <form action="UpdateBlockServlet" method="post">
                            <input type="hidden" name="blockID" value="${block.blockID}">
                            <div class="form-group">
                                <label for="blockID">Block ID:</label>
                                <input type="text" id="blockID" name="blockID" value="${block.blockID}" readonly>
                            </div>

                            <div class="form-group">
                                <label for="blockName">Block Name:</label>
                                <input type="text" id="blockName" name="blockName" value="${block.blockName}" required>
                            </div>

                            <div class="form-group">
                                <label for="blockDesc">Block Description:</label>
                                <input type="text" id="blockDesc" name="blockDesc" value="${block.blockDesc}" required>
                            </div>

                            <button type="submit">Update Block</button>
                        </form>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
