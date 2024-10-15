<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Profile Page</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f0f2f5;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .profile-section {
      background-color: #fff;
      border-radius: 15px;
      padding: 25px;
      margin-bottom: 25px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
      transition: all 0.3s ease;
    }

    .profile-section:hover {
      transform: translateY(-5px);
      box-shadow: 0 5px 25px rgba(0, 0, 0, 0.2);
    }

    .profile-image {
      width: 120px;
      height: 120px;
      object-fit: cover;
      border: 4px solid #fff;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    }

    h3 {
      color: #3498db;
      font-weight: bold;
      margin-bottom: 20px;
      border-bottom: 2px solid #3498db;
      padding-bottom: 10px;
    }

    .form-label {
      font-weight: 600;
      color: #2c3e50;
      margin-bottom: 5px;
    }

    .form-control,
    .form-select {
      border-radius: 10px;
      border: 2px solid #bdc3c7;
      padding: 10px 15px;
      transition: all 0.3s ease;
    }

    .form-control:focus,
    .form-select:focus {
      border-color: #3498db;
      box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
    }

    .btn-add-skill {
      background-color: #2ecc71;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 10px;
      transition: all 0.3s ease;
    }

    .btn-add-skill:hover {
      background-color: #27ae60;
      transform: translateY(-2px);
    }
  </style>
</head>
<body>
<div class="container mt-5 mb-5"> <!-- Thêm mb-5 để tạo khoảng cách dưới -->
  <form:form id="updateProfile" action="/update-profile/${candidate.id}" method="post" modelAttribute="candidate" enctype="multipart/form-data">
    <form:hidden path="id"/>
    <form:hidden path="account"/>
    <form:hidden path="accountId"/>
    <form:hidden path="profileSections[0].id"/>
    <form:hidden path="profileSections[1].id"/>
    <form:hidden path="profileSections[2].id"/>
    <form:hidden path="profileSections[3].id"/>
    <form:hidden path="profileSections[4].id"/>
    <form:hidden path="profileSections[5].id"/>
    <form:hidden path="profileSections[0].image"/>
    <form:hidden path="profileSections[0].section"/>
    <form:hidden path="profileSections[1].section"/>
    <form:hidden path="profileSections[2].section"/>
    <form:hidden path="profileSections[3].section"/>
    <form:hidden path="profileSections[4].section"/>
    <form:hidden path="profileSections[5].section"/>
    <form:hidden path="profileSections[0].candidate"/>
    <form:hidden path="profileSections[1].candidate"/>
    <form:hidden path="profileSections[2].candidate"/>
    <form:hidden path="profileSections[3].candidate"/>
    <form:hidden path="profileSections[4].candidate"/>
    <form:hidden path="profileSections[5].candidate"/>
  <div class="profile-section">
    <div class="row align-items-center">
      <div class="col-auto">
        <img id="uploadImage" src="${candidate.profileSections[0].image}"
             alt="Profile Picture" class="profile-image rounded-circle" onclick="triggerFileInput()" style="cursor: pointer;">
        <input id="imageInput" name="imageInput" type="file" onchange="displaySelectedImage(event)" style="display: none"/>
      </div>
      <div class="col">
        <h2>${candidate.account.firstName} ${candidate.account.middleName} ${candidate.account.lastName}</h2>
        <p class="text-muted">${candidate.account.username}</p>
        <div class="row mt-3">
          <div class="col-md-6">
            <p><i class="fas fa-envelope me-2 text-primary"></i> ${candidate.account.email}</p>
            <p><i class="fas fa-calendar-alt me-2 text-primary"></i> ${candidate.account.dateOfBirth}</p>
            <p><i class="fas fa-map-marker-alt me-2 text-primary"></i> ${candidate.account.address}</p>
          </div>
          <div class="col-md-6">
            <p><i class="fas fa-phone me-2 text-primary"></i>0123-456-789</p>
            <p><i class="fas fa-user me-2 text-primary"></i>GENDER</p>
            <p><i class="fas fa-link me-2 text-primary"></i>FACEBOOK</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="profile-section">

    <h3><i class="fas fa-user-circle me-2"></i>Về tôi</h3>
    <div class="mb-3">
      <label for="biography" class="form-label">Giới thiệu điểm mạnh và số năm kinh nghiệm của bạn</label>
      <form:input type="text" id="biography" class="form-control" path="biography"
             placeholder="Giới thiệu điểm mạnh và số năm kinh nghiệm của bạn"/>
    </div>
  </div>

  <div class="profile-section">
    <h3><i class="fas fa-graduation-cap me-2"></i>Giáo dục</h3>
    <div class="mb-3">
      <label for="school" class="form-label">Trường</label>
      <form:input type="text" id="school" name="profileSection[0].organization" class="form-control mb-2" placeholder="Trường" path="profileSections[0].organization"/>

      <label for="class" class="form-label">Lớp</label>
      <form:input type="text" id="class" name="profileSection[0].title" path="profileSections[0].title" class="form-control mb-2" placeholder="Lớp"/>

      <div class="row">
        <div class="col-md-3 mb-2">
          <label for="edu-start-month" class="form-label">Từ tháng</label>
          <form:select id="edu-start-month" class="form-select" path="profileSections[0].fromMonth">
            <option value="">Chọn tháng</option>
            <option value="1" ${candidate.profileSections[0].fromMonth == '1' ? 'selected' : ''}>Tháng 1</option>
            <option value="2" ${candidate.profileSections[0].fromMonth == '2' ? 'selected' : ''}>Tháng 2</option>
            <option value="3" ${candidate.profileSections[0].fromMonth == '3' ? 'selected' : ''}>Tháng 3</option>
            <option value="4" ${candidate.profileSections[0].fromMonth == '4' ? 'selected' : ''}>Tháng 4</option>
            <option value="5" ${candidate.profileSections[0].fromMonth == '5' ? 'selected' : ''}>Tháng 5</option>
            <option value="6" ${candidate.profileSections[0].fromMonth == '6' ? 'selected' : ''}>Tháng 6</option>
            <option value="7" ${candidate.profileSections[0].fromMonth == '7' ? 'selected' : ''}>Tháng 7</option>
            <option value="8" ${candidate.profileSections[0].fromMonth == '8' ? 'selected' : ''}>Tháng 8</option>
            <option value="9" ${candidate.profileSections[0].fromMonth == '9' ? 'selected' : ''}>Tháng 9</option>
            <option value="10" ${candidate.profileSections[0].fromMonth == '10' ? 'selected' : ''}>Tháng 10</option>
            <option value="11" ${candidate.profileSections[0].fromMonth == '11' ? 'selected' : ''}>Tháng 11</option>
            <option value="12" ${candidate.profileSections[0].fromMonth == '12' ? 'selected' : ''}>Tháng 12</option>
          </form:select>
        </div>
        <div class="col-md-3 mb-2">
          <label for="edu-start-year" class="form-label">Từ năm</label>
          <form:select id="edu-start-year" class="form-select" path="profileSections[0].fromYear">
            <option value="">Chọn năm</option>
            <option value="2024" ${candidate.profileSections[0].fromYear == '2024' ? 'selected' : ''}>2024</option>
            <option value="2023" ${candidate.profileSections[0].fromYear == '2023' ? 'selected' : ''}>2023</option>
            <option value="2022" ${candidate.profileSections[0].fromYear == '2022' ? 'selected' : ''}>2022</option>
            <option value="2021" ${candidate.profileSections[0].fromYear == '2021' ? 'selected' : ''}>2021</option>
            <option value="2020" ${candidate.profileSections[0].fromYear == '2020' ? 'selected' : ''}>2020</option>
            <option value="2019" ${candidate.profileSections[0].fromYear == '2019' ? 'selected' : ''}>2019</option>
            <option value="2018" ${candidate.profileSections[0].fromYear == '2018' ? 'selected' : ''}>2018</option>
            <option value="2017" ${candidate.profileSections[0].fromYear == '2017' ? 'selected' : ''}>2017</option>
            <option value="2016" ${candidate.profileSections[0].fromYear == '2016' ? 'selected' : ''}>2016</option>
            <option value="2015" ${candidate.profileSections[0].fromYear == '2015' ? 'selected' : ''}>2015</option>
            <option value="2014" ${candidate.profileSections[0].fromYear == '2014' ? 'selected' : ''}>2014</option>
            <option value="2013" ${candidate.profileSections[0].fromYear == '2013' ? 'selected' : ''}>2013</option>
            <option value="2012" ${candidate.profileSections[0].fromYear == '2012' ? 'selected' : ''}>2012</option>
            <option value="2000" ${candidate.profileSections[0].fromYear < '2012' ? 'selected' : ''}>OLDER</option>
          </form:select>
        </div>
        <div class="col-md-3 mb-2">
          <label for="edu-end-month" class="form-label">Đến tháng</label>
          <form:select id="edu-end-month" class="form-select" path="profileSections[0].toMonth">
            <option value="">Chọn tháng</option>
            <option value="1" ${candidate.profileSections[0].toMonth == '1' ? 'selected' : ''}>Tháng 1</option>
            <option value="2" ${candidate.profileSections[0].toMonth == '2' ? 'selected' : ''}>Tháng 2</option>
            <option value="3" ${candidate.profileSections[0].toMonth == '3' ? 'selected' : ''}>Tháng 3</option>
            <option value="4" ${candidate.profileSections[0].toMonth == '4' ? 'selected' : ''}>Tháng 4</option>
            <option value="5" ${candidate.profileSections[0].toMonth == '5' ? 'selected' : ''}>Tháng 5</option>
            <option value="6" ${candidate.profileSections[0].toMonth == '6' ? 'selected' : ''}>Tháng 6</option>
            <option value="7" ${candidate.profileSections[0].toMonth == '7' ? 'selected' : ''}>Tháng 7</option>
            <option value="8" ${candidate.profileSections[0].toMonth == '8' ? 'selected' : ''}>Tháng 8</option>
            <option value="9" ${candidate.profileSections[0].toMonth == '9' ? 'selected' : ''}>Tháng 9</option>
            <option value="10" ${candidate.profileSections[0].toMonth == '10' ? 'selected' : ''}>Tháng 10</option>
            <option value="11" ${candidate.profileSections[0].toMonth == '11' ? 'selected' : ''}>Tháng 11</option>
            <option value="12" ${candidate.profileSections[0].toMonth == '12' ? 'selected' : ''}>Tháng 12</option>
          </form:select>
        </div>
        <div class="col-md-3 mb-2">
          <label for="edu-end-year" class="form-label">Đến năm</label>
          <form:select id="edu-end-year" class="form-select" path="profileSections[0].toYear">
            <option value="">Chọn năm</option>
            <option value="2024" ${candidate.profileSections[0].toYear == '2024' ? 'selected' : ''}>2024</option>
            <option value="2023" ${candidate.profileSections[0].toYear == '2023' ? 'selected' : ''}>2023</option>
            <option value="2022" ${candidate.profileSections[0].toYear == '2022' ? 'selected' : ''}>2022</option>
            <option value="2021" ${candidate.profileSections[0].toYear == '2021' ? 'selected' : ''}>2021</option>
            <option value="2020" ${candidate.profileSections[0].toYear == '2020' ? 'selected' : ''}>2020</option>
            <option value="2019" ${candidate.profileSections[0].toYear == '2019' ? 'selected' : ''}>2019</option>
            <option value="2018" ${candidate.profileSections[0].toYear == '2018' ? 'selected' : ''}>2018</option>
            <option value="2017" ${candidate.profileSections[0].toYear == '2017' ? 'selected' : ''}>2017</option>
            <option value="2016" ${candidate.profileSections[0].toYear == '2016' ? 'selected' : ''}>2016</option>
            <option value="2015" ${candidate.profileSections[0].toYear == '2015' ? 'selected' : ''}>2015</option>
            <option value="2014" ${candidate.profileSections[0].toYear == '2014' ? 'selected' : ''}>2014</option>
            <option value="2013" ${candidate.profileSections[0].toYear == '2013' ? 'selected' : ''}>2013</option>
            <option value="2012" ${candidate.profileSections[0].toYear == '2012' ? 'selected' : ''}>2012</option>
            <option value="2000" ${candidate.profileSections[0].toYear < '2012' ? 'selected' : ''}>OLDER</option>
          </form:select>
        </div>
      </div>

      <label for="edu-details" class="form-label">Chi tiết bổ sung</label>
      <form:textarea id="edu-details" path="profileSections[0].description" class="form-control" placeholder="Chi tiết bổ sung" rows="3"/>
    </div>
  </div>

  <div class="profile-section">
    <h3><i class="fas fa-briefcase me-2"></i>Kinh nghiệm làm việc</h3>
    <div class="mb-3">
      <label for="job-title" class="form-label">Chức danh công việc</label>
      <form:input type="text" id="job-title" path="profileSections[1].title" class="form-control mb-2" placeholder="Chức danh công việc"/>

      <label for="company" class="form-label">Công ty</label>
      <form:input type="text" id="company" path="profileSections[1].organization" class="form-control mb-2" placeholder="Công ty"/>

      <div class="row">
        <div class="col-md-3 mb-2">
          <label for="job-start-month" class="form-label">Từ tháng</label>
          <form:select id="job-start-month" class="form-select" path="profileSections[1].fromMonth">
            <option value="">Chọn tháng</option>
            <option value="1" ${candidate.profileSections[1].fromMonth == '1' ? 'selected' : ''}>Tháng 1</option>
            <option value="2" ${candidate.profileSections[1].fromMonth == '2' ? 'selected' : ''}>Tháng 2</option>
            <option value="3" ${candidate.profileSections[1].fromMonth == '3' ? 'selected' : ''}>Tháng 3</option>
            <option value="4" ${candidate.profileSections[1].fromMonth == '4' ? 'selected' : ''}>Tháng 4</option>
            <option value="5" ${candidate.profileSections[1].fromMonth == '5' ? 'selected' : ''}>Tháng 5</option>
            <option value="6" ${candidate.profileSections[1].fromMonth == '6' ? 'selected' : ''}>Tháng 6</option>
            <option value="7" ${candidate.profileSections[1].fromMonth == '7' ? 'selected' : ''}>Tháng 7</option>
            <option value="8" ${candidate.profileSections[1].fromMonth == '8' ? 'selected' : ''}>Tháng 8</option>
            <option value="9" ${candidate.profileSections[1].fromMonth == '9' ? 'selected' : ''}>Tháng 9</option>
            <option value="10" ${candidate.profileSections[1].fromMonth == '10' ? 'selected' : ''}>Tháng 10</option>
            <option value="11" ${candidate.profileSections[1].fromMonth == '11' ? 'selected' : ''}>Tháng 11</option>
            <option value="12" ${candidate.profileSections[1].fromMonth == '12' ? 'selected' : ''}>Tháng 12</option>
          </form:select>
        </div>
        <div class="col-md-3 mb-2">
          <label for="job-start-year" class="form-label">Từ năm</label>
          <form:select id="job-start-year" class="form-select" path="profileSections[1].fromYear">
            <option value="">Chọn năm</option>
            <option value="2024" ${candidate.profileSections[1].fromYear == '2024' ? 'selected' : ''}>2024</option>
            <option value="2023" ${candidate.profileSections[1].fromYear == '2023' ? 'selected' : ''}>2023</option>
            <option value="2022" ${candidate.profileSections[1].fromYear == '2022' ? 'selected' : ''}>2022</option>
            <option value="2021" ${candidate.profileSections[1].fromYear == '2021' ? 'selected' : ''}>2021</option>
            <option value="2020" ${candidate.profileSections[1].fromYear == '2020' ? 'selected' : ''}>2020</option>
            <option value="2019" ${candidate.profileSections[1].fromYear == '2019' ? 'selected' : ''}>2019</option>
            <option value="2018" ${candidate.profileSections[1].fromYear == '2018' ? 'selected' : ''}>2018</option>
            <option value="2017" ${candidate.profileSections[1].fromYear == '2017' ? 'selected' : ''}>2017</option>
            <option value="2016" ${candidate.profileSections[1].fromYear == '2016' ? 'selected' : ''}>2016</option>
            <option value="2015" ${candidate.profileSections[1].fromYear == '2015' ? 'selected' : ''}>2015</option>
            <option value="2014" ${candidate.profileSections[1].fromYear == '2014' ? 'selected' : ''}>2014</option>
            <option value="2013" ${candidate.profileSections[1].fromYear == '2013' ? 'selected' : ''}>2013</option>
            <option value="2012" ${candidate.profileSections[1].fromYear == '2012' ? 'selected' : ''}>2012</option>
            <option value="2000" ${candidate.profileSections[1].fromYear < '2012' ? 'selected' : ''}>OLDER</option>
          </form:select>
        </div>
        <div class="col-md-3 mb-2">
          <label for="job-end-month" class="form-label">Đến tháng</label>
          <form:select id="job-end-month" class="form-select" path="profileSections[1].toMonth">
            <option value="">Chọn tháng</option>

            <option value="1"  ${candidate.profileSections[1].toMonth == '1' ? 'selected' : ''}>Tháng 1</option>
            <option value="2"  ${candidate.profileSections[1].toMonth == '2' ? 'selected' : ''}>Tháng 2</option>
            <option value="3"  ${candidate.profileSections[1].toMonth == '3' ? 'selected' : ''}>Tháng 3</option>
            <option value="4"  ${candidate.profileSections[1].toMonth == '4' ? 'selected' : ''}>Tháng 4</option>
            <option value="5"  ${candidate.profileSections[1].toMonth == '5' ? 'selected' : ''}>Tháng 5</option>
            <option value="6"  ${candidate.profileSections[1].toMonth == '6' ? 'selected' : ''}>Tháng 6</option>
            <option value="7"  ${candidate.profileSections[1].toMonth == '7' ? 'selected' : ''}>Tháng 7</option>
            <option value="8"  ${candidate.profileSections[1].toMonth == '8' ? 'selected' : ''}>Tháng 8</option>
            <option value="9"  ${candidate.profileSections[1].toMonth == '9' ? 'selected' : ''}>Tháng 9</option>
            <option value="10" ${candidate.profileSections[1].toMonth == '10' ? 'selected' : ''}>Tháng 10</option>
            <option value="11" ${candidate.profileSections[1].toMonth == '11' ? 'selected' : ''}>Tháng 11</option>
            <option value="12" ${candidate.profileSections[1].toMonth == '12' ? 'selected' : ''}>Tháng 12</option>
          </form:select>
        </div>
        <div class="col-md-3 mb-2">
          <label for="job-end-year" class="form-label">Đến năm</label>
          <form:select id="job-end-year" class="form-select" path="profileSections[1].toYear">
            <option value="">Chọn năm</option>
            <option value="2024" ${candidate.profileSections[1].toYear == '2024' ? 'selected' : ''}>2024</option>
            <option value="2023" ${candidate.profileSections[1].toYear == '2023' ? 'selected' : ''}>2023</option>
            <option value="2022" ${candidate.profileSections[1].toYear == '2022' ? 'selected' : ''}>2022</option>
            <option value="2021" ${candidate.profileSections[1].toYear == '2021' ? 'selected' : ''}>2021</option>
            <option value="2020" ${candidate.profileSections[1].toYear == '2020' ? 'selected' : ''}>2020</option>
            <option value="2019" ${candidate.profileSections[1].toYear == '2019' ? 'selected' : ''}>2019</option>
            <option value="2018" ${candidate.profileSections[1].toYear == '2018' ? 'selected' : ''}>2018</option>
            <option value="2017" ${candidate.profileSections[1].toYear == '2017' ? 'selected' : ''}>2017</option>
            <option value="2016" ${candidate.profileSections[1].toYear == '2016' ? 'selected' : ''}>2016</option>
            <option value="2015" ${candidate.profileSections[1].toYear == '2015' ? 'selected' : ''}>2015</option>
            <option value="2014" ${candidate.profileSections[1].toYear == '2014' ? 'selected' : ''}>2014</option>
            <option value="2013" ${candidate.profileSections[1].toYear == '2013' ? 'selected' : ''}>2013</option>
            <option value="2012" ${candidate.profileSections[1].toYear == '2012' ? 'selected' : ''}>2012</option>
            <option value="2000" ${candidate.profileSections[1].toYear < '2012' ? 'selected' : ''}>OLDER</option>
          </form:select>
        </div>
      </div>

      <label for="job-description" class="form-label">Mô tả</label>
      <form:textarea id="job-description" class="form-control" placeholder="Mô tả" rows="3" path="profileSections[1].description"/>
    </div>
  </div>

  <div class="profile-section">
    <h3><i class="fas fa-cogs me-2"></i>Kỹ năng</h3>
    <div id="skills-container">
      <div class="row mb-2">
        <div class="col-md-6">
          <label for="skill-1" class="form-label">Skill</label>
          <form:input type="text" id="skill-1" class="form-control" placeholder="Skill" path="profileSections[2].title"/>
        </div>
        <div class="col-md-6">
          <label for="skill-level-1" class="form-label">Level</label>
          <form:input type="text" id="skill-level-1" class="form-control" placeholder="Level" path="profileSections[2].description"/>
        </div>
      </div>
    </div>
  </div>

  <div class="profile-section">
    <h3><i class="fas fa-project-diagram me-2"></i>Dự án cá nhân</h3>
    <div class="mb-3">
      <label for="project-name" class="form-label">Tên dự án</label>
      <form:input path="profileSections[3].title" type="text" id="project-name" class="form-control mb-2" placeholder="Tên dự án"/>

      <div class="row">
        <div class="col-md-3 mb-2">
          <label for="project-start-month" class="form-label">Tháng bắt đầu</label>
          <form:select id="project-start-month" class="form-select" path="profileSections[3].fromMonth">
            <option value="">Chọn tháng</option>
            <option value="1" ${candidate.profileSections[3].fromMonth == '1' ? 'selected' : ''}>Tháng 1</option>
            <option value="2" ${candidate.profileSections[3].fromMonth == '2' ? 'selected' : ''}>Tháng 2</option>
            <option value="3" ${candidate.profileSections[3].fromMonth == '3' ? 'selected' : ''}>Tháng 3</option>
            <option value="4" ${candidate.profileSections[3].fromMonth == '4' ? 'selected' : ''}>Tháng 4</option>
            <option value="5" ${candidate.profileSections[3].fromMonth == '5' ? 'selected' : ''}>Tháng 5</option>
            <option value="6" ${candidate.profileSections[3].fromMonth == '6' ? 'selected' : ''}>Tháng 6</option>
            <option value="7" ${candidate.profileSections[3].fromMonth == '7' ? 'selected' : ''}>Tháng 7</option>
            <option value="8" ${candidate.profileSections[3].fromMonth == '8' ? 'selected' : ''}>Tháng 8</option>
            <option value="9" ${candidate.profileSections[3].fromMonth == '9' ? 'selected' : ''}>Tháng 9</option>
            <option value="10" ${candidate.profileSections[3].fromMonth == '10' ? 'selected' : ''}>Tháng 10</option>
            <option value="11" ${candidate.profileSections[3].fromMonth == '11' ? 'selected' : ''}>Tháng 11</option>
            <option value="12" ${candidate.profileSections[3].fromMonth == '12' ? 'selected' : ''}>Tháng 12</option>
          </form:select>
        </div>
        <div class="col-md-3 mb-2">
          <label for="project-start-year" class="form-label">Năm bắt đầu</label>
          <form:select id="project-start-year" class="form-select" path="profileSections[3].fromYear">
            <option value="">Chọn năm</option>
            <option value="2024" ${candidate.profileSections[3].fromYear == '2024' ? 'selected' : ''}>2024</option>
            <option value="2023" ${candidate.profileSections[3].fromYear == '2023' ? 'selected' : ''}>2023</option>
            <option value="2022" ${candidate.profileSections[3].fromYear == '2022' ? 'selected' : ''}>2022</option>
            <option value="2021" ${candidate.profileSections[3].fromYear == '2021' ? 'selected' : ''}>2021</option>
            <option value="2020" ${candidate.profileSections[3].fromYear == '2020' ? 'selected' : ''}>2020</option>
            <option value="2019" ${candidate.profileSections[3].fromYear == '2019' ? 'selected' : ''}>2019</option>
            <option value="2018" ${candidate.profileSections[3].fromYear == '2018' ? 'selected' : ''}>2018</option>
            <option value="2017" ${candidate.profileSections[3].fromYear == '2017' ? 'selected' : ''}>2017</option>
            <option value="2016" ${candidate.profileSections[3].fromYear == '2016' ? 'selected' : ''}>2016</option>
            <option value="2015" ${candidate.profileSections[3].fromYear == '2015' ? 'selected' : ''}>2015</option>
            <option value="2014" ${candidate.profileSections[3].fromYear == '2014' ? 'selected' : ''}>2014</option>
            <option value="2013" ${candidate.profileSections[3].fromYear == '2013' ? 'selected' : ''}>2013</option>
            <option value="2012" ${candidate.profileSections[3].fromYear == '2012' ? 'selected' : ''}>2012</option>
            <option value="2000" ${candidate.profileSections[3].fromYear < '2012' ? 'selected' : ''}>OLDER</option>
          </form:select>
        </div>
        <div class="col-md-3 mb-2">
          <label for="project-end-month" class="form-label">Tháng kết thúc</label>
          <form:select id="project-end-month" class="form-select" path="profileSections[3].toMonth">
            <option value="">Chọn tháng</option>
             <option value="1" ${candidate.profileSections[3].toMonth == '1' ? 'selected' : ''}>Tháng 1</option>
             <option value="2" ${candidate.profileSections[3].toMonth == '2' ? 'selected' : ''}>Tháng 2</option>
             <option value="3" ${candidate.profileSections[3].toMonth == '3' ? 'selected' : ''}>Tháng 3</option>
             <option value="4" ${candidate.profileSections[3].toMonth == '4' ? 'selected' : ''}>Tháng 4</option>
             <option value="5" ${candidate.profileSections[3].toMonth == '5' ? 'selected' : ''}>Tháng 5</option>
             <option value="6" ${candidate.profileSections[3].toMonth == '6' ? 'selected' : ''}>Tháng 6</option>
             <option value="7" ${candidate.profileSections[3].toMonth == '7' ? 'selected' : ''}>Tháng 7</option>
             <option value="8" ${candidate.profileSections[3].toMonth == '8' ? 'selected' : ''}>Tháng 8</option>
             <option value="9" ${candidate.profileSections[3].toMonth == '9' ? 'selected' : ''}>Tháng 9</option>
            <option value="10" ${candidate.profileSections[3].toMonth == '10' ? 'selected' : ''}>Tháng 10</option>
            <option value="11" ${candidate.profileSections[3].toMonth == '11' ? 'selected' : ''}>Tháng 11</option>
            <option value="12" ${candidate.profileSections[3].toMonth == '12' ? 'selected' : ''}>Tháng 12</option>
          </form:select>
        </div>
        <div class="col-md-3 mb-2">
          <label for="project-end-year" class="form-label">Năm kết thúc</label>
          <form:select id="project-end-year" class="form-select" path="profileSections[3].toYear">
            <option value="">Chọn năm</option>
            <option value="2024" ${candidate.profileSections[3].toYear == '2024' ? 'selected' : ''}>2024</option>
            <option value="2023" ${candidate.profileSections[3].toYear == '2023' ? 'selected' : ''}>2023</option>
            <option value="2022" ${candidate.profileSections[3].toYear == '2022' ? 'selected' : ''}>2022</option>
            <option value="2021" ${candidate.profileSections[3].toYear == '2021' ? 'selected' : ''}>2021</option>
            <option value="2020" ${candidate.profileSections[3].toYear == '2020' ? 'selected' : ''}>2020</option>
            <option value="2019" ${candidate.profileSections[3].toYear == '2019' ? 'selected' : ''}>2019</option>
            <option value="2018" ${candidate.profileSections[3].toYear == '2018' ? 'selected' : ''}>2018</option>
            <option value="2017" ${candidate.profileSections[3].toYear == '2017' ? 'selected' : ''}>2017</option>
            <option value="2016" ${candidate.profileSections[3].toYear == '2016' ? 'selected' : ''}>2016</option>
            <option value="2015" ${candidate.profileSections[3].toYear == '2015' ? 'selected' : ''}>2015</option>
            <option value="2014" ${candidate.profileSections[3].toYear == '2014' ? 'selected' : ''}>2014</option>
            <option value="2013" ${candidate.profileSections[3].toYear == '2013' ? 'selected' : ''}>2013</option>
            <option value="2012" ${candidate.profileSections[3].toYear == '2012' ? 'selected' : ''}>2012</option>
            <option value="2000" ${candidate.profileSections[3].toYear < '2012' ? 'selected' : ''}>OLDER</option>
          </form:select>
        </div>
      </div>

      <label for="project-description" class="form-label">Mô tả ngắn gọn</label>
      <form:textarea id="project-description" class="form-control mb-2" placeholder="Mô tả ngắn gọn" rows="3" path="profileSections[3].description"/>

      <label for="project-url" class="form-label">URL</label>
      <form:input type="url" id="project-url" class="form-control" placeholder="URL" path="profileSections[3].url"/>
    </div>
  </div>

  <div class="profile-section">
    <h3><i class="fas fa-certificate me-2"></i>Giấy chứng nhận</h3>
    <div class="mb-3">
      <label for="certificate-name" class="form-label">Tên chứng chỉ</label>
      <form:input type="text" id="certificate-name" class="form-control mb-2" placeholder="Tên chứng chỉ" path="profileSections[4].title"/>

      <label for="certificate-org" class="form-label">Tổ chức</label>
      <form:input type="text" id="certificate-org" class="form-control mb-2" placeholder="Tổ chức" path="profileSections[4].organization"/>

      <div class="row">
        <div class="col-md-6 mb-2">
          <label for="certificate-month" class="form-label">Tháng phát hành</label>
          <form:select id="certificate-month" class="form-select" path="profileSections[4].fromMonth">
            <option value="">Chọn tháng</option>
            <option value="1" ${candidate.profileSections[4].fromMonth == '1' ? 'selected' : ''}>Tháng 1</option>
            <option value="2" ${candidate.profileSections[4].fromMonth == '2' ? 'selected' : ''}>Tháng 2</option>
            <option value="3" ${candidate.profileSections[4].fromMonth == '3' ? 'selected' : ''}>Tháng 3</option>
            <option value="4" ${candidate.profileSections[4].fromMonth == '4' ? 'selected' : ''}>Tháng 4</option>
            <option value="5" ${candidate.profileSections[4].fromMonth == '5' ? 'selected' : ''}>Tháng 5</option>
            <option value="6" ${candidate.profileSections[4].fromMonth == '6' ? 'selected' : ''}>Tháng 6</option>
            <option value="7" ${candidate.profileSections[4].fromMonth == '7' ? 'selected' : ''}>Tháng 7</option>
            <option value="8" ${candidate.profileSections[4].fromMonth == '8' ? 'selected' : ''}>Tháng 8</option>
            <option value="9" ${candidate.profileSections[4].fromMonth == '9' ? 'selected' : ''}>Tháng 9</option>
            <option value="10" ${candidate.profileSections[4].fromMonth == '10' ? 'selected' : ''}>Tháng 10</option>
            <option value="11" ${candidate.profileSections[4].fromMonth == '11' ? 'selected' : ''}>Tháng 11</option>
            <option value="12" ${candidate.profileSections[4].fromMonth == '12' ? 'selected' : ''}>Tháng 12</option>
          </form:select>
        </div>
        <div class="col-md-6 mb-2">
          <label for="certificate-year" class="form-label">Năm phát hành</label>
          <form:select id="certificate-year" class="form-select" path="profileSections[4].fromYear">
            <option value="">Chọn năm</option>
            <option value="2024" ${candidate.profileSections[4].fromYear == '2024' ? 'selected' : ''}>2024</option>
            <option value="2023" ${candidate.profileSections[4].fromYear == '2023' ? 'selected' : ''}>2023</option>
            <option value="2022" ${candidate.profileSections[4].fromYear == '2022' ? 'selected' : ''}>2022</option>
            <option value="2021" ${candidate.profileSections[4].fromYear == '2021' ? 'selected' : ''}>2021</option>
            <option value="2020" ${candidate.profileSections[4].fromYear == '2020' ? 'selected' : ''}>2020</option>
            <option value="2019" ${candidate.profileSections[4].fromYear == '2019' ? 'selected' : ''}>2019</option>
            <option value="2018" ${candidate.profileSections[4].fromYear == '2018' ? 'selected' : ''}>2018</option>
            <option value="2017" ${candidate.profileSections[4].fromYear == '2017' ? 'selected' : ''}>2017</option>
            <option value="2016" ${candidate.profileSections[4].fromYear == '2016' ? 'selected' : ''}>2016</option>
            <option value="2015" ${candidate.profileSections[4].fromYear == '2015' ? 'selected' : ''}>2015</option>
            <option value="2014" ${candidate.profileSections[4].fromYear == '2014' ? 'selected' : ''}>2014</option>
            <option value="2013" ${candidate.profileSections[4].fromYear == '2013' ? 'selected' : ''}>2013</option>
            <option value="2012" ${candidate.profileSections[4].fromYear == '2012' ? 'selected' : ''}>2012</option>
            <option value="2000" ${candidate.profileSections[4].fromYear < '2012' ? 'selected' : ''}>OLDER</option>
          </form:select>
        </div>
      </div>

      <label for="certificate-url" class="form-label">URL chứng chỉ</label>
      <form:input type="url" id="certificate-url" class="form-control mb-2" placeholder="URL chứng chỉ" path="profileSections[4].url"/>

      <label for="certificate-description" class="form-label">Mô tả</label>
      <form:textarea id="certificate-description" class="form-control" placeholder="Mô tả" rows="3" path="profileSections[4].description"/>
    </div>
  </div>

  <div class="profile-section">
    <h3><i class="fas fa-trophy me-2"></i>Giải thưởng</h3>
    <div class="mb-3">
      <label for="award-name" class="form-label">Tên giải thưởng</label>
      <form:input type="text" id="award-name" class="form-control mb-2" placeholder="Tên giải thưởng" path="profileSections[5].title"/>

      <label for="award-org" class="form-label">Tổ chức trao giải</label>
      <form:input type="text" id="award-org" class="form-control mb-2" placeholder="Tổ chức trao giải" path="profileSections[5].organization"/>

      <div class="row">
        <div class="col-md-6 mb-2">
          <label for="award-month" class="form-label">Tháng phát hành</label>
          <form:select id="award-month" class="form-select" path="profileSections[5].fromMonth">
            <option value="">Chọn tháng</option>
             <option value="1" ${candidate.profileSections[5].fromMonth == '1' ? 'selected' : ''}>Tháng 1</option>
             <option value="2" ${candidate.profileSections[5].fromMonth == '2' ? 'selected' : ''}>Tháng 2</option>
             <option value="3" ${candidate.profileSections[5].fromMonth == '3' ? 'selected' : ''}>Tháng 3</option>
             <option value="4" ${candidate.profileSections[5].fromMonth == '4' ? 'selected' : ''}>Tháng 4</option>
             <option value="5" ${candidate.profileSections[5].fromMonth == '5' ? 'selected' : ''}>Tháng 5</option>
             <option value="6" ${candidate.profileSections[5].fromMonth == '6' ? 'selected' : ''}>Tháng 6</option>
             <option value="7" ${candidate.profileSections[5].fromMonth == '7' ? 'selected' : ''}>Tháng 7</option>
             <option value="8" ${candidate.profileSections[5].fromMonth == '8' ? 'selected' : ''}>Tháng 8</option>
             <option value="9" ${candidate.profileSections[5].fromMonth == '9' ? 'selected' : ''}>Tháng 9</option>
            <option value="10" ${candidate.profileSections[5].fromMonth == '10' ? 'selected' : ''}>Tháng 10</option>
            <option value="11" ${candidate.profileSections[5].fromMonth == '11' ? 'selected' : ''}>Tháng 11</option>
            <option value="12" ${candidate.profileSections[5].fromMonth == '12' ? 'selected' : ''}>Tháng 12</option>
          </form:select>
        </div>
        <div class="col-md-6 mb-2">
          <label for="award-year" class="form-label">Năm phát hành</label>
          <form:select id="award-year" class="form-select" path="profileSections[5].fromYear">
            <option value="">Chọn năm</option>
            <option value="2024" ${candidate.profileSections[5].fromYear == '2024' ? 'selected' : ''}>2024</option>
            <option value="2023" ${candidate.profileSections[5].fromYear == '2023' ? 'selected' : ''}>2023</option>
            <option value="2022" ${candidate.profileSections[5].fromYear == '2022' ? 'selected' : ''}>2022</option>
            <option value="2021" ${candidate.profileSections[5].fromYear == '2021' ? 'selected' : ''}>2021</option>
            <option value="2020" ${candidate.profileSections[5].fromYear == '2020' ? 'selected' : ''}>2020</option>
            <option value="2019" ${candidate.profileSections[5].fromYear == '2019' ? 'selected' : ''}>2019</option>
            <option value="2018" ${candidate.profileSections[5].fromYear == '2018' ? 'selected' : ''}>2018</option>
            <option value="2017" ${candidate.profileSections[5].fromYear == '2017' ? 'selected' : ''}>2017</option>
            <option value="2016" ${candidate.profileSections[5].fromYear == '2016' ? 'selected' : ''}>2016</option>
            <option value="2015" ${candidate.profileSections[5].fromYear == '2015' ? 'selected' : ''}>2015</option>
            <option value="2014" ${candidate.profileSections[5].fromYear == '2014' ? 'selected' : ''}>2014</option>
            <option value="2013" ${candidate.profileSections[5].fromYear == '2013' ? 'selected' : ''}>2013</option>
            <option value="2012" ${candidate.profileSections[5].fromYear == '2012' ? 'selected' : ''}>2012</option>
            <option value="2000" ${candidate.profileSections[5].fromYear < '2012' ? 'selected' : ''}>OLDER</option>
          </form:select>
        </div>
      </div>

      <label for="award-description" class="form-label">Mô tả</label>
      <form:textarea id="award-description" class="form-control" placeholder="Mô tả" rows="3" path="profileSections[5].description"/>
    </div>
  </div>

  <button type="submit" class="btn btn-primary mt-3 mx-auto d-block"  onclick="saveProfile()">
    <i class="fas fa-save me-2"></i>Lưu hồ sơ
  </button>
  </form:form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // Function to trigger the file input click
  function triggerFileInput() {
    document.getElementById('imageInput').click();
  }

  // Function to display the selected image
  function displaySelectedImage(event) {
    const file = event.target.files[0];
    const image = document.getElementById('uploadImage');
    const reader = new FileReader();

    reader.onload = function(e) {
      image.src = e.target.result; // Update image source
    };

    if (file) {
      reader.readAsDataURL(file); // Read the file as a data URL
    }
  }
</script>
</body>
</html>