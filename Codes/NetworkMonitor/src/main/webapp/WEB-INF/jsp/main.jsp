<!doctype html>
<html lang="en">
<title> Network Monitor</title>
<html>
<head>
<title>Main</title>
</head>
<body>
<button value="account info" onclick='window.location.href="accountInfo.action"'>go to account info</button>
<hr>
<p>Show the network below</p>
<script src="js/viz.js"></script>>
<script>

    document.body.innerHTML += Viz("graph { n0 -- n1 -- n2 -- n3 -- n0; }");
</script>
</body>
</html>
