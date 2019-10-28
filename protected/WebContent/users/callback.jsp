<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("qhgCBZA6iuY4bImpUhhX", "http://192.168.0.33:8080/users/callback.jsp");

//   alert(naver_id_login.oauthParams.access_token);

  naver_id_login.get_naver_userprofile("naverSignInCallback()");

  function naverSignInCallback() {
//     alert(naver_id_login.getProfileData('id'));
    var naverId=naver_id_login.getProfileData('id');
    $(location).attr('href', '/users/naver?naver='+naverId);
    
    
  }
</script>
</body>
</html>