
    <% String Header="Student" ; %>
        <% String dHeader="Student" ; %>
            <%@ include file="StaffHeader.jsp" %>
                <div class="breadcrumb">
                    <a href="#" class="active">Guest</a>
                </div>
                <div class="content">
                    <h1>Guest</h1>
                    <div class="navigation-card" onclick="window.location.href='StaffguestSL.jsp';">
                        <img src="resource/guest-list.png" alt="Guest List" class="card-image">
                        <div class="card-content">
                            <div class="card-title">Guest List</div>
                            <div class="card-description">View and manage all registered guests. This
                                section allows for quick access to guest profiles, stay history, and contact
                                information.</div>
                            <button class="card-button">View Guest List</button>
                        </div>
                    </div>

                    <div class="navigation-card" onclick="window.location.href='StaffreportSL.jsp';">
                        <img src="resource/report-list.png" alt="Report List" class="card-image">
                        <div class="card-content">
                            <div class="card-title">Report List</div>
                            <div class="card-description">Access detailed reports that have been reported by
                                the guest.</div>
                            <button class="card-button">View Report List</button>
                        </div>
                    </div>
                </div>
                </div>
                </div>
                </body>

                </html>