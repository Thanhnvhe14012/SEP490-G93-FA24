<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CV no ${candidate.cvSections[0].candidateCvNo}</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
  <style>
    :root {
      --primary-color: #3498db;
      --secondary-color: #2c3e50;
      --accent-color: #e74c3c;
      --light-color: #ecf0f1;
      --dark-color: #34495e;
    }

    body {
      font-family: 'Roboto', sans-serif;
      background-color: var(--light-color);
      color: var(--dark-color);
    }

    .profile-container {
      max-width: 1200px;
      margin: 50px auto;
      background-color: #fff;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
      border-radius: 15px;
      overflow: hidden;
    }

    .profile-header {
      background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
      color: #fff;
      padding: 40px;
      text-align: center;
    }

    .profile-img {
      width: 150px;
      height: 150px;
      border-radius: 50%;
      border: 5px solid #fff;
      margin-bottom: 20px;
    }

    .section {
      padding: 30px;
      border-bottom: 1px solid var(--light-color);
    }

    .section-title {
      color: var(--primary-color);
      font-weight: bold;
      margin-bottom: 20px;
      display: flex;
      align-items: center;
    }

    .section-title i {
      margin-right: 10px;
      font-size: 24px;
    }

    .skill-bar {
      height: 10px;
      background-color: var(--light-color);
      border-radius: 5px;
      margin-bottom: 10px;
      position: relative;
    }

    .skill-progress {
      height: 100%;
      background-color: var(--accent-color);
      border-radius: 5px;
    }

    .skill-info {
      position: absolute;
      top: 100%;
      left: 50%;
      transform: translateX(-50%);
      color: var(--dark-color);
      font-weight: bold;
      font-size: 16px;
    }

    .timeline {
      position: relative;
      padding-left: 30px;
    }

    .timeline-item {
      position: relative;
      margin-bottom: 30px;
    }

    .timeline-item:before {
      content: '';
      position: absolute;
      left: -38px;
      top: 0;
      width: 16px;
      height: 16px;
      border-radius: 50%;
      background-color: var(--accent-color);
      border: 3px solid #fff;
    }

    .timeline-item:after {
      content: '';
      position: absolute;
      left: -30px;
      top: 0;
      bottom: -30px;
      width: 2px;
      background-color: var(--light-color);
    }

    .contact-info {
      display: flex;
      justify-content: center;
      flex-wrap: wrap;
      gap: 20px;
      margin-top: 20px;
    }

    .contact-info span {
      display: flex;
      align-items: center;
    }

    .contact-info i {
      margin-right: 5px;
    }

    .editable {
      position: relative;
      padding: 5px;
      border-radius: 5px;
      transition: background-color 0.3s;
    }

    .editable:hover {
      background-color: rgba(52, 152, 219, 0.1);
    }

    .editable input,
    .editable textarea {
      background-color: transparent;
      border: none;
      color: inherit;
      font-size: inherit;
      font-family: inherit;
      padding: 0;
      margin: 0;
      width: 100%;
      resize: none;
      overflow: hidden;
    }

    /*.skill-width-input {*/
    /*  background-color: transparent;*/
    /*  border: none;*/
    /*  color: inherit;*/
    /*  font-size: inherit;*/
    /*  font-family: inherit;*/
    /*  padding: 0;*/
    /*  margin: 0;*/
    /*  width: auto;*/
    /*  text-align: right;*/
    /*}*/

    #submit-btn {
      position: fixed;
      bottom: 20px;
      right: 20px;
      background-color: var(--primary-color);
      color: white;
      border: none;
      border-radius: 50%;
      width: 60px;
      height: 60px;
      font-size: 24px;
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
      z-index: 1000;
    }
  </style>
