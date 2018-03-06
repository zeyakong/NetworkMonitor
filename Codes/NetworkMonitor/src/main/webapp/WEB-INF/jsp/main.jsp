<!doctype html>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<html lang="en">
<title> Network Monitor</title>
<html>
<%
    Object obj = session.getAttribute("loginId");
    if (obj == null) {
%>
<meta http-equiv="refresh" content="0; url=doLogin"/>
<%
    }
%>

<head>
    <title>Index</title>
    <link href="css/stylez.css" rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="css/css/style.css"> <!-- CSS reset -->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/main.js"></script> <!-- Resource jQuery -->
    <script src="js/modernizr.js"></script> <!-- Modernizr -->

    <!--import vis.js and vis.css-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.css">

    <!--import bootstrap -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body>
<a href="#cd-nav" class="cd-nav-trigger">
    Menu<span><!-- used to create the menu icon --></span>
</a> <!-- .cd-nav-trigger -->
<h1>Network</h1>
<style>
    .main-content {
        padding-top: 20px;
        padding-left: 20px;
        padding-bottom: 20px;
    }
</style>
<div class="main-content" id="networkView"></div>

<nav class="cd-nav-container" id="cd-nav">
    <header>
        <h3>Function</h3>
        <a href="#" class="cd-close-nav">Close</a>
    </header>

    <ul class="cd-nav">
        <li data-menu="accountinfo">
            <a href=" " onclick='window.location.href="accountInfo.action"'>
					<span>
						<svg version="1.1" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" viewBox="0 0 1000 1000"
                             enable-background="new 0 0 1000 1000" xml:space="preserve"
                             style="stroke: #000066; fill: #666666;">
<metadata> Svg Vector Icons : http://www.sfont.cn </metadata>
<g><path
        d="M769.5,303.2c0-156.3-126.1-283-281.8-283c-155.6,0-281.8,126.7-281.8,283c0,156.3,126.1,283,281.8,283C643.4,586.1,769.5,459.4,769.5,303.2L769.5,303.2z M255,303.2c0-129.1,104.2-233.7,232.7-233.7c128.5,0,232.8,104.6,232.8,233.7c0,129.1-104.2,233.7-232.8,233.7C359.2,536.9,255,432.3,255,303.2L255,303.2z M10,955.2v24.6h24.5h441h490H990v-24.6c0-220.9-226.7-418.3-490-418.3c-15.8,0-31.6,0.6-47.2,1.9c-13.5,1.1,21.6,13,22.7,26.5c14.3-1.2,10,20.8,24.5,20.8c237.6,0,441,177,441,369.1l24.5-24.6h-490h-441L59,955.2c0-130.7,82.1-250.1,214.4-316.6c12.1-6.1,17-20.9,10.9-33c-6.1-12.2-20.8-17.1-32.9-11C103.4,669,10,804.8,10,955.2L10,955.2z"/></g>
</svg>
					</span>

                <em>Account manage</em>
            </a>
        </li>

        <li data-menu="cardinfo">
            <a href=" " onclick='window.location.href="logout.action"'>
					<span><svg version="1.1" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" viewBox="0 0 1000 1000"
                               enable-background="new 0 0 1000 1000" xml:space="preserve">
<metadata> Svg Vector Icons : http://www.sfont.cn </metadata>
<g><g transform="translate(0.000000,511.000000) scale(0.100000,-0.100000)"><path
        d="M4453.8,4811.6c-524.1-45.9-1021.5-283.1-1279.8-606.4c-170.2-214.2-285-462.9-344.3-738.4c-19.1-91.8-32.5-304.2-40.2-644.7l-11.5-510.8l-59.3-24.9c-99.5-44-130.1-137.7-132-386.4c0-262.1,34.4-417,147.3-656.1c93.7-197,164.5-306.1,309.9-476.3c68.9-82.3,110.9-155,141.6-248.7c63.1-197,214.3-478.2,334.8-629.4c57.4-72.7,105.2-137.7,105.2-145.4c0-17.2-489.7-267.8-765.2-392.2c-132-59.3-482.1-210.4-778.6-336.7c-797.7-334.8-916.3-396-1094.2-562.4c-462.9-436.1-839.8-1316.1-876.1-2048.7L100-3825.4l179.8-68.9c1295.1-491.6,4139.6-694.4,6549.9-466.7l229.6,21l5.7,185.6l5.7,187.5l-1155.4,3.8l-1153.5,5.7l-82.3,53.6c-55.5,38.3-95.6,84.2-128.2,153l-45.9,99.5v719.3v717.4l47.8,97.6c30.6,61.2,78.4,116.7,128.2,151.1l78.4,55.5l1155.4,5.7l1153.5,3.8l-3.8,537.5l-5.7,537.5l-286.9,128.2c-302.2,135.8-570.1,267.8-770.9,378.8l-120.5,67l65,70.8c160.7,177.9,309.9,447.6,396,715.4c28.7,89.9,67,156.9,118.6,210.4c116.7,124.3,288.8,392.1,355.8,552.9c97.6,231.5,122.4,376.8,114.8,627.4c-7.6,250.6-38.3,334.8-132,367.3c-55.5,19.1-55.5,21-57.4,174.1c-3.8,485.9-34.5,966-70.8,1094.2c-208.5,749.9-757.5,1168.8-1639.4,1253C4798.2,4834.5,4712.1,4834.5,4453.8,4811.6z"/><path
        d="M7489.7-1304.1l-57.4-57.4v-461v-461H6236.7c-1319.9,0-1293.2,1.9-1367.8-118.6c-36.3-59.3-38.3-95.6-38.3-531.8c0-436.1,1.9-472.5,38.3-531.8c74.6-120.5,47.8-118.6,1367.8-118.6h1195.6v-457.2c0-426.6,1.9-459.1,38.3-505c45.9-57.4,120.5-78.4,177.9-49.7c114.8,61.2,2180.8,1482.5,2213.3,1524.6c26.8,32.5,38.3,76.5,38.3,139.6c0,80.4-9.6,103.3-61.2,158.8c-91.8,93.7-2176.9,1509.3-2238.1,1518.9C7562.4-1248.6,7533.7-1262,7489.7-1304.1z"/></g></g>
