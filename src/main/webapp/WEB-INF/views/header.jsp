<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="user" value="${sessionScope.user}"/>
<c:set var="isGuest" value="${empty user}"/>

<%--<header>--%>
<%--<c:if test="${empty sessionScope.user}">--%>
<%--    <a href="/login">Đăng nhập</a>--%>
<%--</c:if>--%>
<%--<c:if test="${not empty sessionScope.user}">--%>
<%--    Welcome <c:out value="${sessionScope.user.username}"/>--%>
<%--</c:if>--%>
<%--</header>--%>
<header style="background-color: #004080; padding: 20px; color: white;">
    <div style="display: flex; justify-content: space-between; align-items: center;">
        <!-- Logo -->
        <div>
            <a href="/home" style="text-decoration: none; color: white;">
                <img src="/WEB-INF/fragment/logo.png" alt="JobFinder Logo" style="height: 50px;">
            </a>
        </div>

        <!-- Search bar -->
        <div style="flex-grow: 1; padding: 0 20px;">
            <form action="/search" method="get" style="display: flex;">
                <input type="text" name="q" placeholder="Tìm kiếm công việc"
                       style="flex-grow: 1; padding: 10px; border: none; border-radius: 4px 0 0 4px;">
                <button type="submit"
                        style="padding: 10px 20px; background-color: #f5a623; border: none; border-radius: 0 4px 4px 0; color: white; cursor: pointer;">
                    Tìm kiếm
                </button>
            </form>
        </div>

        <!-- Login/Sign Up -->
        <div>
            <c:if test="${empty sessionScope.user}">
                <a href="/login" style="text-decoration: none; color: white; margin-right: 20px;">Đăng nhập</a>
                <a href="/signup"
                   style="text-decoration: none; background-color: #f5a623; padding: 10px 20px; border-radius: 4px; color: white;">
                    Đăng ký
                </a>
            </c:if>
            <c:if test="${not empty sessionScope.user}">
                <!-- User Menu Dropdown (Hiển thị khi đã đăng nhập) -->
                <div style="position: relative; display: inline-block;">
                    <button onclick="toggleDropdown()"
                            style="background-color: #f5a623; padding: 10px 20px; border: none; border-radius: 4px; color: white; cursor: pointer;">
                        <c:out value="${sessionScope.user.username}"/> <span style="font-size: 12px;">&#9660;</span>
                    </button>
                    <div id="userDropdown"
                         style="display: none; position: absolute; right: 0; background-color: white; min-width: 160px; box-shadow: 0px 8px 16px rgba(0,0,0,0.2); z-index: 1; border-radius: 4px;">
                        <a href="/profile"
                           style="color: black; padding: 12px 16px; text-decoration: none; display: block;">Thông tin cá
                            nhân</a>
                        <a href="/applications"
                           style="color: black; padding: 12px 16px; text-decoration: none; display: block;">Việc đã ứng
                            tuyển</a>
                        <a href="/settings"
                           style="color: black; padding: 12px 16px; text-decoration: none; display: block;">Cài đặt</a>
                        <a href="/sign-out"
                           style="color: black; padding: 12px 16px; text-decoration: none; display: block;">Đăng
                            xuất</a>
                    </div>
                </div>
            </c:if>

        </div>
    </div>
</header>

<script>
  function toggleDropdown() {
    var dropdown = document.getElementById("userDropdown");
    dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
  }

  // Đóng dropdown nếu click bên ngoài
  window.onclick = function(event) {
    if (!event.target.matches('button')) {
      var dropdowns = document.getElementsByClassName("dropdown-content");
      for (var i = 0; i < dropdowns.length; i++) {
        var openDropdown = dropdowns[i];
        if (openDropdown.style.display === "block") {
          openDropdown.style.display = "none";
        }
      }
    }
  }
</script>