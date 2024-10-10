<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Handbook</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f9f9f9;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }

    form {
      width: 100%;
      max-width: 600px;
      padding: 20px;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    h1 {
      text-align: center;
      color: #333;
      margin-bottom: 20px;
    }

    label {
      font-weight: bold;
      color: #333;
    }

    input[type="text"],
    textarea,
    input[type="file"] {
      width: 100%;
      padding: 10px;
      margin: 8px 0;
      box-sizing: border-box;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 16px;
    }

    textarea {
      height: 200px; /* Adjust the height as needed */
    }

    input[type="submit"] {
      background-color: #007bff;
      color: white;
      padding: 12px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
      transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
<form id="handbookForm">
  <h1>Add Handbook</h1>
  <label for="title">Title:</label><br>
  <input type="text" id="title" name="title"><br><br>

  <label for="imageFile">Header Image:</label><br>
  <input type="file" id="imageFile" name="imageFile"><br><br>

  <label for="content">Content:</label><br>
  <textarea id="content" name="content" rows="10"></textarea><br><br>

  <input type="submit" value="Submit">
</form>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function() {
    $('#handbookForm').submit(function(event) {
      event.preventDefault();
      const formData = new FormData();
      formData.append('title', $('#title').val());
      formData.append('imageFile', $('#imageFile')[0].files[0]);
      formData.append('content', $('#content').val());

      $.ajax({
        type: 'POST',
        url: 'http://localhost:8080/handbook/add', // Update with your server address
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
          alert('Handbook added successfully!');
          // You can handle the response as needed here
        },
        error: function(xhr, status, error) {
          alert('Error adding handbook. Please try again.');
          console.error(error);
        }
      });
    });
  });
</script>

</body>
</html>