<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin cá nhân</title>
</head>
<body>
<div id="wrapper">
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <div class="clearfix"></div>
    <!-- Titlebar -->

    <!-- Page Content -->


    <div class="utf-dashboard-content-container-aera" data-simplebar>
        <div id="dashboard-titlebar" class="utf-dashboard-headline-item">
            <div class="row">
                <div class="col-xl-12">
                    <h3>My Profile</h3>
                    <nav id="breadcrumbs">
                        <ul>
                            <li><a href="index-1.html">Home</a></li>
                            <li><a href="dashboard.html">Dashboard</a></li>
                            <li>My Profile</li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <div class="utf-dashboard-content-inner-aera">
            <div class="row">
                <div class="col-xl-6">
                    <div class="dashboard-box margin-top-0 margin-bottom-30">
                        <div class="headline">
                            <h3>My Profile Details</h3>
                        </div>
                        <div class="content with-padding padding-bottom-0">
                            <div class="row">
                                <div class="col">
                                    <div class="row">
                                        <div class="col-xl-12">
                                            <div class="row">
                                                <div class="col-xl-5 col-md-3 col-sm-4">
                                                    <div class="utf-avatar-wrapper" data-tippy-placement="top"
                                                         title="Change Profile Picture">
                                                        <img class="profile-pic"
                                                             src="${user.avatar}" alt=""/>
                                                        <div class="upload-button"></div>
                                                        <input class="file-upload" type="file" accept="image/*"/>
                                                    </div>
                                                </div>
                                                <div class="col-xl-7 col-md-9 col-sm-8">
                                                    <div class="utf-submit-field">
                                                        <h5>Loại tài khoản:</h5>
                                                        <div class="utf-account-type">
                                                            <div>
                                                                <input type="radio" name="utf-account-type-radio"
                                                                       id="freelancer-radio"
                                                                       class="utf-account-type-radio" checked/>
                                                                <label for="freelancer-radio" title="Employer"
                                                                       data-tippy-placement="top"
                                                                       class="utf-ripple-effect-dark"><i
                                                                        class="icon-material-outline-business-center"></i>
                                                                    Người tuyển dụng</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-12 col-md-6 col-sm-6">
                                            <div class="utf-submit-field">
                                                <h5>Tên đăng nhập:</h5>
                                                <input type="text" class="utf-with-border" value="${user.username}">
                                            </div>
                                        </div>
                                        <div class="col-xl-12 col-md-6 col-sm-6">
                                            <div class="utf-submit-field">
                                                <h5>Email:</h5>
                                                <input type="text" class="utf-with-border" value="${user.email}">
                                            </div>
                                        </div>
                                        <div class="col-xl-12 col-md-6 col-sm-6">
                                            <div class="utf-submit-field">
                                                <h5>Số điện thoại:</h5>
                                                <input type="text" class="utf-with-border" value="${user.phoneNumber}">
                                            </div>
                                        </div>

                                        <div class="utf-no-border margin-bottom-18 col-xl-4 col-md-2 col-sm-2">
                                            <div class="utf-submit-field">
                                                <h5>Tỉnh:</h5>
                                                <select class="selectpicker utf-with-border" id="addressId1"
                                                        name="addressId1">
                                                    <option value="">Chọn Tỉnh</option>
                                                    <c:forEach var="province" items="${provinces}">
                                                        <option value="${province.code}"
                                                                <c:if test="${province.code == user.addressId1}">selected</c:if>>${province.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="utf-no-border margin-bottom-18 col-xl-4 col-md-2 col-sm-2">
                                            <div class="utf-submit-field">
                                                <h5>Huyện:</h5>
                                                <select class="selectpicker utf-with-border" id="addressId2"
                                                        name="addressId2">
                                                    <option value="">Chọn Huyện</option>
                                                    <c:forEach var="district" items="${districts}">
                                                        <option value="${district.code}"
                                                                <c:if test="${district.code == user.addressId2}">selected</c:if>>${district.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="utf-no-border margin-bottom-18 col-xl-4 col-md-2 col-sm-2">
                                            <div class="utf-submit-field">
                                                <h5>Xã:</h5>
                                                <select class="selectpicker utf-with-border" id="addressId3"
                                                        name="addressId3">
                                                    <option value="">Chọn Xã</option>
                                                    <c:forEach var="ward" items="${wards}">
                                                        <option value="${ward.code}"
                                                                <c:if test="${ward.code == user.addressId3}">selected</c:if>>${ward.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xl-12 col-md-6 col-sm-6">
                                            <div class="utf-submit-field">
                                                <h5>Địa chỉ chi tiết:</h5>
                                                <input type="text" class="utf-with-border" value="${user.address}">
                                            </div>
                                        </div>

                                        <div class="col-xl-12 col-md-6 col-sm-6">
                                            <div class="utf-submit-field">
                                                <h5>Mã code công ty:</h5>
                                                <input type="text" class="utf-with-border" value="${user.companyCode}">
                                            </div>
                                        </div>
                                        <div class="col-xl-12 col-md-6 col-sm-6">
                                            <div class="utf-submit-field">
                                                <h5>Tên công ty:</h5>
                                                <input type="text" class="utf-with-border" value="${user.companyName}">
                                            </div>
                                        </div>
                                        <div class="col-xl-12 col-md-6 col-sm-6">
                                            <div class="utf-submit-field">
                                                <h5>Mô tả công ty:</h5>
                                                <input type="text" class="utf-with-border" value="${user.companyDescription}">
                                            </div>
                                        </div>
                                        <div class="col-xl-12 col-md-6 col-sm-6">
                                            <div class="utf-submit-field">
                                                <h5>Số lượng nhân viên:</h5>
                                                <input type="number" class="utf-with-border" value="${user.companyScale}">
                                            </div>
                                        </div>
                                        




                                    </div>
                                </div>
                            </div>
                            <a href="javascript:void(0);"
                               class="button ripple-effect big margin-top-10 margin-bottom-20" id="save-profile-btn">Lưu</a>
                        </div>
                    </div>
                </div>

                <div class="col-xl-6">
                    <div id="test1" class="dashboard-box margin-top-0">
                        <div class="headline">
                            <h3>Change Password</h3>
                        </div>
                        <div class="content with-padding">
                            <div class="row">
                                <div class="col-xl-12 col-md-6 col-sm-6">
                                    <div class="utf-submit-field">
                                        <h5>Mật khẩu hiện tại</h5>
                                        <input type="password" class="utf-with-border" title="Current Password"
                                               data-tippy-placement="top" placeholder="********" id="currentPassword">
                                    </div>
                                </div>
                                <div class="col-xl-12 col-md-6 col-sm-6">
                                    <div class="utf-submit-field">
                                        <h5>Mật khẩu mới</h5>
                                        <input type="password" class="utf-with-border"
                                               title="The password must be at least 8 characters"
                                               data-tippy-placement="top" placeholder="********" id="newPassword">
                                    </div>
                                </div>
                                <div class="col-xl-12 col-md-6 col-sm-6">
                                    <div class="utf-submit-field">
                                        <h5>Xác nhận mật khẩu </h5>
                                        <input type="password" class="utf-with-border"
                                               title="The password must be at least 8 characters"
                                               data-tippy-placement="top" placeholder="********" id="confirmPassword">
                                    </div>
                                </div>
                            </div>
                            <a href="javascript:void(0);" class="button ripple-effect big margin-top-10" id="update-password-btn">Lưu mật khẩu</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <div class="utf-dashboard-footer-spacer-aera"></div>
            <div class="utf-small-footer margin-top-15">
                <div class="utf-small-footer-copyrights">Copyright &copy; 2021 All Rights Reserved.</div>
            </div>
        </div>
    </div>


<%--    <%@ include file="/WEB-INF/views/footer.jsp" %>--%>
</div>

<script>
    document.getElementById('save-profile-btn').addEventListener('click', function () {
        const profileData = {
            username: document.querySelector('input[value="${user.username}"]').value,
            email: document.querySelector('input[value="${user.email}"]').value,
            phoneNumber: document.querySelector('input[value="${user.phoneNumber}"]').value,
            companyCode: document.querySelector('input[value="${user.companyCode}"]').value,
            companyName: document.querySelector('input[value="${user.companyName}"]').value,
            companyDescription: document.querySelector('input[value="${user.companyDescription}"]').value,
            companyScale: document.querySelector('input[value="${user.companyScale}"]').value,
            address: document.querySelector('input[value="${user.address}"]').value,
            addressId1: document.getElementById('addressId1').value,
            addressId2: document.getElementById('addressId2').value,
            addressId3: document.getElementById('addressId3').value
        };

        fetch('/saveAccountInfor', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(profileData),
        })
            .then(response => {
                if (response.ok) {
                    alert('Profile saved successfully!');
                } else {
                    alert('Failed to save profile!');
                }
            })
            .catch(error => console.error('Error:', error));
    });

    document.getElementById('update-password-btn').addEventListener('click', function () {
        // Lấy giá trị từ các ô input
        const currentPassword = document.getElementById('currentPassword').value;
        const newPassword = document.getElementById('newPassword').value;
        const confirmPassword = document.getElementById('confirmPassword').value;

        // Kiểm tra xem mật khẩu mới và mật khẩu xác nhận có khớp nhau không
        if (newPassword !== confirmPassword) {
            alert("Mật khẩu mới và xác nhận mật khẩu không khớp!");
            return;
        }

        // Kiểm tra độ dài mật khẩu mới
        if (newPassword.length < 8) {
            alert("Mật khẩu mới phải có ít nhất 8 ký tự!");
            return;
        }

        // Tạo dữ liệu cần gửi
        const requestData = {
            currentPassword: currentPassword,
            newPassword: newPassword
        };

        // Gọi API
        fetch('/update-password', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(requestData)
        })
            .then(response => {
                if (response.ok) {
                    alert('Password saved successfully!');
                } else {
                    alert('Failed to save password!');
                }
            })
            .catch(error => console.error('Error:', error));
    });
    // Load districts when a province is selected
    $('#addressId1').change(function () {
        var provinceCode = $(this).val();
        $.ajax({
            url: '/getDistricts', // Đường dẫn đến service xử lý
            type: 'GET',
            data: {provinceCode: provinceCode},
            success: function (response) {
                var districtSelect = $('#addressId2');
                districtSelect.empty(); // Xóa các tùy chọn cũ
                districtSelect.append('<option value="">Chọn Huyện</option>'); // Thêm placeholder mặc định

                // Thêm các huyện từ response vào dropdown
                $.each(response, function (index, district) {
                    districtSelect.append('<option value="' + district.code + '">' + district.name + '</option>');
                });

                // Đặt lại trạng thái hiển thị
                districtSelect.selectpicker('refresh');
            },
            error: function () {
                alert('Lỗi khi tải danh sách huyện!');
            }
        });
    });

    // Load wards when a district is selected
    $('#addressId2').change(function () {
        var districtCode = $(this).val();
        $.ajax({
            url: '/getWards', // Đường dẫn đến service xử lý
            type: 'GET',
            data: {districtCode: districtCode},
            success: function (response) {
                var wardSelect = $('#addressId3');
                wardSelect.empty(); // Xóa các tùy chọn cũ
                wardSelect.append('<option value="">Chọn Xã</option>'); // Thêm placeholder mặc định

                // Thêm các xã từ response vào dropdown
                $.each(response, function (index, ward) {
                    wardSelect.append('<option value="' + ward.code + '">' + ward.name + '</option>');
                });

                // Đặt lại trạng thái hiển thị
                wardSelect.selectpicker('refresh');
            },
            error: function () {
                alert('Lỗi khi tải danh sách xã!');
            }
        });
    });

</script>

</body>
</html>