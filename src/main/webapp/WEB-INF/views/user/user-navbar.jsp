<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="navbar-styles.css">
</head>
<body>
    <nav class="navbar">
        <!-- Logo Section -->
        <div class="navbar-brand">
            <div class="logo">U</div>
            <span class="logo-text">User Panel</span>
        </div>

        <!-- Navbar Links Section -->
        <div class="navbar-menu">
            <!-- Main Menu Dropdown -->
            <div class="navbar-item has-dropdown">
                <a href="#" class="navbar-link">Dashboard</a>
                <div class="dropdown-menu">
                    <a href="<%= request.getContextPath() %>/user/dashboard" class="dropdown-item">Main Dashboard</a>
                </div>
            </div>

            <!-- User Settings Dropdown -->
            <div class="navbar-item has-dropdown">
                <a href="#" class="navbar-link">User Settings</a>
                <div class="dropdown-menu">
                    <a href="<%= request.getContextPath() %>/profile/user" class="dropdown-item">Profile</a>
                    <a href="<%= request.getContextPath() %>/support/my-messages" class="dropdown-item">My Support</a>
                </div>
            </div>

            <!-- Course Settings Dropdown -->
            <div class="navbar-item has-dropdown">
                <a href="#" class="navbar-link">Course Settings</a>
                <div class="dropdown-menu">
                    <a href="<%= request.getContextPath() %>/courses" class="dropdown-item">View Courses</a>
                    <a href="<%= request.getContextPath() %>/courses/enrolled-courses" class="dropdown-item">Enrolled Courses</a>
                </div>
            </div>

            <!-- Help/Support Dropdown -->
            <div class="navbar-item has-dropdown">
                <a href="#" class="navbar-link">Help/Support</a>
                <div class="dropdown-menu">
                    <a href="<%= request.getContextPath() %>/user/user-help-center" class="dropdown-item">Help Center</a>
                    <a href="<%= request.getContextPath() %>/support/form" class="dropdown-item">Support</a>
                </div>
            </div>
        </div>

        <!-- Logout Button and Mobile Toggle Button -->
        <div class="navbar-end">
            <a href="#" onclick="logout()" class="navbar-item logout-btn">
                <i class="fa-solid fa-right-from-bracket"></i> Logout
            </a>
            <div class="mobile-toggle" id="mobileToggle">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>
    </nav>

    <script>
        async function logout() {
            try {
                const response = await fetch('<%= request.getContextPath() %>/auth/logout', {
                    method: 'POST',
                    credentials: 'include'
                });

                if (response.ok) {
                    window.location.href = '<%= request.getContextPath() %>/auth/login';
                } else {
                    alert('Error during logout');
                }
            } catch (error) {
                console.error('Logout failed:', error);
            }
        }

        // Mobile menu toggle
        document.getElementById('mobileToggle').addEventListener('click', function() {
            document.querySelector('.navbar-menu').classList.toggle('is-active');
            this.classList.toggle('is-active');
        });

        // Dropdown menu logic
        document.querySelectorAll('.navbar-item.has-dropdown').forEach(item => {
            item.addEventListener('click', function(e) {
                e.stopPropagation();
                this.classList.toggle('is-active');
            });
        });

        // Close dropdowns when clicking outside
        document.addEventListener('click', function() {
            document.querySelectorAll('.navbar-item.has-dropdown').forEach(item => {
                item.classList.remove('is-active');
            });
        });
    </script>
</body>
</html>