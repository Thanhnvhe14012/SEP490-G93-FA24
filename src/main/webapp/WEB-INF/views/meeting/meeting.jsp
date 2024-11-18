<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meeting</title>
</head>
<body>
<h1>WebRTC Test</h1>
<video id="localVideo" autoplay muted></video>
<video id="remoteVideo" autoplay></video>
<fieldset>
    <input type="text" name="localId" id="localId" placeholder="Enter Your ID">
    <button id="connectBtn">Connect</button>
</fieldset>
<fieldset>
    <input type="text" name="remoteId" id="remoteId" placeholder="Enter Remote ID">
    <button id="callBtn">call</button>
</fieldset>
<button id="testConnection">Test Connection</button>

<script src="/assets/js/meeting/client.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>