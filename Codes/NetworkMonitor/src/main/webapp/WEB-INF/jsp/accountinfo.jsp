<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en" class="no-js">
<head>
    <style type="text/css">
        * {
        }

        html, body {
            height: 100%;
            width: 100%;
        }

        h1 {
            font-size: 40px;
            color: #fff;
            text-align: center;
            padding-top: 20px;
        }

    </style>
    <meta charset="gb2312">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/css/reset.css"> <!-- CSS reset -->
    <link rel="stylesheet" href="css/css/style.css"> <!-- Resource style -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="js/modernizr.js"></script> <!-- Modernizr -->
    <title>main</title>

</head>

<
<script>

    function accountDetail(id) {
        window.location.href="accountCards.action?id="+id;
    }

</script>
<body>
<a href="#cd-nav" class="cd-nav-trigger">
    Menu<span><!-- used to create the menu icon --></span>
</a> <!-- .cd-nav-trigger -->

<main>
    <section class="cd-section accountinfo cd-selected">
        <header style="position:fixed; width:100%; height:100%;">
            <div class="cd-title">

                <div class="panel panel-primary"
                     style="width: 80%; height:90%; margin-left:20px; margin-top:20px;background-color:white;">
                    <table id="table-demo" class="table table-bordered" style="margin-top:30px; width:100%;
    margin-left:0px;">
                        <thead>
                        <tr>
                            <th>Account Id</th>
                            <th>Account Name</th>
                            <th>Detail</th>
                            <th>Manage</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="ac" items="${list}">
                            <tr>
                                <td>${ac.accountId}</td>
                                <td>${ac.accountName}</td>
                                <td><a style="padding:0;">
                                    <button type="button" class="btn btn-success" onclick="accountDetail('${ac.accountId}')">View
                                    </button>
                                </a></td>
                                <td>
                                    <button type="button" class="btn btn-info">Edit</button>
                                </td>

                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </header>


    </section> <!-- .cd-section -->
</main>

<nav class="cd-nav-container" id="cd-nav">
    <header>
        <h3>Function</h3>
        <a href="#" class="cd-close-nav">Close</a>
    </header>

    <ul class="cd-nav">
        <li class="cd-selected" data-menu="accountinfo">
            <a href="#">
					<span>
						<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                             x="0px" y="0px" viewBox="0 0 1000 1000" enable-background="new 0 0 1000 1000"
                             xml:space="preserve" style="stroke: #000066; fill: #666666;">
<metadata> Svg Vector Icons : http://www.sfont.cn </metadata>
<g><path
        d="M769.5,303.2c0-156.3-126.1-283-281.8-283c-155.6,0-281.8,126.7-281.8,283c0,156.3,126.1,283,281.8,283C643.4,586.1,769.5,459.4,769.5,303.2L769.5,303.2z M255,303.2c0-129.1,104.2-233.7,232.7-233.7c128.5,0,232.8,104.6,232.8,233.7c0,129.1-104.2,233.7-232.8,233.7C359.2,536.9,255,432.3,255,303.2L255,303.2z M10,955.2v24.6h24.5h441h490H990v-24.6c0-220.9-226.7-418.3-490-418.3c-15.8,0-31.6,0.6-47.2,1.9c-13.5,1.1,21.6,13,22.7,26.5c14.3-1.2,10,20.8,24.5,20.8c237.6,0,441,177,441,369.1l24.5-24.6h-490h-441L59,955.2c0-130.7,82.1-250.1,214.4-316.6c12.1-6.1,17-20.9,10.9-33c-6.1-12.2-20.8-17.1-32.9-11C103.4,669,10,804.8,10,955.2L10,955.2z"/></g>
</svg>
					</span>

                <em>My account</em>
            </a>
        </li>

        <li data-menu="cardinfo">
            <a href="#">
					<span><svg version="1.1" xmlns="http://www.w3.org/2000/svg"
                               xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 1000 1000"
                               enable-background="new 0 0 1000 1000" xml:space="preserve"
                               style="stroke: #000066; fill: #666666;">
