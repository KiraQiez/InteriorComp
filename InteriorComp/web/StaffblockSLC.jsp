<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <% String Header="Block Create" ; %>
            <% String dHeader="Block" ; %>
                <%@ include file="StaffHeader.jsp" %>
                    <div class="breadcrumb">
                        <a href="StaffblockSL.jsp">Block</a> / <a href="#" class="active">Create Block</a>
                    </div>
                    <div class="back-button" onclick="history.back()">
                        <i class="fas fa-arrow-left"></i> Back
                    </div>
                    <div class="content">
                        <div class="form-container">
                            <h1>Create Block</h1>
                            <form action="CreateBlockServlet" method="post">
                                <div class="form-group">
                                    <label for="blockID">Block ID:</label>
                                    <input type="text" id="blockID" name="blockID" required>
                                </div>
                                <div class="form-group">
                                    <label for="blockID">Block Name:</label>
                                    <input type="text" id="blockName" name="blockName" required>
                                </div>

                                <div class="form-group">
                                    <label for="blockDesc">Block Description:</label>
                                    <input type="text" id="blockDesc" name="blockDesc" required>
                                </div>

                                <button type="submit">Create Block</button>
                            </form>
                        </div>
                    </div>
                    </div>
                    </div>
                    </body>

                    </html>