</svg> </span>

                <em>Logout</em>
            </a>
        </li>


        <li class="cd-selected" data-menu="map">
            <a href=" " onclick='window.location.href="goMain.action"'>
					<span>
						<svg version="1.1" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" viewBox="0 0 1000 1000"
                             enable-background="new 0 0 1000 1000" xml:space="preserve"
                             style="stroke: #000066; fill: #666666;">
<metadata> Svg Vector Icons : http://www.sfont.cn </metadata>
<g><g transform="translate(0.000000,511.000000) scale(0.100000,-0.100000)"><path
        d="M2732.7,4586.4l-67-58.8l-6.1-580.4l-6.1-580.4H1781c-957.8,0-982.2-2-1041-119.7c-42.6-79.1-40.6-119.7,8.1-198.9c26.4-42.6,62.9-71,115.7-85.2c48.7-14.2,395.7-22.3,933.5-22.3h858.4l4.1-3058.1l6.1-3060.1h202.9h202.9l6.1,917.2l4.1,917.2l523.5-2h521.5l6.1,205l6.1,205h-529.6h-527.6v1937.9v1937.9h1795.9h1795.9v-395.7v-395.7h202.9h202.9v1189.1v1189.1l-58.9,58.8c-67,67-152.2,77.1-243.5,30.4c-97.4-50.7-103.5-91.3-103.5-692v-558H4879.6H3083.8l-6.1,580.4l-6.1,580.4l-67,58.8c-44.6,40.6-87.3,58.8-136,58.8S2777.3,4626.9,2732.7,4586.4z"/><path
        d="M8668.2,4127.7c-570.2-154.2-886.8-744.7-696-1296.7c22.3-64.9,99.4-225.2,172.5-359.2c184.7-332.8,371.3-726.5,505.3-1073.5c62.9-162.3,129.9-334.8,150.2-385.6c30.4-79.1,44.6-91.3,101.5-97.4c75.1-8.1,69-22.3,239.5,432.2c109.6,294.2,426.1,963.9,596.6,1260.2c89.3,156.2,162.3,407.9,162.3,554c0,140-52.8,338.9-127.8,476.9C9567.2,4026.3,9084.2,4239.4,8668.2,4127.7z M9063.9,3537.2c269.9-111.6,349-436.3,160.3-651.4c-202.9-231.3-554-176.5-685.9,105.5c-93.3,200.9-10.1,426.1,192.8,527.6C8846.8,3577.8,8956.4,3583.9,9063.9,3537.2z"/><path
        d="M4918.2,1461.3c-32.5-20.3-79.1-56.8-101.5-83.2c-40.6-44.6-40.6-77.1-46.7-2619.8l-4.1-2575.1H3296.8H1827.7l-101.5-267.9c-56.8-148.1-109.6-286.1-115.7-304.4c-14.2-34.5,79.1-36.5,1769.5-36.5h1785.7l67,46.7c36.5,24.4,83.2,77.1,103.5,115.7c36.5,67,38.5,176.5,38.5,2611.6V891.1h1501.6c1189.1,0,1501.6,6.1,1501.6,26.4c-2,12.2-50.7,148.1-109.6,298.3l-107.5,273.9l-1590.9,4.1C5050.1,1499.9,4977,1497.8,4918.2,1461.3z"/><path
        d="M6673.5-336.6v-598.6h-334.8h-334.8v-202.9v-202.9l67-2c34.5,0,184.7-2,328.7-4l263.8-4.1l10.1-1373.8l10.1-1371.8l48.7-52.8c60.9-62.9,148.1-85.2,227.3-52.8c109.6,46.7,119.7,95.4,119.7,566.2v426.1l1124.2,6.1l1124.2,6.1l52.8,48.7c95.4,91.3,87.3,249.6-16.3,316.6c-44.6,30.4-170.4,34.5-1162.8,36.5l-1112,4.1v720.4v720.4l963.9,4.1c529.6,2,1034.9,4,1120.1,4c133.9,2,164.4,8.1,213.1,50.7c46.7,40.6,56.8,64.9,56.8,142.1c0,73.1-12.2,103.5-56.8,148.2l-54.8,56.8l-1126.2,6.1l-1126.2,6.1v596.6V262h-202.9h-202.9V-336.6z"/><path
        d="M855.6-1186.9c-347-85.2-637.2-367.3-728.5-710.2c-36.5-138-36.5-381.5,2-529.6c18.3-67,77.1-202.9,133.9-304.4c251.6-452.5,497.2-988.3,669.6-1459c67-184.6,87.3-215.1,150.2-215.1c64.9,0,81.2,26.4,182.6,300.3c170.5,466.7,342.9,838.1,608.8,1323.1c146.1,263.8,192.8,416,192.8,633.1c0,271.9-97.4,501.2-292.2,698.1C1531.4-1209.2,1182.3-1107.7,855.6-1186.9z M1287.9-1801.7c190.7-97.4,267.9-361.2,166.4-554c-138-257.7-485-298.3-673.7-79.2c-180.6,213.1-117.7,517.5,133.9,645.3C1020-1734.8,1170.2-1738.8,1287.9-1801.7z"/></g></g>
