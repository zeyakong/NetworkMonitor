<!doctype html>
<html lang="en">
<title> Network Monitor</title>
<html>
<head>
    <title>Main</title>
</head>

<button value="account info" onclick='window.location.href="accountInfo.action"'>go to account info</button>

<hr>
<p>Show the network below</p>
<svg width="100%" height="300px">
    <g id="R1" transform="translate(250 250)">
        <ellipse rx="100" ry="0" opacity=".3">
            <animateTransform attributeName="transform" type="rotate" dur="7s" from="0" to="360" repeatCount="indefinite" />
            <animate attributeName="cx" dur="8s" values="-20; 220; -20" repeatCount="indefinite" />
            <animate attributeName="ry" dur="3s" values="10; 60; 10" repeatCount="indefinite" />
        </ellipse>
    </g>
    <use xlink:href="#R1" transform="rotate(72 390 150)" />
    <use xlink:href="#R1" transform="rotate(144 390 150)" />
    <use xlink:href="#R1" transform="rotate(216 390 150)" />
    <use xlink:href="#R1" transform="rotate(288 390 150)" />
</svg>

</body>
</html>