</head>
<body>
<form:form id="updateCV" action="/update-cv/${candidate.cvSections[0].candidateCvNo}" method="post"
           modelAttribute="candidate" enctype="multipart/form-data">
  <div class="profile-container">
    <form:hidden path="id" />
    <form:hidden path="account" />
    <form:hidden path="accountId" />
    <form:hidden path="biography" />
    <form:hidden path="cvSections[0].image"/>
    <form:hidden path="cvSections[0].id" />
    <form:hidden path="cvSections[1].id" />
    <form:hidden path="cvSections[2].id" />
    <form:hidden path="cvSections[3].id" />
    <form:hidden path="cvSections[4].id" />
    <form:hidden path="cvSections[5].id" />
    <form:hidden path="cvSections[6].id" />
    <form:hidden path="cvSections[7].id" />
    <form:hidden path="cvSections[0].candidateCvNo" />
    <form:hidden path="cvSections[1].candidateCvNo" />
    <form:hidden path="cvSections[2].candidateCvNo" />
    <form:hidden path="cvSections[3].candidateCvNo" />
    <form:hidden path="cvSections[4].candidateCvNo" />
    <form:hidden path="cvSections[5].candidateCvNo" />
    <form:hidden path="cvSections[6].candidateCvNo" />
    <form:hidden path="cvSections[7].candidateCvNo" />
    <form:hidden path="cvSections[0].section" />
    <form:hidden path="cvSections[1].section" />
    <form:hidden path="cvSections[2].section" />
    <form:hidden path="cvSections[3].section" />
    <form:hidden path="cvSections[4].section" />
    <form:hidden path="cvSections[5].section" />
    <form:hidden path="cvSections[6].section" />
    <form:hidden path="cvSections[7].section" />
    <div class="profile-header">
      <img id="uploadImage" src="${candidate.cvSections[0].image}"
           alt="Ảnh đại diện" class="profile-img"  onclick="triggerCVFileInput()" style="cursor: pointer;">
      <input id="imageInput" name="imageInput" type="file" onchange="displayCVSelectedImage(event)" style="display: none"/>
      <h1 class="editable">${candidate.account.firstName} ${candidate.account.middleName}
          ${candidate.account.lastName}</h1>

      <p class="lead editable">
        <form:input type="text" path="cvSections[0].title" placeholder="Vị trí ứng tuyển" />
      </p>
      <p class="editable">
        <form:textarea path="cvSections[0].description" rows="3"
                       placeholder="Mục tiêu nghề nghiệp của bạn, bao gồm mục tiêu ngắn hạn và dài hạn" />
      </p>
      <div class="contact-info">
                  <span class="editable"><i class="fas fa-phone"></i>
                    <form:input type="text" path="cvSections[0].organization" placeholder="0123 456 789" />
                  </span>
        <span class="editable"><i class="fas fa-envelope"></i>${candidate.account.email}</span>
        <span class="editable"><i class="fab fa-facebook"></i>
                    <form:input type="text" path="cvSections[0].client" placeholder="fb.com/abc" />
                  </span>
        <span class="editable"><i class="fas fa-map-marker-alt"></i>${candidate.account.address}</span>
      </div>
    </div>

    <div class="section">
      <h2 class="section-title"><i class="fas fa-briefcase"></i> KINH NGHIỆM LÀM VIỆC</h2>
      <div class="timeline">
        <div class="timeline-item">
          <h4 class="editable">
            <form:input type="text" placeholder="Vị trí công việc" path="cvSections[1].title" />
          </h4>
          <p class="editable">
            <form:input type="text" placeholder="Tên công ty | Bắt đầu - Kết thúc"
                        path="cvSections[1].organization" />
          </p>
          <p class="editable">
            <form:textarea rows="3" path="cvSections[1].description"
                           placeholder="Mô tả kinh nghiệm làm việc của bạn" />
          </p>
        </div>
      </div>
    </div>

    <div class="section">
      <h2 class="section-title"><i class="fas fa-graduation-cap"></i> HỌC VẤN</h2>
      <div class="timeline">
        <div class="timeline-item">
          <h4 class="editable">
            <form:input type="text" path="cvSections[2].organization" placeholder="Tên trường học" />
          </h4>
          <p class="editable">
            <form:input type="text" placeholder="Ngành học / Môn học | Bắt đầu - Kết thúc"
                        path="cvSections[2].title" />
          </p>
          <p class="editable">
            <form:textarea rows="3" path="cvSections[2].description" placeholder="Mô tả" />
          </p>
        </div>
      </div>
    </div>

    <div class="section">
      <h2 class="section-title"><i class="fas fa-project-diagram"></i> DỰ ÁN</h2>
      <div class="timeline">
        <div class="timeline-item">
          <h4 class="editable">
            <form:input type="text" placeholder="Tên dự án" path="cvSections[3].organization" />
          </h4>
          <p class="editable"><strong>Vị trí:</strong>
            <form:input type="text" placeholder="Vị trí của bạn trong dự án" path="cvSections[3].title" />
          </p>
          <p class="editable"><strong>Khách hàng:</strong>
            <form:input type="text" placeholder="Tên khách hàng" path="cvSections[3].client" />
          </p>
          <p class="editable"><strong>Số lượng người tham gia:</strong>
            <form:input type="text" placeholder="Số lượng" path="cvSections[3].team" />
          </p>
          <p class="editable"><strong>Công nghệ sử dụng:</strong>
            <form:input type="text" placeholder="Mô tả công nghệ bạn sử dụng"
                        path="cvSections[3].techstack" />
          </p>
          <p class="editable">
            <form:textarea rows="3" path="cvSections[3].description"
                           placeholder="Mô tả vai trò, trách nhiệm của bạn trong dự án" />
          </p>
        </div>
      </div>
    </div>

    <div class="section">
      <h2 class="section-title"><i class="fas fa-certificate"></i> CHỨNG CHỈ</h2>
      <ul class="list-unstyled">
        <li class="editable">
          <form:input type="text" placeholder="Tên chứng chỉ - Thời gian" path="cvSections[4].description" />
        </li>
      </ul>
    </div>

    <div class="section">
      <h2 class="section-title"><i class="fas fa-heart"></i> SỞ THÍCH</h2>
      <p class="editable">
        <form:textarea rows="3" placeholder="Liệt kê các sở thích của bạn" path="cvSections[5].description" />
      </p>
    </div>

    <div class="section">
      <h2 class="section-title"><i class="fas fa-users"></i> NGƯỜI GIỚI THIỆU</h2>
      <p class="editable">
        <form:textarea path="cvSections[6].description" rows="3"
                       placeholder="Thông tin người tham chiếu bao gồm tên, chức vụ và thông tin liên hệ" />
      </p>
    </div>

    <div class="section">
      <h2 class="section-title"><i class="fas fa-trophy"></i> DANH HIỆU VÀ GIẢI THƯỞNG</h2>
      <ul class="list-unstyled">
        <li class="editable">
          <form:input type="text" placeholder="Tên giải thưởng - Thời gian"
                      path="cvSections[7].description" />
        </li>
      </ul>
    </div>

    <button id="submit-btn" type="submit"><i class="fas fa-save"></i></button>
  </div>
</form:form>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>
  // Function to trigger the file input click
  function triggerCVFileInput() {
    document.getElementById('imageInput').click();
  }

  // Function to display the selected image
  function displayCVSelectedImage(event) {
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
  document.addEventListener('DOMContentLoaded', function () {
    const editables = document.querySelectorAll('.editable input, .editable textarea');
    const skillWidthInputs = document.querySelectorAll('.skill-width-input');

    // Adjust textarea heights
    document.querySelectorAll('textarea').forEach(textarea => {
      textarea.style.height = 'auto';
      textarea.style.height = textarea.scrollHeight + 'px';
      textarea.addEventListener('input', function () {
        this.style.height = 'auto';
        this.style.height = this.scrollHeight + 'px';
      });
    });

    // Update skill bars when input changes
    <%--skillWidthInputs.forEach(input => {--%>
    <%--  input.addEventListener('input', function () {--%>
    <%--    const skillBar = this.closest('.skill-bar');--%>
    <%--    const skillProgress = skillBar.querySelector('.skill-progress');--%>
    <%--    skillProgress.style.width = `${this.value}%`;--%>
    <%--  });--%>
    <%--});--%>
  });
</script>
</body>
</html>