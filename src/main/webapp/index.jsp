<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalTime" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lab2 WebApp</title>
</head>
<body>
    <h1>
        <% 
            LocalTime currentTime = LocalTime.now();
            if (currentTime.isBefore(LocalTime.NOON)) {
        %>
            Good morning, Aleli, Welcome to COMP367
        <% 
            } else {
        %>
            Good afternoon, Aleli, Welcome to COMP367
        <% 
            }
        %>
    </h1>
</body>
</html>
