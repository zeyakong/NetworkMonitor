<!doctype html>
<html lang="en">
<title>Network Monitor</title>
<html>
<head>
    <!--define the Global variable-->
    <script> networkDOT = '<%=request.getSession().getAttribute("network")%>';</script>
    <!--JQuery CDN-->
    <script src="https://code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
            crossorigin="anonymous"></script>
    <!--import vis.js and vis.css-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.css">
    <!--import bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <!--import local css layout file -->
    <link rel="stylesheet" href="network/css/network.css">
</head>
<body>
<!--nav bar-->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header ">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Network Monitor</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

            <ul class="nav navbar-nav navbar-left">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Network<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a >Add a Store</a></li>
                        <li><a >Add a Relay Station/GateWay</a></li>
                    </ul>
                </li>
            </ul>

            <ul class="nav navbar-nav">
                <li><a href="#" disabled="true">Transaction:</a></li>
                <li><button id="toggle_button" type="button" class="btn navbar-btn" style="background-color: #4CAF50">Start</button></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">User:Developer<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a onclick='window.location.href="goMain.action"'>Synchronize</a></li>
                        <li><a onclick='window.location.href="accountInfo.action"'>Account Management</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a onclick='window.location.href="logout.action"'>Logout</a></li>
                    </ul>
                </li>
            </ul>

            <form class="navbar-form navbar-right">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search Ip">
                </div>
                <button type="submit" class="btn btn-info">Submit</button>
            </form>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<!--network body div: to show the network-->
<div id="networkView"></div>

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
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Relay Station Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table table-striped table-condensed">
                    <tr>
                        <th>Relay Station Ip</th>
                        <th>Queue Limit</th>>
                    </tr>
                    <tr>
                        <td id="relayIp">192.168.0.000</td>
                        <td><input type="number" placeholder="CurrentLimit" id="newLimit"></td>
                    </tr>
                </table>
            </div>
            <div class = "modal-body">
                <table class="table table-striped table-bordered" style="table-layout: fixed; word-wrap: break-word;" id="queueTable">
                    <tbody id="mytbody">
                        <tr>
                            <th>Transaction Queue</th>
                            <th>Card Id</th>
                            <th>Status</th>
                            <th>Type</th>
                            <th>Store</th>
                            <th>Destination Ip</th>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-info" id="applyButton">Apply</button>
                <button type="button" class="btn" style="background-color: red" id="toggleRelay">Deactivate</button>
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
                            <option id="storeNameOption" value="store">Store</option>
                            <option value="SELF">Self (Debit)</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Transaction Amount</label>
                        <input type="number" class="form-control" placeholder="Amount" id="transactionAmount">
                    </div>
                </form>
                <form id="form_two" class="form-inline">
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
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                            <option value="21">21</option>
                            <option value="22">22</option>
                            <option value="23">23</option>
                            <option value="24">24</option>
                            <option value="25">25</option>
                            <option value="26">26</option>
                            <option value="27">27</option>
                            <option value="28">28</option>
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
                        <th>Connection Id</th>>
                        <th>Node One</th>
                        <th>Node Two</th>
                        <th>Weight</th>
                    </tr>
                    <tr>
                        <td id="connectionId">-1</td>
                        <td id="first_ip">192.168.0.000</td>
                        <td id="second_ip">192.168.0.000</td>
                        <td id="weightValue">0</td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn" style="background-color: red" id="toggleConnection">Deactivate</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

</body>
<!--import local Javascript functions-->
<script src="network/js/network.js"></script>
</html>