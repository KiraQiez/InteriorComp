
    <% String Header="Room" ; %>
        <% String dHeader="Room"; %>
            <%@ include file="StaffHeader.jsp" %>
                <div class="breadcrumb">
                    <a href="#" class="active">Room</a>
                </div>
                <div class="content">
                    <h1>Room</h1>
                    <!-- Room List Card -->
                    <div class="navigation-card" onclick="window.location.href='StaffroomSL.jsp';">
                        <img src="resource/bookingList.png" alt="Room List" class="card-image">
                        <div class="card-content">
                            <div class="card-title">Room Management</div>
                            <div class="card-description">Explore our comprehensive list of available rooms.
                            </div>
                            <button class="card-button">View Room List</button>
                        </div>
                    </div>
                    <!-- Block List Card -->
                    <div class="navigation-card" onclick="window.location.href='StaffblockSL.jsp';">
                        <img src="resource/block-list.png" alt="Block List" class="card-image">
                        <div class="card-content">
                            <div class="card-title">Block Management</div>
                            <div class="card-description">Manage and review all room blocks and their
                                statuses.</div>
                            <button class="card-button">View Block List</button>
                        </div>
                    </div>
                </div>
                </div>
                </div>
                </body>

                </html>