</svg></span>

                <em>Network</em>
            </a>
        </li>
    </ul> <!-- .cd-3d-nav -->
</nav>
<div class="cd-overlay"><!-- shadow layer visible when navigation is visible --></div>

<!-- THIS IS STORE CODE -->
<div class="modal fade" id="storeModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Store Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table table-striped table-bordered table-condensed">
                    <tr>
                        <th>Ip</th>
                        <th>Merchant Name</th>
                    </tr>
                    <tr>
                        <td id="storeIp">192.168.0.000</td>
                        <td id="merchantName">Starbucks</td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button id="btnNewTransaction" type="button" class="btn btn-success">New Transaction</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!--------------------------------->
<!-- THIS IS RELAY CODE -->
<div class="modal fade" id="relayModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Relay Station Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table table-striped table-bordered table-condensed">
                    <tr>
                        <th>Relay Station Ip</th>
                        <th>Transaction Queue</th>
                    </tr>
                    <tr>
                        <td id="relayIp">192.168.0.000</td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger">Deactivate</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!--------------------------------->
<!-- THIS IS TRANSACTION CODE -->
<div class="modal fade" id="transactionModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Create Transaction</h5>
                <button id="btnExit" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="form_one">
                    <div class="form-group">
                        <label>Card Holder Name</label>
                        <input type="text" class="form-control" placeholder="Name" id="cardName">
                    </div>

                    <div class="form-group">
                        <label>Credit Card Number</label>
                        <input type="number" class="form-control" placeholder="Card Number" id="cardNumber">
                    </div>

                    <div class="form-group">
                        <label>Transaction Type</label>
                        <select class="form-control" id="transactionType">
                            <option id ="storeNameOption" value="store">Store</option>
                            <option value="SELF">SELF</option>
                        </select>
                    </div>
                </form>
                <form id = "form_two" class="form-inline">
                    <div class="form-group">
                        <label>Expiration Date</label>
                        <select class="form-control" id="monthDate">
                            <option value="01">01</option>
                            <option value="02">02</option>
                            <option value="03">03</option>
                            <option value="04">04</option>
                            <option value="05">05</option>
                            <option value="06">06</option>
                            <option value="07">07</option>
                            <option value="08">08</option>
                            <option value="09">09</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>

                        <select class="form-control" id="yearDate">
                            <option value="2015">2015</option>
                            <option value="2016">2016</option>
                            <option value="2017">2017</option>
                            <option value="2018">2018</option>
                            <option value="2019">2019</option>
                            <option value="2020">2020</option>
                            <option value="2021">2021</option>
                            <option value="2022">2022</option>
                            <option value="2023">2023</option>
                            <option value="2024">2024</option>
                            <option value="2025">2025</option>
                            <option value="2026">2026</option>
                            <option value="2027">2027</option>
                            <option value="2028">2028</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Security Code</label>
                        <input type="text" class="form-control" placeholder="Code" id="securityCode">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button id="btnSubmitTransaction" type="button" class="btn btn-success">Submit Transaction</button>
                <button id="btnCancel" type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>
<!--------------------------------->
<!-- THIS IS CONNECTION CODE -->
<div class="modal fade" id="connectionModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Connection Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table">
                    <tr>
                        <th>Node One</th>
                        <th>Node Two</th>
                        <th>Weight</th>
                    </tr>
                    <tr>
                        <td id="first_ip">192.168.0.000</td>
                        <td id="second_ip">192.168.0.000</td>
                        <td id="weightValue">0</td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger">Deactivate</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!--------------------------------->
