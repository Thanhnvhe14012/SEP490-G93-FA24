/* Set picture in url base 64 */

const img = document.getElementById('home-img');

const showMenu = (toggleId, navId) => {
    const toggle = document.getElementById(toggleId);
    nav = document.getElementById(navId);

    // Validate that variables exist
    if (toggle && nav) {
        toggle.addEventListener('click', () => {
            // We add the show-menu class to the div tag with the nav__menu class
            nav.classList.toggle('show-menu');
        });
    }
}

showMenu('nav-toggle', 'nav-menu');

/* Remove menu mobile */

const navLink = document.querySelectorAll('.nav_link');

function linkAction() {
    const navMenu = document.getElementById('nav-menu');
    // When we click on each nav__link, we remove the show-menu class
    navMenu.classList.remove('show-menu');
}

navLink.forEach(n => n.addEventListener('click', linkAction));

/* Scroll sections active link */

const sections = document.querySelectorAll('section[id]');

function scrollActive() {
    const scrollY = window.pageYOffset;

    sections.forEach(current => {
        const sectionHeight = current.offsetHeight;
        const sectionTop = current.offsetTop - 50;
        sectionId = current.getAttribute('id');

        if (scrollY > sectionTop && scrollY <= sectionTop + sectionHeight) {
            document.querySelector('.nav_menu a[href*=' + sectionId + ']').classList.add('active-link');
        } else {
            document.querySelector('.nav_menu a[href*=' + sectionId + ']').classList.remove('active-link');
        }
    });
}

window.addEventListener('scroll', scrollActive);

/* Show scroll top */

function scrollTop() {
    const scrollTop = document.getElementById('scroll-top');
    if (this.scrollY >= 200) {
        scrollTop.classList.add('show-scroll');
    } else {
        scrollTop.classList.remove('show-scroll');
    }
}

window.addEventListener('scroll', scrollTop);

/* Light/Dark mode */

const themeButton = document.getElementById('theme-button');
let darkTheme = 'dark-theme';
let darkMode = localStorage.getItem("dark-mode");

function enableDarkMode() {
    document.body.classList.add(darkTheme);
    themeButton.classList.add('fa-sun');
    themeButton.classList.remove('fa-moon');
    localStorage.setItem("dark-mode", "enabled");
};

function disableDarkMode() {
    document.body.classList.remove(darkTheme);
    themeButton.classList.add('fa-moon');
    themeButton.classList.remove('fa-sun');
    localStorage.setItem("dark-mode", "disabled");
};

if (darkMode === "enabled") {
    enableDarkMode();
}

themeButton.addEventListener("click", () => {
    darkMode = localStorage.getItem("dark-mode");
    if (darkMode === "disabled") {
        enableDarkMode();
    } else {
        disableDarkMode();
    }
});

/* Link PDF Download on Mobile screen depending of the light/dark mode */

const downloadButton = document.getElementById('download-button');

downloadButton.addEventListener('click', () => {
    if (document.body.classList.contains(darkTheme)) {
        downloadButton.href = "assets/pdf/myResumeCV-dark.pdf";
    } else {
        downloadButton.href = "assets/pdf/myResumeCV-light.pdf";
    }
});

/* Reduce the size and print on an A4 sheet */

function addScaleCV() {
    document.body.classList.add("scale-cv");
}

/* Remote the size when the CV is downloaded */

function removeScaleCV() {
    document.body.classList.remove("scale-cv");
}

/* Generate PDF */

// PDF generated area
let areaCV = document.getElementById('area-cv');

// Button
let resumeButton = document.getElementById("resume-button");

// Generate PDF with html2pdf.js
function generateResume() {
    // PDF filename change depending of the light/dark mode
    if (document.body.classList.contains(darkTheme)) {
        // html2pdf.js options
        let opt = {
            margin: 0,
            filename: 'myCV-dark.pdf',
            image: {type: 'jpeg', quality: 0.98},
            html2canvas: {scale: 4, useCORS: true},
            jsPDF: {format: 'a4', orientation: 'portrait'}
        };
        html2pdf(areaCV, opt);
    } else {
        // html2pdf.js options
        let opt = {
            margin: 0,
            filename: 'myCV-light.pdf',
            image: {type: 'jpeg', quality: 0.98},
            html2canvas: {scale: 4, useCORS: true},
            jsPDF: {format: 'a4', orientation: 'portrait'}
        };
        html2pdf(areaCV, opt);
    }
}

// Action executed by clicking on the button => generation of the final PDF CV CV
resumeButton.addEventListener("click", () => {
    // Adapt the area of the PDF
    addScaleCV();
    // Generate the PDF
    generateResume();
    // Remove adaptation after 1 second (you can choose to set more than 1 second if your PDF download time is long)
    setTimeout(removeScaleCV, 1000);
});