<metadata> Svg Vector Icons : http://www.sfont.cn </metadata>
<g><g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)"><path
        d="M5703.3,5000.3c-202.9-47.8-197.1-42.1-2042.1-1883.3L1890.8,1348.6l-612.5-5.7l-612.5-5.7l-128.2-61.3c-218.2-103.3-365.5-287.1-415.3-518.7C89.8,596.4,93.7-4085,128.1-4213.2c36.4-141.6,95.7-243.1,195.2-342.6c109.1-109.1,229.7-172.2,380.9-202.9c174.2-32.5,8585.8-19.1,8683.4,15.3c38.3,13.4,122.5,59.3,185.6,101.4c120.6,80.4,246.9,243.1,292.8,377c34.4,97.6,47.8,5219.2,15.3,5391.5c-45.9,239.2,0,189.5-1824,2015.3c-939.7,939.7-1745.5,1734-1793.3,1764.6C6111,5004.2,5885.2,5042.4,5703.3,5000.3z M6091.9,4118c36.4-11.5,101.4-38.3,141.6-57.4l74.6-38.3L4970.3,2684.5L3632.5,1346.7h-430.6h-430.6l1337.8,1337.8c1431.6,1431.6,1414.4,1416.3,1642.1,1454.6C5860.3,4158.2,5986.6,4150.6,6091.9,4118z M8082.3,2255.8l909.1-909.1H7173.2H5355l909.1,909.1c499.5,499.5,909.1,909.1,909.1,909.1S7582.8,2755.3,8082.3,2255.8z M9265.1,822.3c44-30.6,99.5-86.1,124.4-124.4l42.1-68.9l5.7-2296.7c3.8-1711,0-2317.7-17.2-2379c-28.7-101.4-141.6-218.2-243.1-248.8c-107.2-32.5-8243.2-32.5-8350.4,0c-42.1,11.5-105.3,51.7-141.6,86.1c-134,130.1-126.3-44-120.6,2524.4l5.7,2319.7l57.4,82.3c32.5,44,95.7,101.4,141.6,126.3l84.2,44l4166.6-3.8l4166.6-5.7L9265.1,822.3z"/><path
        d="M1674.6,81.6c-285.2-141.6-245-606.7,59.3-696.7c158.9-47.9,296.7-28.7,426.8,55.5c38.3,26.8,44,38.3,26.8,59.3c-17.2,21-36.4,19.1-109.1-21.1c-151.2-78.5-317.7-47.9-398.1,74.6c-84.2,130.1-44,382.8,74.6,455.5c86.1,53.6,227.8,47.9,329.2-11.5c72.7-42.1,82.3-44,91.9-15.3c9.6,21-1.9,44-30.6,67C2038.2,131.3,1808.5,146.7,1674.6,81.6z"/><path
        d="M6342.6,102.6c-147.4-30.6-323.4-128.2-444-243.1c-367.5-348.3-369.4-934-7.6-1297.6c172.3-174.2,417.2-277.5,650.7-277.5c181.8,0,423,80.4,543.6,183.7l55.5,45.9l97.6-65.1c578-388.5,1339.7-30.6,1429.7,671.8c5.8,53.6,1.9,156.9-11.5,229.7C8541.7,10.8,7793.3,332.3,7240.2-40.9l-97.6-65.1l-116.8,76.6c-65.1,40.2-160.8,88.1-214.4,105.3C6690.9,112.2,6455.5,125.6,6342.6,102.6z"/><path
        d="M2510.9,51c-23-63.2-168.4-432.5-225.8-574.2l-40.2-101.4h72.7c68.9,0,72.7,3.8,105.3,95.7l34.5,97.6l193.3-5.7l191.4-5.7l34.4-86.1c30.6-78.5,40.2-86.1,105.3-91.9c84.2-7.7,91.9-45.9-82.3,388.5L2769.3,93.1l-118.7,5.7C2535.8,104.6,2530.1,102.6,2510.9,51z M2731-169.1c38.3-97.6,68.9-183.7,68.9-191.4c0-9.6-68.9-15.3-155-15.3c-116.8,0-153.1,5.7-145.5,24.9C2599-84.9,2637.3,6.9,2648.7,6.9C2656.4,6.9,2694.7-73.4,2731-169.1z"/><path
        d="M3163.6-262.9v-363.6l63.2,5.8c61.2,5.7,61.2,7.6,67,116.7l5.7,109.1h95.7h95.7l70.8-114.8c63.2-101.4,78.5-114.8,134-114.8c32.5,0,61.3,5.7,61.3,15.3c0,7.7-30.6,63.2-67,122.5c-63.2,105.3-63.2,111-28.7,130.1c88,47.9,124.4,233.5,67,342.6c-44,88-132.1,116.8-361.7,116.8h-202.9V-262.9z M3584.6-12.2c47.8-47.9,51.7-201,7.7-264.1c-24.9-36.4-45.9-42.1-162.7-42.1h-132.1v172.2V26.1H3422C3521.5,26.1,3554,18.4,3584.6-12.2z"/><path
        d="M3948.3-262.9v-365.5l235.4,7.7c269.9,7.6,384.7,47.9,453.6,156.9c86.1,139.7,65.1,352.2-45.9,463.2c-82.3,82.3-170.3,103.4-426.8,103.4h-216.3V-262.9z M4444-23.7c99.5-82.3,124.4-245,59.3-386.6c-45.9-101.5-122.5-137.8-287.1-137.8h-114.8V-261V26.1H4243C4367.4,26.1,4392.3,20.3,4444-23.7z"/><path
        d="M1058.3-3131.9c-32.5-32.5-38.3-63.2-38.3-191.4c0-183.7,30.6-229.7,153.1-229.7c122.5,0,153.1,45.9,153.1,229.7s-30.6,229.7-153.1,229.7C1121.4-3093.6,1083.2-3107,1058.3-3131.9z M1226.7-3283.1c9.6-95.7-9.6-155-51.7-155c-44,0-59.3,36.4-59.3,132.1c0,84.2,13.4,101.4,67,93.8C1211.4-3216.1,1222.9-3235.2,1226.7-3283.1z"/><path
        d="M1517.6-3131.9c-32.5-32.5-38.3-63.2-38.3-191.4c0-183.7,30.6-229.7,153.1-229.7c122.5,0,153.1,45.9,153.1,229.7s-30.6,229.7-153.1,229.7C1580.8-3093.6,1542.5-3107,1517.6-3131.9z M1686-3283.1c9.6-95.7-9.6-155-51.7-155c-44,0-59.3,36.4-59.3,132.1c0,84.2,13.4,101.4,67,93.8C1670.7-3216.1,1682.2-3235.2,1686-3283.1z"/><path
        d="M1977-3131.9c-32.5-32.5-38.3-63.2-38.3-191.4c0-183.7,30.6-229.7,153.1-229.7s153.1,45.9,153.1,229.7s-30.6,229.7-153.1,229.7C2040.1-3093.6,2001.8-3107,1977-3131.9z M2137.7-3239c5.7-17.2,11.5-53.6,11.5-84.2s-5.7-67-11.5-84.2c-15.3-40.2-76.6-40.2-91.9,0c-15.3,40.2-15.3,170.3,1.9,185.7C2070.7-3197,2126.2-3208.4,2137.7-3239z"/><path
        d="M2436.3-3131.9c-32.5-32.5-38.3-63.2-38.3-191.4c0-183.7,30.6-229.7,153.1-229.7c122.5,0,153.1,45.9,153.1,229.7s-30.6,229.7-153.1,229.7C2499.5-3093.6,2461.2-3107,2436.3-3131.9z M2597.1-3239c5.7-17.2,11.5-53.6,11.5-84.2s-5.7-67-11.5-84.2c-15.3-40.2-76.6-40.2-91.9,0c-15.3,40.2-15.3,170.3,1.9,185.7C2530.1-3197,2585.6-3208.4,2597.1-3239z"/><path
        d="M3201.9-3131.9c-32.5-32.5-38.3-63.2-38.3-191.4c0-183.7,30.6-229.7,153.1-229.7s153.1,45.9,153.1,229.7s-30.6,229.7-153.1,229.7C3265-3093.6,3226.7-3107,3201.9-3131.9z M3370.3-3283.1c11.5-105.3-9.6-158.8-59.3-151.2c-34.5,3.8-44,19.1-47.8,90c-7.7,109.1,5.7,139.7,57.4,132.1C3355-3216.1,3366.5-3233.3,3370.3-3283.1z"/><path
        d="M3661.2-3131.9c-32.5-32.5-38.3-63.2-38.3-191.4c0-183.7,30.6-229.7,153.1-229.7c122.5,0,153.1,45.9,153.1,229.7s-30.6,229.7-153.1,229.7C3724.4-3093.6,3686.1-3107,3661.2-3131.9z M3829.6-3283.1c9.6-95.7-9.6-155-51.7-155c-44,0-59.3,36.4-59.3,132.1c0,84.2,13.4,101.4,67,93.8C3814.3-3216.1,3825.8-3235.2,3829.6-3283.1z"/><path
        d="M4120.5-3131.9c-32.5-32.5-38.3-63.2-38.3-191.4c0-183.7,30.6-229.7,153.1-229.7s153.1,45.9,153.1,229.7s-30.6,229.7-153.1,229.7C4183.7-3093.6,4145.4-3107,4120.5-3131.9z M4289-3283.1c9.6-95.7-9.6-155-51.7-155c-44,0-59.3,36.4-59.3,132.1c0,84.2,13.4,101.4,67,93.8C4273.6-3216.1,4285.1-3235.2,4289-3283.1z"/><path
        d="M4579.9-3131.9c-32.5-32.5-38.3-63.2-38.3-191.4c0-183.7,30.6-229.7,153.1-229.7c122.5,0,153.1,45.9,153.1,229.7s-30.6,229.7-153.1,229.7C4643-3093.6,4604.8-3107,4579.9-3131.9z M4740.6-3239c5.7-17.2,11.5-53.6,11.5-84.2s-5.7-67-11.5-84.2c-15.3-40.2-76.6-40.2-91.9,0c-15.3,40.2-15.3,170.3,1.9,185.7C4673.7-3197,4729.2-3208.4,4740.6-3239z"/><path
        d="M5345.4-3131.9c-32.5-32.5-38.3-63.2-38.3-191.4c0-183.7,30.6-229.7,153.1-229.7c122.5,0,153.1,45.9,153.1,229.7s-30.6,229.7-153.1,229.7C5408.6-3093.6,5370.3-3107,5345.4-3131.9z M5506.2-3239c5.8-17.2,11.5-53.6,11.5-84.2s-5.7-67-11.5-84.2c-15.3-40.2-76.6-40.2-91.9,0c-15.3,40.2-15.3,170.3,1.9,185.7C5439.2-3197,5494.7-3208.4,5506.2-3239z"/><path
        d="M5804.8-3131.9c-32.5-32.5-38.3-63.2-38.3-191.4c0-183.7,30.6-229.7,153.1-229.7s153.1,45.9,153.1,229.7s-30.6,229.7-153.1,229.7C5867.9-3093.6,5829.6-3107,5804.8-3131.9z M5965.5-3239c5.8-17.2,11.5-53.6,11.5-84.2s-5.7-67-11.5-84.2c-15.3-40.2-76.6-40.2-91.9,0c-15.3,40.2-15.3,170.3,1.9,185.7C5898.5-3197,5954.1-3208.4,5965.5-3239z"/><path
        d="M6264.1-3131.9c-32.5-32.5-38.3-63.2-38.3-191.4c0-183.7,30.6-229.7,153.1-229.7c122.5,0,153.1,45.9,153.1,229.7s-30.6,229.7-153.1,229.7C6327.3-3093.6,6289-3107,6264.1-3131.9z M6424.9-3239c17.2-44,13.4-147.4-5.8-176.1c-9.6-15.3-32.5-23-51.7-19.1c-28.7,3.8-38.3,24.9-42.1,90c-3.8,45.9-1.9,95.7,3.8,109.1C6342.6-3198.9,6409.6-3200.8,6424.9-3239z"/><path
        d="M6723.5-3131.9c-32.5-32.5-38.3-63.2-38.3-191.4c0-183.7,30.6-229.7,153.1-229.7c122.5,0,153.1,45.9,153.1,229.7s-30.6,229.7-153.1,229.7C6786.6-3093.6,6748.3-3107,6723.5-3131.9z M6884.2-3239c5.7-17.2,11.5-53.6,11.5-84.2s-5.7-67-11.5-84.2c-15.3-40.2-76.6-40.2-91.9,0c-15.3,40.2-15.3,170.3,1.9,185.7C6817.2-3197,6872.7-3208.4,6884.2-3239z"/><path
        d="M7489-3131.9c-32.5-32.5-38.3-63.2-38.3-191.4c0-183.7,30.6-229.7,153.1-229.7c122.5,0,153.1,45.9,153.1,229.7s-30.6,229.7-153.1,229.7C7552.2-3093.6,7513.9-3107,7489-3131.9z M7657.4-3283.1c9.6-95.7-9.6-155-51.7-155c-44,0-59.3,36.4-59.3,132.1c0,84.2,13.4,101.4,67,93.8C7642.1-3216.1,7653.6-3235.2,7657.4-3283.1z"/><path
        d="M7948.4-3131.9c-32.5-32.5-38.3-63.2-38.3-191.4c0-183.7,30.6-229.7,153.1-229.7s153.1,45.9,153.1,229.7s-30.6,229.7-153.1,229.7C8011.5-3093.6,7973.2-3107,7948.4-3131.9z M8116.8-3283.1c11.5-105.3-9.6-158.8-59.3-151.2c-34.4,3.8-44,19.1-47.8,90c-7.7,109.1,5.7,139.7,57.4,132.1C8101.5-3216.1,8112.9-3233.3,8116.8-3283.1z"/><path
        d="M8407.7-3131.9c-32.5-32.5-38.3-63.2-38.3-191.4c0-183.7,30.6-229.7,153.1-229.7s153.1,45.9,153.1,229.7s-30.6,229.7-153.1,229.7C8470.8-3093.6,8432.6-3107,8407.7-3131.9z M8568.5-3239c5.7-17.2,11.5-53.6,11.5-84.2s-5.7-67-11.5-84.2c-15.3-40.2-76.6-40.2-91.9,0c-15.3,40.2-15.3,170.3,1.9,185.7C8501.5-3197,8557-3208.4,8568.5-3239z"/><path
        d="M8867-3131.9c-32.5-32.5-38.3-63.2-38.3-191.4c0-183.7,30.6-229.7,153.1-229.7c122.5,0,153.1,45.9,153.1,229.7s-30.6,229.7-153.1,229.7C8930.2-3093.6,8891.9-3107,8867-3131.9z M9027.8-3239c5.7-17.2,11.5-53.6,11.5-84.2s-5.7-67-11.5-84.2c-15.3-40.2-76.6-40.2-91.9,0c-15.3,40.2-15.3,170.3,1.9,185.7C8960.8-3197,9016.3-3208.4,9027.8-3239z"/></g></g>
                    </svg>
						  </span>

                <em>My cards</em>
            </a>
        </li>

        <li data-menu="map">
            <a href="#">
					<span>
						<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                             x="0px" y="0px" viewBox="0 0 1000 1000" enable-background="new 0 0 1000 1000"
                             xml:space="preserve" style="stroke: #000066; fill: #666666;">
