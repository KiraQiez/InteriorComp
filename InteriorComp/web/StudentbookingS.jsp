<% String Header="Booking" ; %>
<% String dHeader="Booking" ; %>
<%@ include file="StudentHeader.jsp" %>
            <div class="breadcrumb">
                <a href="#" >Booking</a>
            </div>
            <div class="content">
                <h1>Booking</h1>
                <!-- Room List Card -->
                <div class="navigation-card" onclick="window.location.href='StudentBooking.jsp';">
                    <img src="resource/bookingList.png" alt="Room List" class="card-image">
                    <div class="card-content">  
                        <div class="card-title">Booking Management</div>
                        <div class="card-description">Let's booking now.</div>
                        <button class="card-button">Book a Room</button>
                    </div>
                </div>
                
                <div class="navigation-card" onclick="window.location.href='StudentViewPastBooking.jsp';">
                    <img src="resource/block-list.png" alt="Block List" class="card-image">
                    <div class="card-content">
                        <div class="card-title">View Past Booking</div>
                        <div class="card-description">Manage and organize your past bookings.</div>
                        <button class="card-button">View Past Booking</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

