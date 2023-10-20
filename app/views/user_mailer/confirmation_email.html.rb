<!DOCTYPE html>
<html>
<head>
  <meta content='text/html; charset=UTF-8' http-equiv='Content-Type' />
</head>
<body>
  <h1>Confirmation Email</h1>
  <p>Hello <%= @user.name %>,</p>
  <p>Please click the link below to confirm your email address:</p>
  <%= link_to 'Confirm Email', confirmation_url(@user.confirmation_token) %>
</body>
</html>