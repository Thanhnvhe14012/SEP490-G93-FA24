<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Insert Experience</title>
</head>
<body>
<h2>Insert Experience</h2>
<form action="/experience/save" method="post" >
  <input type="hidden" name="accountId" value="${sessionScope.user.id}">
  <label>Company:</label>
  <input type="text" name="company" /><br/>

  <label>Start Date:</label>
  <input type="date" name="start" /><br/>

  <label>End Date:</label>
  <input type="date" name="end" /><br/>

  <label>Job Title:</label>
  <input type="text" name="jobTitle" /><br/>

  <label>Description:</label>
  <textarea name="description"></textarea><br/>

  <label>Project:</label>
  <input type="text" name="project" /><br/>

  <button type="submit">Save Experience</button>
</form>
</body>
</html>