<metadata> Svg Vector Icons : http://www.sfont.cn </metadata>
<g><g transform="translate(0.000000,511.000000) scale(0.100000,-0.100000)"><path
        d="M2732.7,4586.4l-67-58.8l-6.1-580.4l-6.1-580.4H1781c-957.8,0-982.2-2-1041-119.7c-42.6-79.1-40.6-119.7,8.1-198.9c26.4-42.6,62.9-71,115.7-85.2c48.7-14.2,395.7-22.3,933.5-22.3h858.4l4.1-3058.1l6.1-3060.1h202.9h202.9l6.1,917.2l4.1,917.2l523.5-2h521.5l6.1,205l6.1,205h-529.6h-527.6v1937.9v1937.9h1795.9h1795.9v-395.7v-395.7h202.9h202.9v1189.1v1189.1l-58.9,58.8c-67,67-152.2,77.1-243.5,30.4c-97.4-50.7-103.5-91.3-103.5-692v-558H4879.6H3083.8l-6.1,580.4l-6.1,580.4l-67,58.8c-44.6,40.6-87.3,58.8-136,58.8S2777.3,4626.9,2732.7,4586.4z"/><path
        d="M8668.2,4127.7c-570.2-154.2-886.8-744.7-696-1296.7c22.3-64.9,99.4-225.2,172.5-359.2c184.7-332.8,371.3-726.5,505.3-1073.5c62.9-162.3,129.9-334.8,150.2-385.6c30.4-79.1,44.6-91.3,101.5-97.4c75.1-8.1,69-22.3,239.5,432.2c109.6,294.2,426.1,963.9,596.6,1260.2c89.3,156.2,162.3,407.9,162.3,554c0,140-52.8,338.9-127.8,476.9C9567.2,4026.3,9084.2,4239.4,8668.2,4127.7z M9063.9,3537.2c269.9-111.6,349-436.3,160.3-651.4c-202.9-231.3-554-176.5-685.9,105.5c-93.3,200.9-10.1,426.1,192.8,527.6C8846.8,3577.8,8956.4,3583.9,9063.9,3537.2z"/><path
        d="M4918.2,1461.3c-32.5-20.3-79.1-56.8-101.5-83.2c-40.6-44.6-40.6-77.1-46.7-2619.8l-4.1-2575.1H3296.8H1827.7l-101.5-267.9c-56.8-148.1-109.6-286.1-115.7-304.4c-14.2-34.5,79.1-36.5,1769.5-36.5h1785.7l67,46.7c36.5,24.4,83.2,77.1,103.5,115.7c36.5,67,38.5,176.5,38.5,2611.6V891.1h1501.6c1189.1,0,1501.6,6.1,1501.6,26.4c-2,12.2-50.7,148.1-109.6,298.3l-107.5,273.9l-1590.9,4.1C5050.1,1499.9,4977,1497.8,4918.2,1461.3z"/><path
        d="M6673.5-336.6v-598.6h-334.8h-334.8v-202.9v-202.9l67-2c34.5,0,184.7-2,328.7-4l263.8-4.1l10.1-1373.8l10.1-1371.8l48.7-52.8c60.9-62.9,148.1-85.2,227.3-52.8c109.6,46.7,119.7,95.4,119.7,566.2v426.1l1124.2,6.1l1124.2,6.1l52.8,48.7c95.4,91.3,87.3,249.6-16.3,316.6c-44.6,30.4-170.4,34.5-1162.8,36.5l-1112,4.1v720.4v720.4l963.9,4.1c529.6,2,1034.9,4,1120.1,4c133.9,2,164.4,8.1,213.1,50.7c46.7,40.6,56.8,64.9,56.8,142.1c0,73.1-12.2,103.5-56.8,148.2l-54.8,56.8l-1126.2,6.1l-1126.2,6.1v596.6V262h-202.9h-202.9V-336.6z"/><path
        d="M855.6-1186.9c-347-85.2-637.2-367.3-728.5-710.2c-36.5-138-36.5-381.5,2-529.6c18.3-67,77.1-202.9,133.9-304.4c251.6-452.5,497.2-988.3,669.6-1459c67-184.6,87.3-215.1,150.2-215.1c64.9,0,81.2,26.4,182.6,300.3c170.5,466.7,342.9,838.1,608.8,1323.1c146.1,263.8,192.8,416,192.8,633.1c0,271.9-97.4,501.2-292.2,698.1C1531.4-1209.2,1182.3-1107.7,855.6-1186.9z M1287.9-1801.7c190.7-97.4,267.9-361.2,166.4-554c-138-257.7-485-298.3-673.7-79.2c-180.6,213.1-117.7,517.5,133.9,645.3C1020-1734.8,1170.2-1738.8,1287.9-1801.7z"/></g></g>
</svg></span>

                <em>Net Map</em>
            </a>
        </li>


    </ul> <!-- .cd-3d-nav -->
</nav>

<div class="cd-overlay"><!-- shadow layer visible when navigation is visible --></div>

<script src="js/jquery-2.1.1.js"></script>
<script src="js/main.js"></script> <!-- Resource jQuery -->

</body>
</html>