// Get the image upload input and the icon picture element
const imageUpload = document.getElementById('image-upload');
const iconPicture = document.getElementById('home-img');

// Add event listener to handle image upload
imageUpload.addEventListener('change', function () {
    const file = imageUpload.files[0];
    const reader = new FileReader();

    reader.onload = function (e) {
        iconPicture.src = e.target.result;
    };

    if (file) {
        reader.readAsDataURL(file);
    }
});

// Get the email address element and link
const emailSpan = document.getElementById('email-address');
const emailLink = document.getElementById('email-link');

// Function to update the email link with the edited address
function updateEmailLink() {
    const newEmail = emailSpan.textContent.trim();
    emailLink.setAttribute('href', `mailto:${newEmail}`);
}

// Add event listener to update the email link when editing is finished
emailSpan.addEventListener('input', updateEmailLink);

// Add event listener to toggle contenteditable when the link is clicked
emailLink.addEventListener('click', function (e) {
    e.preventDefault(); // Prevent the default behavior of the link
    emailSpan.setAttribute('contenteditable', 'true');
    emailSpan.focus(); // Focus on the editable span
});

// Add event listener to disable contenteditable when focus is lost
emailSpan.addEventListener('blur', function () {
    emailSpan.removeAttribute('contenteditable');
});

// Get the phone number element and link
const phoneSpan = document.getElementById('phone-number');
const phoneLink = document.getElementById('phone-link');

// Function to update the phone link with the edited number
function updatePhoneLink() {
    const newPhone = phoneSpan.textContent.trim();
    phoneLink.setAttribute('href', `tel:${newPhone}`);
}

// Add event listener to update the phone link when editing is finished
phoneSpan.addEventListener('input', updatePhoneLink);

// Add event listener to toggle contenteditable when the link is clicked
phoneLink.addEventListener('click', function (e) {
    e.preventDefault(); // Prevent the default behavior of the link
    phoneSpan.setAttribute('contenteditable', 'true');
    phoneSpan.focus(); // Focus on the editable span
});

// Add event listener to disable contenteditable when focus is lost
phoneSpan.addEventListener('blur', function () {
    phoneSpan.removeAttribute('contenteditable');
});

// Get the LinkedIn username element and link
const linkedinUsername = document.getElementById('linkedin-username');
const linkedinLink = document.getElementById('linkedin-link');

// Function to update the LinkedIn link with the edited username
function updateLinkedInLink() {
    const newUsername = linkedinUsername.textContent.trim();
    linkedinLink.setAttribute('href', `https://www.linkedin.com/in/${newUsername}`);
}

// Prevent the default behavior of the link when clicked for editing
linkedinUsername.addEventListener('click', function (event) {
    event.preventDefault();
});

// Add an event listener to update the link when editing is finished
linkedinUsername.addEventListener('input', updateLinkedInLink);

const experienceSection = document.getElementById("experience");
const addButton = document.getElementById("add-experience");
const experienceContainer = document.querySelector(".experience_container");

// Show add button when experience section is clicked
experienceSection.addEventListener("click", function () {
    addButton.style.display = "block";
});

// Add experience section
addButton.addEventListener("click", function () {
    const newExperience = document.createElement("div");
    newExperience.classList.add("experience_content");
    newExperience.innerHTML = `
        <div class="experience_time">
            <span class="experience_rounder"></span>
            <span class="experience_line"></span>
        </div>
        <div class="experience_data bd-grid">
            <h3 class="editable experience_title" contenteditable="true">Lập Trình Viên</h3>
            <span class="editable experience_company" contenteditable="true">Công ty THHH Một Mình Tôi - Hà Nội</span>
            <span class="editable experience_year" contenteditable="true">10/2022 - Hiện tại</span>
            <p class="editable experience_description" contenteditable="true">Mô tả kinh nghiệm</p>
            <button class="delete-experience-btn"><i class="fa-solid fa-trash"></i>Xóa</button>
        </div>
    `;
    experienceContainer.appendChild(newExperience);
});

// Event delegation to handle delete button click for each experience section
experienceContainer.addEventListener("click", function (event) {
    if (event.target && event.target.classList.contains("delete-experience-btn")) {
        // Remove the parent experience content of the clicked delete button
        const experienceContent = event.target.closest(".experience_content");
        experienceContent.remove();
    }
});

// Hide buttons when clicking anywhere else
document.addEventListener("click", function (event) {
    if (!experienceSection.contains(event.target)) {
        addButton.style.display = "none";
        deleteButton.style.display = "none";
    }
});