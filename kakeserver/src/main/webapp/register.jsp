<%@page import="com.klevjers.kakeserver.utils.RandomUtils"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Kakekonkurranse - registrering</title>
<!-- TODO: change to PBKDF2-SHA256 for military grade hashing! -->
<script
	src="http://crypto-js.googlecode.com/svn/tags/3.1.2/build/components/core-min.js"></script>

<!-- TODO: Change to SJCL PBKDF2 for performance? -->
<script
	src="http://crypto-js.googlecode.com/svn/tags/3.1.2/build/rollups/pbkdf2.js"></script>
<script
	src="http://crypto-js.googlecode.com/svn/tags/3.1.2/build/components/enc-base64-min.js"></script>
<script>
	function registerUser() {
		console.log(1);
		if (cpass.value.indexOf(pass.value) != 0) {
			alert('passwords do not match!');
			return;
		}
		var localsalt = CryptoJS.lib.WordArray.random(256 / 8);
		var salt =
<%out.write(RandomUtils.generateSalt());%>
	;
		var hash = CryptoJS.PBKDF2(email.value + pass.value, salt, {
			keySize : 256 / 32,
			iterations : 10
		});

		console.log(2);
		var args = "salt=" + encodeURIComponent(salt.toString(CryptoJS.enc.Base64));
		args += "&email="
				+ encodeURIComponent(CryptoJS.enc.Base64.stringify(CryptoJS.enc.Latin1
						.parse(email.value)));
		args += "&hash=" + encodeURIComponent(hash.toString(CryptoJS.enc.Base64));

		console.log(3);
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState === 4) {
				alert(xmlhttp.readyState);
			}
		};
		console.log(args, xmlhttp);
		xmlhttp.open('POST', '/kakeserver/action', true);
		xmlhttp.setRequestHeader('X-Requested-With', 'XMLHttpRequest'); // Tells server that this call is made for ajax purposes.
		xmlhttp.send(args); // No data need to send along with the request.

	}
</script>
</head>
<body>
	<div id="signuptable">
		<fieldset style="width: 30%">
			<legend>Registration Form</legend>
			<!-- 			<form method="POST" action="register.php"> -->
			<table border="0">
				<tr>
					<td>Email</td>
					<td><input type="text" id="email" value="foo@bar.org" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" id="pass" value="ba" /></td>
				</tr>
				<tr>
					<td>Confirm Password</td>
					<td><input type="password" id="cpass" value="ba" /></td>
				</tr>
				<tr>
					<td colspan="2"><input id="subbtn" type="button"
						onclick="registerUser();" id="submit" value="Register" /> for
						some cakeolicious fun!</td>
				</tr>
			</table>
			<!-- 			</form> -->
		</fieldset>
	</div>
</body>
</html>