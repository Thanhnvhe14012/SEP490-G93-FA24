<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Permissions-Policy" content="interest-cohort=()">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Responsive Resume CV</title>

    <!-- Import Fontawesome -->
    <script src="https://kit.fontawesome.com/cb81440751.js" crossorigin="anonymous"></script>

    <!-- Import stylesheets in CSS3 -->
    <link rel="stylesheet" href="/assets/css/cv/cvStyleTemplate1.css">
</head>

<body>

<main class="l-main bd-container">
    <!-- Resume CV -->
    <div class="resume" id="area-cv">
        <div class="resume_left">

            <!-- HOME -->
            <section class="home" id="home">
                <div class="home_container section bd-grid">

                    <div class="home_data bd-grid">
                        <label for="image-upload" class="image-upload-label">
                            <img src="/assets/img/profile.jpg" alt="Icon picture" class="home_img"
                                 id="home-img">
                            <input type="file" id="image-upload" accept="image/*" style="display: none;">
                        </label>
                        <div class="editable" id="name" contenteditable="true">
                            <h1 class="home_title">Nguyễn Văn A</h1>
                        </div>
                        <div class="editable" id="job" contenteditable="true">
                            <h3 class="home_profession">Kỹ sư phần mềm</h3>
                        </div>
                        <div>
                            <a download="" id="download-button" class="home_button-movil">Download</a>
                        </div>
                    </div>

                    <div class="home_address bd-grid">
                            <span class="home_information">
                                <i class="fa-solid fa-location-dot home_icon"></i>
                                <div class="editable" id="address" contenteditable="true">
                                    Hà Nội - Việt Nam
                                </div>
                            </span>
                        <span class="home_information">
                                <a href="mailto:nguyenvana@gmail.com" class="home_link" id="email-link">
                                    <i class="fa-solid fa-envelope home_icon"></i>
                                    <span class="editable" id="email-address"
                                          contenteditable="true">nguyenvana@gmail.com</span>
                                </a>
                            </span>
                        <span class="home_information">
                                <a href="tel:+1234567890" class="home_link" id="phone-link">
                                    <i class="fa-solid fa-phone home_icon"></i>
                                    <span class="editable" id="phone-number" contenteditable="true">+1234567890</span>
                                </a>
                            </span>
                    </div>
                </div>

                <!-- Theme change button -->
                <i class="fa-solid fa-moon change-theme" title="Theme" id="theme-button"></i>

                <!-- Button to generate and download the pdf. Available for desktop. -->
                <i class="fa-solid fa-download generate-pdf" title="Generate PDF" id="resume-button"></i>

            </section>

            <!-- SOCIAL -->
            <section class="social section">
                <div class="editable" id="section-title" contenteditable="true">
                    <h2 class="section-title">Liên hệ</h2>
                </div>
                <div class="social_container bd-grid">
                    <a href="javascript:void(0)" class="social_link" id="facebook-link">
                        <i class="fa-brands fa-facebook social_icon"></i>
                        <span class="editable" id="facebook-username" contenteditable="true">Facebook</span>
                    </a>
                    <a href="javascript:void(0)" class="social_link" id="facebook-link">
                        <i class="fa-brands fa-instagram social_icon"></i>
                        <span class="editable" id="instagram-username" contenteditable="true">Instagram</span>
                    </a>
                    <a href="https://www.linkedin.com/in/linkedin" target="_blank" class="social_link"
                       id="linkedin-link">
                        <i class="fa-brands fa-linkedin social_icon"></i>
                        <span class="editable" id="linkedin-username" contenteditable="true">LinkedIn</span>
                    </a>
                </div>
            </section>

            <!-- PROFILE -->
            <section class="profile section" id="profile">
                <div class="editable" id="section-content" contenteditable="true">
                    <h2 class="section-title">Mô tả</h2>
                </div>
                <div class="editable" contenteditable="true">
                    <p class="profile_description">
                        Giới thiệu về bản thân
                    </p>
                </div>
            </section>

            <!-- SKILLS  -->
            <section class="skills section" id="skills">
                <div class="editable" id="section-title" contenteditable="true">
                    <h2 class="section-title">Kỹ Năng</h2>
                </div>
                <div class="editable" id="section-content" contenteditable="true">
                    <div class="skills_container">
                        <div class="skills_content bd-grid">
                            <div class="skills_name">
                                <span class="skills_text">CSS</span>
                                <div class="skills_box">
                                    <span class="skills_progress" style="width: 85%;"></span>
                                </div>
                            </div>
                            <div class="skills_name">
                                <span class="skills_text">Git</span>
                                <div class="skills_box">
                                    <span class="skills_progress" style="width: 75%;"></span>
                                </div>
                            </div>
                            <div class="skills_name">
                                <span class="skills_text">HTML</span>
                                <div class="skills_box">
                                    <span class="skills_progress" style="width: 95%;"></span>
                                </div>
                            </div>
                            <div class="skills_name">
                                <span class="skills_text">Javascript</span>
                                <div class="skills_box">
                                    <span class="skills_progress" style="width: 80%;"></span>
                                </div>
                            </div>
                            <div class="skills_name">
                                <span class="skills_text">MySQL</span>
                                <div class="skills_box">
                                    <span class="skills_progress" style="width: 70%;"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </section>

            <!-- LANGUAGES -->
            <section class="languages section" id="languages">
                <div class="editable" id="section-title" contenteditable="true">
                    <h2 class="section-title">Ngôn Ngữ</h2>
                </div>
                <div class="editable" id="section-content" contenteditable="true">
                    <div class="languages_container">
                        <ul class="languages_content bd-grid">
                            <li class="languages_name">
                                <span class="languages_text">Tiếng Anh</span>
                                <span class="languages_stars">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </span>
                            </li>
                            <li class="languages_name">
                                <span class="languages_text">Tiếng Nhật</span>
                                <span class="languages_stars">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star languages_stars_checked"></i>
                                        <i class="fa-solid fa-star languages_stars_checked"></i>
                                    </span>
                            </li>
                        </ul>
                    </div>
                </div>
            </section>

        </div>

        <div class="resume_right">

            <!-- EXPERIENCE -->
            <section class="experience section" id="experience">
                <div class="editable" id="section-title" contenteditable="true">
                    <h2 class="section-title">Kinh nghiệm làm việc</h2>
                </div>
                <div data-html2canvas-ignore="true" class="add-experience-container">
                    <button id="add-experience-btn">Thêm Kinh Nghiệm</button>
                </div>
                <div class="experience_container bd-grid" id="experience-container">
                    <div class="experience_content">
                        <div class="experience_time">
                            <span class="experience_rounder"></span>
                            <span class="experience_line"></span>
                        </div>
                        <div class="experience_data bd-grid">
                            <h3 class="editable experience_title" contenteditable="true">Lập Trình Viên</h3>
                            <span class="editable experience_company" contenteditable="true">Công ty THHH Một Mình
                                    Tôi - Hà Nội</span>
                            <span class="editable experience_year" contenteditable="true">10/2022 - Hiện tại</span>
                            <p class="editable experience_description" contenteditable="true">
                                Mô tả kinh nghiệm
                            </p>
                        </div>
                    </div>
                </div>

                <div style="display: none;" id="experience-template">
                    <div class="experience_content">
                        <div class="experience_time">
                            <span class="experience_rounder"></span>
                            <span class="experience_line"></span>
                        </div>
                        <div class="experience_data bd-grid">
                            <h3 class="editable experience_title" contenteditable="true">Vị trí công việc</h3>
                            <span class="editable experience_company" contenteditable="true">Tên công ty</span>
                            <span class="editable experience_year" contenteditable="true">Bắt đầu - kết thúc</span>
                            <p class="editable experience_description" contenteditable="true">
                                Mô tả kinh nghiệm
                            </p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- CERTIFICATES -->
            <section class="certificate section" id="certificates">
                <h2 class="editable section-title" contenteditable="true">Chứng Chỉ</h2>

                <div class="certificate_container bd-grid">
                    <div class="certificate_content">
                        <div class="certificate_item">
                            <span class="certificate_rounder"></span>
                        </div>
                        <div class="certificate_data bd-grid">
                            <h3 class="certificate_year">2023</h3>
                            <span class="certificate_title">Masters in Computer Science</span>
                        </div>
                    </div>
                    <div class="certificate_content">
                        <div class="certificate_item">
                            <span class="certificate_rounder"></span>
                        </div>
                        <div class="certificate_data bd-grid">
                            <h3 class="certificate_year">2018</h3>
                            <span class="certificate_title">High School diploma in Sciences, speciality Mathematics
                                </span>
                        </div>
                    </div>
                </div>
            </section>

            <!-- EDUCATION -->
            <section class="education section" id="education">
                <h2 class="section-title">Education</h2>

                <div class="education_container bd-grid">
                    <div class="education_content">
                        <div class="education_time">
                            <span class="education_rounder"></span>
                            <span class="education_line"></span>
                        </div>
                        <div class="education_data bd-grid">
                            <h3 class="education_title">Masters in Computer Science</h3>
                            <span class="education_studies">Đại học FPT Hà Nội</span>
                            <span class="education_year">2021 - 2023</span>
                        </div>
                    </div>
                    <div class="education_content">
                        <div class="education_time">
                            <span class="education_rounder"></span>
                        </div>
                        <div class="education_data bd-grid">
                            <h3 class="education_title">High School diploma in Sciences, speciality Mathematics</h3>
                            <span class="education_studies">THPT Lê Quý Đôn</span>
                            <span class="education_year">2015 - 2018</span>
                        </div>
                    </div>
                </div>
            </section>

            <!-- INTERESTS -->
            <section class="interests section" id="interests">
                <h2 class="section-title">Interests</h2>
                <div class="interests_container bd-grid">
                    <div class="interests_content">
                        <i class="fa-solid fa-paw interests_icon"></i>
                        <span class="interests_name">Động vật</span>
                    </div>
                    <div class="interests_content">
                        <i class="fa-solid fa-film interests_icon"></i>
                        <span class="interests_name">Phim ảnh</span>
                    </div>
                    <div class="interests_content">
                        <i class="fa-solid fa-gamepad interests_icon"></i>
                        <span class="interests_name">Games</span>
                    </div>
                </div>
            </section>

        </div>
    </div>
</main>

<a href="#" class="scrolltop" id="scroll-top">
    <i class="fa-solid fa-arrow-up scrolltop_icon"></i>
</a>
<script src="/assets/js/cv/html2pdf.v0.9.3.bundle.min.js"></script>
<script src="/assets/js/cv/cvTemplate1.js"></script>
</body>

</html>