<script>
    var networkInfo;
    $(document).ready(function () {
        <!--ajax function to get the information-->
        $.ajax({
            url: '/getNetworkInfo',
            method: 'GET',
            success: function (network) {
                networkInfo = network;
                console.log(networkInfo);
            }
        });
    });

    // function getStoreById(id){
    //     <!--ajax function to get the information-->
    //     $.ajax({
    //         url: '/getStoreById',
    //         method: 'GET',
    //         data : { id :id},
    //         success: function (store) {
    //             return store;
    //         }
    //     });
    // }


    var networkDOT = '<%=request.getSession().getAttribute("network")%>';
    var parsedData = vis.network.convertDot(networkDOT);
    console.log(parsedData);

    var data = {
        nodes: parsedData.nodes,
        edges: parsedData.edges
    };

    var container = document.getElementById('networkView');

    var options = parsedData.options;

    // you can extend the options like a normal JSON variable:
    options.nodes = {
        color:"white"
    };

    // create a network
    var network = new vis.Network(container, data, options);

    //Decides which popup-window to display and populates it when a node is clicked on
    network.on("click", function(params) {
        params.event = "[original event]";
        console.log(params);
        //IT IS AN EDGE OR NOTHING
        if( params.nodes[0] == undefined ) {
            if(params.edges[0] == undefined){
                //DID NOT CLICK ON ANYTHING USEFUL
            }
            //CLICKED ON AN EDGE
            else{
                var edgeId = params.edges[0];
                var ip1, ip2, weight;
                for(i = 0; i < parsedData.edges.length; i++ ) {
                    if(edgeId == parsedData.edges[i].id) {
                        ip1 = parsedData.edges[i].from;
                        ip2 = parsedData.edges[i].to;
                        weight = parsedData.edges[i].label;
                    }
                }
                //Create edge window
                $('#first_ip').html(ip1);
                $('#second_ip').html(ip2);
                $('#weightValue').html(weight);
                $('#connectionModal').modal('show');
            }
        }
        //IT IS ONE OF THE NODES
        else{
            var myNode = params.nodes[0];
            if( myNode == 'Processing Center' ) { //PROCESSING CENTER
                $('#relayIp').html('Processing Center');
                $('#relayModal').modal('show');
            }
            else if( myNode >= 200 ) {  //RELAY STATION
                var stationIp = '192.168.0.' + myNode;
                $('#relayIp').html(stationIp);
                $('#relayModal').modal('show');
            }
            else{                       //STORE
                var storeIp = '192.168.0.' + myNode;
                for(i = 0; i < networkInfo.stores.length; i++ ) {
                    if(networkInfo.stores[i].storeIp == storeIp) {
                        var storeName = networkInfo.stores[i].merchantName;
                    }
                }
                $('#storeNameOption').value = storeName;
                $('#storeNameOption').html(storeName);

                $('#storeIp').html(storeIp);
                $('#merchantName').html(storeName);
                $('#storeModal').modal('show');
            }
        }
    });

    $('#btnNewTransaction').click( function() {
        $('#storeModal').modal('hide');
        $('#transactionModal').modal('show');
    });

    $('#btnSubmitTransaction').click( function() {
        var cardName = document.getElementById('cardName').value;
        var cardNumber = document.getElementById('cardNumber').value;
        var securityCode = document.getElementById('securityCode').value;
        var date = document.getElementById('monthDate').value +'/'+ document.getElementById('yearDate').value;
        var transactionType = $('#transactionType').find(":selected").text();

        //Get current store ip
        var storeIp;
        for( i = 0; i < networkInfo.stores.length; i++ ) {
            if(networkInfo.stores[i].merchantName == $('#merchantName').html()) {
                storeIp = networkInfo.stores[i].storeIp;
            }
        }
        var myNode = storeIp.substring(10);
        var destinationIp = "192.168.0.253"; //THE PROCESSING CENTER
        var transaction = {currentIp: storeIp, destinationIp: destinationIp, cardName: cardName, cardNumber: cardNumber, securityCode: securityCode, date: date, transactionType: transactionType};
        //console.log(transaction);
        switch (myNode) {
            case "134":
                setTimeout(function () {
                    network.clustering.updateClusteredNode(134, {color: "green", background: "white"});

                    setTimeout(function () {
                        network.clustering.updateClusteredNode(134, {color: "white", background: "white"});
                        network.clustering.updateClusteredNode(244, { color: "green", background: "white"});
                        setTimeout(function () {
                            network.clustering.updateClusteredNode(244, {color: "white", background: "white"});
                            network.clustering.updateClusteredNode(248, { color: "green", background: "white"});
                            setTimeout(function () {
                                network.clustering.updateClusteredNode(248, {color: "white", background: "white"});
                                network.clustering.updateClusteredNode("Processing Center", { color: "green", background: "white"});
                                setTimeout(function () {
                                    network.clustering.updateClusteredNode("Processing Center", {color: "white", background: "white"});
                                    network.clustering.updateClusteredNode(248, { color: "green", background: "white"});
                                    setTimeout(function () {
                                        network.clustering.updateClusteredNode(248, {color: "white", background: "white"});
                                        network.clustering.updateClusteredNode(244, { color: "green", background: "white"});
                                        setTimeout(function () {
                                            network.clustering.updateClusteredNode(244, {color: "white", background: "white"});
                                            network.clustering.updateClusteredNode(134, { color: "green", background: "white"});
                                            setTimeout(function () {
                                                network.clustering.updateClusteredNode(134, {color: "white", background: "white"});


                                            }, 1000);
                                        }, 1000);
                                    }, 1000);
                                }, 1000);
                            }, 1000);
                        }, 1000);
                    }, 1000);

                }, 1000);
                break;
            case "14":
                setTimeout(function () {
                    network.clustering.updateClusteredNode(14, {color: "green", background: "white"});

                    setTimeout(function () {
                        network.clustering.updateClusteredNode(14, {color: "white", background: "white"});
                        network.clustering.updateClusteredNode(244, { color: "green", background: "white"});
                        setTimeout(function () {
                            network.clustering.updateClusteredNode(244, {color: "white", background: "white"});
                            network.clustering.updateClusteredNode(248, { color: "green", background: "white"});
                            setTimeout(function () {
                                network.clustering.updateClusteredNode(248, {color: "white", background: "white"});
                                network.clustering.updateClusteredNode("Processing Center", { color: "green", background: "white"});
                                setTimeout(function () {
                                    network.clustering.updateClusteredNode("Processing Center", {color: "white", background: "white"});
                                    network.clustering.updateClusteredNode(248, { color: "green", background: "white"});
                                    setTimeout(function () {
                                        network.clustering.updateClusteredNode(248, {color: "white", background: "white"});
                                        network.clustering.updateClusteredNode(244, { color: "green", background: "white"});
                                        setTimeout(function () {
                                            network.clustering.updateClusteredNode(244, {color: "white", background: "white"});
                                            network.clustering.updateClusteredNode(14, { color: "green", background: "white"});
                                            setTimeout(function () {
                                                network.clustering.updateClusteredNode(14, {color: "white", background: "white"});


                                            }, 1000);
                                        }, 1000);
                                    }, 1000);
                                }, 1000);
                            }, 1000);
                        }, 1000);
                    }, 1000);

                }, 1000);
                break;
            case "163":
                setTimeout(function () {
                    network.clustering.updateClusteredNode(163, {color: "green", background: "white"});
                    setTimeout(function () {
                        network.clustering.updateClusteredNode(163, {color: "white", background: "white"});
                        network.clustering.updateClusteredNode(239, { color: "green", background: "white"});
                        setTimeout(function () {
                            network.clustering.updateClusteredNode(239, {color: "white", background: "white"});
                            network.clustering.updateClusteredNode(244, { color: "green", background: "white"});
                            setTimeout(function () {
                                network.clustering.updateClusteredNode(244  , {color: "white", background: "white"});
                                network.clustering.updateClusteredNode(248, { color: "green", background: "white"});
                                    setTimeout(function () {
                                        network.clustering.updateClusteredNode(248, {color: "white", background: "white"});
                                        network.clustering.updateClusteredNode("Processing Center", { color: "green", background: "white"});
                                        setTimeout(function () {
                                            network.clustering.updateClusteredNode("Processing Center", {color: "white", background: "white"});
                                            network.clustering.updateClusteredNode(248, { color: "green", background: "white"});
                                            setTimeout(function () {
                                                network.clustering.updateClusteredNode(248, {color: "white", background: "white"});
                                                network.clustering.updateClusteredNode(244, { color: "green", background: "white"});
                                                setTimeout(function () {
                                                    network.clustering.updateClusteredNode(244, {color: "white", background: "white"});
                                                    network.clustering.updateClusteredNode(239, { color: "green", background: "white"});
                                                    setTimeout(function () {
                                                        network.clustering.updateClusteredNode(239, {color: "white", background: "white"});
                                                        network.clustering.updateClusteredNode(163, { color: "green", background: "white"});
                                                          setTimeout(function () {
                                                                network.clustering.updateClusteredNode(163, {color: "white", background: "white"});

                                                            }, 1000);
                                                        }, 1000);
                                                    }, 1000);
                                                }, 1000);
                                            }, 1000);
                                        }, 1000);
                                    }, 1000);
                                }, 1000);
                            }, 1000);
                }, 1000);
                break;
            case "183":
                setTimeout(function () {
                    network.clustering.updateClusteredNode(183, {color: "green", background: "white"});
                    setTimeout(function () {
                        network.clustering.updateClusteredNode(183, {color: "white", background: "white"});
                        network.clustering.updateClusteredNode(231, { color: "green", background: "white"});
                    setTimeout(function () {
                        network.clustering.updateClusteredNode(231, {color: "white", background: "white"});
                        network.clustering.updateClusteredNode(208, { color: "green", background: "white"});
                        setTimeout(function () {
                            network.clustering.updateClusteredNode(208  , {color: "white", background: "white"});
                            network.clustering.updateClusteredNode(209, { color: "green", background: "white"});
                            setTimeout(function () {
                                network.clustering.updateClusteredNode(209, {color: "white", background: "white"});
                                network.clustering.updateClusteredNode(248, { color: "green", background: "white"});
                                setTimeout(function () {
                                    network.clustering.updateClusteredNode(248, {color: "white", background: "white"});
                                    network.clustering.updateClusteredNode("Processing Center", { color: "green", background: "white"});
                                    setTimeout(function () {
                                        network.clustering.updateClusteredNode("Processing Center", {color: "white", background: "white"});
                                        network.clustering.updateClusteredNode(248, { color: "green", background: "white"});
                                        setTimeout(function () {
                                            network.clustering.updateClusteredNode(248, {color: "white", background: "white"});
                                            network.clustering.updateClusteredNode(209, { color: "green", background: "white"});
                                            setTimeout(function () {
                                                network.clustering.updateClusteredNode(209, {color: "white", background: "white"});
                                                network.clustering.updateClusteredNode(208, { color: "green", background: "white"});
                                                setTimeout(function () {
                                                    network.clustering.updateClusteredNode(208, {color: "white", background: "white"});
                                                    network.clustering.updateClusteredNode(231, { color: "green", background: "white"});
                                                    setTimeout(function () {
                                                        network.clustering.updateClusteredNode(231, {color: "white", background: "white"});
                                                        network.clustering.updateClusteredNode(183, { color: "green", background: "white"});
                                                        setTimeout(function () {
                                                            network.clustering.updateClusteredNode(283, {color: "white", background: "white"});

                                                        }, 1000);
                                                    }, 1000);
                                                }, 1000);
                                            }, 1000);
                                        }, 1000);
                                    }, 1000);
                                }, 1000);
                            }, 1000);
                        }, 1000);
                    }, 1000);
                    }, 1000);
                }, 1000);
                break;
            case "83":
                setTimeout(function () {
                    network.clustering.updateClusteredNode(83, {color: "green", background: "white"});

                    setTimeout(function () {
                        network.clustering.updateClusteredNode(83, {color: "white", background: "white"});
                        network.clustering.updateClusteredNode(208, { color: "green", background: "white"});
                        setTimeout(function () {
                            network.clustering.updateClusteredNode(208  , {color: "white", background: "white"});
                            network.clustering.updateClusteredNode(209, { color: "green", background: "white"});
                            setTimeout(function () {
                                network.clustering.updateClusteredNode(209, {color: "white", background: "white"});
                                network.clustering.updateClusteredNode(248, { color: "green", background: "white"});
                                setTimeout(function () {
                                    network.clustering.updateClusteredNode(248, {color: "white", background: "white"});
                                    network.clustering.updateClusteredNode("Processing Center", { color: "green", background: "white"});
                                    setTimeout(function () {
                                        network.clustering.updateClusteredNode("Processing Center", {color: "white", background: "white"});
                                        network.clustering.updateClusteredNode(248, { color: "green", background: "white"});
                                        setTimeout(function () {
                                            network.clustering.updateClusteredNode(248, {color: "white", background: "white"});
                                            network.clustering.updateClusteredNode(209, { color: "green", background: "white"});
                                            setTimeout(function () {
                                                network.clustering.updateClusteredNode(209, {color: "white", background: "white"});
                                                network.clustering.updateClusteredNode(208, { color: "green", background: "white"});
                                                setTimeout(function () {
                                                    network.clustering.updateClusteredNode(208, {color: "white", background: "white"});
                                                    network.clustering.updateClusteredNode(83, { color: "green", background: "white"});
                                                    setTimeout(function () {
                                                        network.clustering.updateClusteredNode(83, {color: "white", background: "white"});

                                                    }, 1000);
                                                }, 1000);
                                            }, 1000);
                                        }, 1000);
                                    }, 1000);
                                }, 1000);
                            }, 1000);
                        }, 1000);
                    }, 1000);

                }, 1000);
                break;
            case "11":
                setTimeout(function () {
                    network.clustering.updateClusteredNode(11, {color: "green", background: "white"});

                    setTimeout(function () {
                        network.clustering.updateClusteredNode(11, {color: "white", background: "white"});
                        network.clustering.updateClusteredNode(221, { color: "green", background: "white"});
                        setTimeout(function () {
                            network.clustering.updateClusteredNode(221, {color: "white", background: "white"});
                            network.clustering.updateClusteredNode("Processing Center", { color: "green", background: "white"});
                            setTimeout(function () {
                                network.clustering.updateClusteredNode("Processing Center", {color: "white", background: "white"});
                                network.clustering.updateClusteredNode(221, { color: "green", background: "white"});
                                setTimeout(function () {
                                    network.clustering.updateClusteredNode(221, {color: "white", background: "white"});
                                    network.clustering.updateClusteredNode(11, { color: "green", background: "white"});
                                    setTimeout(function () {
                                        network.clustering.updateClusteredNode(11, {color: "white", background: "white"});

                                    }, 1000);
                                }, 1000);
                            }, 1000);
                        }, 1000);
                    }, 1000);

                }, 1000);
                break;
            case "24":
                setTimeout(function () {
                    network.clustering.updateClusteredNode(24, {color: "green", background: "white"});

                    setTimeout(function () {
                        network.clustering.updateClusteredNode(24, {color: "white", background: "white"});
                        network.clustering.updateClusteredNode(221, { color: "green", background: "white"});
                        setTimeout(function () {
                            network.clustering.updateClusteredNode(221, {color: "white", background: "white"});
                            network.clustering.updateClusteredNode("Processing Center", { color: "green", background: "white"});
                            setTimeout(function () {
                                network.clustering.updateClusteredNode("Processing Center", {color: "white", background: "white"});
                                network.clustering.updateClusteredNode(221, { color: "green", background: "white"});
                                setTimeout(function () {
                                    network.clustering.updateClusteredNode(221, {color: "white", background: "white"});
                                    network.clustering.updateClusteredNode(24, { color: "green", background: "white"});
                                    setTimeout(function () {
                                        network.clustering.updateClusteredNode(24, {color: "white", background: "white"});

                                    }, 1000);
                                }, 1000);
                            }, 1000);
                        }, 1000);
                    }, 1000);

                }, 1000);

                break;
            case "124":
                setTimeout(function () {
                    network.clustering.updateClusteredNode(124, {color: "green", background: "white"});

                    setTimeout(function () {
                        network.clustering.updateClusteredNode(124, {color: "white", background: "white"});
                        network.clustering.updateClusteredNode(248, { color: "green", background: "white"});
                        setTimeout(function () {
                            network.clustering.updateClusteredNode(248, {color: "white", background: "white"});
                            network.clustering.updateClusteredNode("Processing Center", { color: "green", background: "white"});
                            setTimeout(function () {
                                network.clustering.updateClusteredNode("Processing Center", {color: "white", background: "white"});
                                network.clustering.updateClusteredNode(248, { color: "green", background: "white"});
                                setTimeout(function () {
                                    network.clustering.updateClusteredNode(248, {color: "white", background: "white"});
                                    network.clustering.updateClusteredNode(124, { color: "green", background: "white"});
                                    setTimeout(function () {
                                        network.clustering.updateClusteredNode(124, {color: "white", background: "white"});

                                    }, 1000);
                                }, 1000);
                            }, 1000);
                        }, 1000);
                    }, 1000);

                }, 1000);
                break;
            case "13":
                setTimeout(function () {
                    network.clustering.updateClusteredNode(13, {color: "green", background: "white"});

                    setTimeout(function () {
                        network.clustering.updateClusteredNode(13, {color: "white", background: "white"});
                        network.clustering.updateClusteredNode(248, { color: "green", background: "white"});
                        setTimeout(function () {
                            network.clustering.updateClusteredNode(248, {color: "white", background: "white"});
                            network.clustering.updateClusteredNode("Processing Center", { color: "green", background: "white"});
                            setTimeout(function () {
                                network.clustering.updateClusteredNode("Processing Center", {color: "white", background: "white"});
                                network.clustering.updateClusteredNode(248, { color: "green", background: "white"});
                                setTimeout(function () {
                                    network.clustering.updateClusteredNode(248, {color: "white", background: "white"});
                                    network.clustering.updateClusteredNode(13, { color: "green", background: "white"});
                                    setTimeout(function () {
                                        network.clustering.updateClusteredNode(13, {color: "white", background: "white"});

                                    }, 1000);
                                }, 1000);
                            }, 1000);
                        }, 1000);
                    }, 1000);

                }, 1000);
                break;
            case "132":
                setTimeout(function () {
                    network.clustering.updateClusteredNode(132, {color: "green", background: "white"});

                    setTimeout(function () {
                        network.clustering.updateClusteredNode(132, {color: "white", background: "white"});
                        network.clustering.updateClusteredNode(248, { color: "green", background: "white"});
                        setTimeout(function () {
                            network.clustering.updateClusteredNode(248, {color: "white", background: "white"});
                            network.clustering.updateClusteredNode("Processing Center", { color: "green", background: "white"});
                            setTimeout(function () {
                                network.clustering.updateClusteredNode("Processing Center", {color: "white", background: "white"});
                                network.clustering.updateClusteredNode(248, { color: "green", background: "white"});
                                setTimeout(function () {
                                    network.clustering.updateClusteredNode(248, {color: "white", background: "white"});
                                    network.clustering.updateClusteredNode(132, { color: "green", background: "white"});
                                    setTimeout(function () {
                                        network.clustering.updateClusteredNode(132, {color: "white", background: "white"});

                                    }, 1000);
                                }, 1000);
                            }, 1000);
                        }, 1000);
                    }, 1000);

                }, 1000);
                break;
            case "45":
                setTimeout(function () {
                    network.clustering.updateClusteredNode(45, {color: "green", background: "white"});
                    setTimeout(function () {
                        network.clustering.updateClusteredNode(45, {color: "white", background: "white"});
                        network.clustering.updateClusteredNode(212, {color: "green", background: "white"});
                        setTimeout(function () {
                            network.clustering.updateClusteredNode(212, {color: "white", background: "white"});
                            network.clustering.updateClusteredNode(221, {color: "green", background: "white"});
                            setTimeout(function () {
                                network.clustering.updateClusteredNode(221, {color: "white", background: "white"});
                                network.clustering.updateClusteredNode("Processing Center", {
                                    color: "green",
                                    background: "white"
                                });
                                setTimeout(function () {
                                    network.clustering.updateClusteredNode("Processing Center", {
                                        color: "white",
                                        background: "white"
                                    });
                                    network.clustering.updateClusteredNode(221, {color: "green", background: "white"});
                                    setTimeout(function () {
                                        network.clustering.updateClusteredNode(221, {
                                            color: "white",
                                            background: "white"
                                        });
                                        network.clustering.updateClusteredNode(212, {
                                            color: "green",
                                            background: "white"
                                        });
                                        setTimeout(function () {
                                            network.clustering.updateClusteredNode(212, {
                                                color: "white",
                                                background: "white"
                                            });
                                            network.clustering.updateClusteredNode(45, {
                                                color: "green",
                                                background: "white"
                                            });
                                            setTimeout(function () {
                                                network.clustering.updateClusteredNode(45, {
                                                    color: "white",
                                                    background: "white"
                                                });


                                            }, 1000);

                                        }, 1000);

                                    }, 1000);

                                }, 1000);

                            }, 1000);

                        }, 1000);

                    }, 1000);

                }, 1000);
                break;
            case "43":
                setTimeout(function () {
                    network.clustering.updateClusteredNode(43, {color: "green", background: "white"});
                    setTimeout(function () {
                        network.clustering.updateClusteredNode(43, {color: "white", background: "white"});
                        network.clustering.updateClusteredNode(212, {color: "green", background: "white"});
                        setTimeout(function () {
                            network.clustering.updateClusteredNode(212, {color: "white", background: "white"});
                            network.clustering.updateClusteredNode(221, {color: "green", background: "white"});
                            setTimeout(function () {
                                network.clustering.updateClusteredNode(221, {color: "white", background: "white"});
                                network.clustering.updateClusteredNode("Processing Center", {
                                    color: "green",
                                    background: "white"
                                });
                                setTimeout(function () {
                                    network.clustering.updateClusteredNode("Processing Center", {
                                        color: "white",
                                        background: "white"
                                    });
                                    network.clustering.updateClusteredNode(221, {color: "green", background: "white"});
                                    setTimeout(function () {
                                        network.clustering.updateClusteredNode(221, {
                                            color: "white",
                                            background: "white"
                                        });
                                        network.clustering.updateClusteredNode(212, {
                                            color: "green",
                                            background: "white"
                                        });
                                        setTimeout(function () {
                                            network.clustering.updateClusteredNode(212, {
                                                color: "white",
                                                background: "white"
                                            });
                                            network.clustering.updateClusteredNode(43, {
                                                color: "green",
                                                background: "white"
                                            });
                                            setTimeout(function () {
                                                network.clustering.updateClusteredNode(43, {
                                                    color: "white",
                                                    background: "white"
                                                });


                                            }, 1000);

                                        }, 1000);

                                    }, 1000);

                                }, 1000);

                            }, 1000);

                        }, 1000);

                    }, 1000);

                }, 1000);
                break;
            case "35":
                setTimeout(function () {
                    network.clustering.updateClusteredNode(35, {color: "green", background: "white"});
                    setTimeout(function () {
                        network.clustering.updateClusteredNode(35, {color: "white", background: "white"});
                        network.clustering.updateClusteredNode(212, {color: "green", background: "white"});
                        setTimeout(function () {
                            network.clustering.updateClusteredNode(212, {color: "white", background: "white"});
                            network.clustering.updateClusteredNode(221, {color: "green", background: "white"});
                            setTimeout(function () {
                                network.clustering.updateClusteredNode(221, {color: "white", background: "white"});
                                network.clustering.updateClusteredNode("Processing Center", {
                                    color: "green",
                                    background: "white"
                                });
                                setTimeout(function () {
                                    network.clustering.updateClusteredNode("Processing Center", {
                                        color: "white",
                                        background: "white"
                                    });
                                    network.clustering.updateClusteredNode(221, {color: "green", background: "white"});
                                    setTimeout(function () {
                                        network.clustering.updateClusteredNode(221, {
                                            color: "white",
                                            background: "white"
                                        });
                                        network.clustering.updateClusteredNode(212, {
                                            color: "green",
                                            background: "white"
                                        });
                                        setTimeout(function () {
                                            network.clustering.updateClusteredNode(212, {
                                                color: "white",
                                                background: "white"
                                            });
                                            network.clustering.updateClusteredNode(35, {
                                                color: "green",
                                                background: "white"
                                            });
                                            setTimeout(function () {
                                                network.clustering.updateClusteredNode(35, {
                                                    color: "white",
                                                    background: "white"
                                                });


                                            }, 1000);

                                        }, 1000);

                                    }, 1000);

                                }, 1000);

                            }, 1000);

                        }, 1000);

                    }, 1000);

                }, 1000);
                break;


        }

        document.getElementById("form_one").reset();
        document.getElementById("form_two").reset();
        $('#transactionModal').modal('hide');
    });

    $('#btnCancel').click( function() {
        document.getElementById("form_one").reset();
        document.getElementById("form_two").reset();
    });


</script>

</body>
</html>