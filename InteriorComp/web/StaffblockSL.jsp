<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <% String Header="Block List" ; %>
                <% String dHeader="Block" ; %>
                    <%@ include file="StaffHeader.jsp" %>
                        <sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver"
                            url="jdbc:derby://localhost:1527/InteriorDB" user="root" password="root" />
                        <div class="breadcrumb">
                            <a href="StaffroomS.jsp">Block</a> / <a href="#" class="active">Block List</a>
                        </div>

                        <div class="content">
                            <h1>Block List</h1>
                            <% int rowsPerPage=10; int currentPage=1; String pageParam=request.getParameter("page"); if
                                (pageParam !=null) { try { currentPage=Integer.parseInt(pageParam); } catch
                                (NumberFormatException e) { currentPage=1; } } int offset=(currentPage - 1) *
                                rowsPerPage; %>

                                <sql:query var="block_list" dataSource="${myDatasource}">
                                    SELECT * FROM BLOCK
                                    ORDER BY blockID
                                    OFFSET <%= offset %> ROWS
                                        FETCH NEXT <%= rowsPerPage %> ROWS ONLY
                                </sql:query>

                                <div class="table-container">
                                    <div class="header-actions">
                                        <form action="StaffblockSLC.jsp" method="get" style="display:inline;">
                                            <button class="action-button">Create Block</button>
                                        </form>
                                    </div>
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Block ID</th>
                                                <th>Block Name</th>
                                                <th>Block Description</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:choose>
                                                <c:when test="${empty block_list.rows}">
                                                    <tr>
                                                        <td colspan="3">No block available.</td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach var="row" items="${block_list.rows}">
                                                        <tr>
                                                            <td>
                                                                <c:out value="${row.blockID}" />
                                                            </td>
                                                            <td>
                                                                <c:out value="${row.blockName}" />
                                                            </td>
                                                            <td>
                                                                <c:out value="${row.blockDesc}" />
                                                            </td>
                                                            <td class="actions">
                                                                <form action="StaffBlockDetails.jsp" method="get"
                                                                    style="display:inline;">
                                                                    <input type="hidden" name="blockID"
                                                                        value="${row.blockID}" />
                                                                    <button type="submit"
                                                                        class="view-button">View</button>
                                                                </form>
                                                                <form action="StaffblockSLU.jsp" method="get"
                                                                    style="display:inline;">
                                                                    <input type="hidden" name="blockID"
                                                                        value="${row.blockID}" />
                                                                    <button type="submit"
                                                                        class="view-button">Update</button>
                                                                </form>
                                                                <form action="DeleteBlockServlet" method="post"
                                                                    style="display:inline;">
                                                                    <input type="hidden" name="blockID"
                                                                        value="${row.blockID}" />
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
                                                    Block created successfully!
                                                </c:when>
                                                <c:otherwise>
                                                    Block creation failed:
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
                                                    Block deleted successfully!
                                                </c:when>
                                                <c:otherwise>
                                                    Block deletion failed:
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
                                                    Block updated successfully!
                                                </c:when>
                                                <c:otherwise>
                                                    Block update failed:
                                                    <c:out value="${sessionScope.updateMessage}" />
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <% session.removeAttribute("updateResult");
                                            session.removeAttribute("updateMessage"); %>
                                    </c:if>

                                    <div class="pagination-container">
                                        <form action="StaffblockSL.jsp" method="get" style="display:inline;">
                                            <input type="hidden" name="page"
                                                value="<%= currentPage > 1 ? currentPage - 1 : 1 %>" />
                                            <button type="submit" class="pagination-button">Prev</button>
                                        </form>
                                        <span>Page <%= currentPage %></span>
                                        <form action="StaffblockSL.jsp" method="get" style="display:inline;">
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