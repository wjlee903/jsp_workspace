<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>

<script>
	function change() {
		const b1 = document.getElementsById("box");
		b1.style.backgroundColor = "blue";

	}
</script>
</head>
<body>
	<h2>Hello world</h2>
	<div id="example" onClick="colorize()">Click on this text to
		change the background color</div>
	<script type='text/javascript'>
		function colorize() {
			var element = document.getElementById("example");
			element.style.backgroundColor = '#800';
			element.style.color = 'white';
			element.style.textAlign = 'center';
			element.style.marginTop = '100px';
		}
	</script>
</body>
</html>
