
//##########################Class variables#########################
//object
var networkInfo;
var transactionQueues;
//array
var transactions;
var nodeStepSummaries;

//Controls start/stop
var running;
//var tryAgain;
var cycleTimer = 4000;

//Global Constant
var pCenter = "192.168.0.200"; //CHANGE THIS WHEN WE MOVE OVER TO NEW DATA
var totalRegions;

//##########################ajax functions##########################

function createStore(ip,name,region){
    $.ajax({
        url: '/demo6/createStore',
        method: 'POST',
        data:{
            ip:ip,
            name:name,
            region:region
        },
        success: function (data) {
            console.log(data);
            var newStore = {
                id: ip.substr(10),
                label: ip.substr(10),
                color:{
                    background: getPresetColor(region),
                    border: "#2B7CE9",
                    highlight: "#99CC33"
                }
            };
            nodes.add(newStore);
            getNetworkInfo();
            prepareMap();
        }
    });
}

function createRelayStation(ip,status,type,region,limit){
    $.ajax({
        url: '/demo6/createRelayStation',
        method: 'POST',
        data:{
            ip:ip,
            status:status,
            type:type,
            region:region,
            limit:limit
        },
        success: function (data) {
            console.log(data);
            var shape;
            if( type = 0 ) {
                shape = "diamond";
            }
            else{
                shape = "star";
            }
            var newRelay = {
                id: ip.substr(10),
                label: ip.substr(10),
                shape: shape,
                color:{
                    background: getPresetColor(region),
                    border: "#2B7CE9",
                    highlight: "#99CC33"
                }
            };
            nodes.add(newRelay);
            getNetworkInfo();
            prepareMap();
        }
    });
}

function createConnection(start_ip,end_ip,is_active,weight) {
    $.ajax({
        url: '/demo6/createConnection',
        method: 'POST',
        data:{
            start_ip: start_ip,
            end_ip: end_ip,
            is_active: is_active,
            weight: weight
        },
        success: function(data) {
            console.log(data);
            getNetworkInfo();
            var id;
            for( var i = 0; i < networkInfo.connections.length; i++ ) {
                var c = networkInfo.connections[i];
                if( start_ip == c.startIp && end_ip == c.endIp ) {
                    id = c.connectionId;
                }
            }

            //Processing Center Compatability
            var to;
            if( end_ip == pCenter ) {
                to = "Processing Center";
            }
            else{
                to = parseInt(end_ip.substr(10), 10);
            }

            var from;
            if( start_ip == pCenter ) {
                from = "Processing Center";
            }
            else{
                from = parseInt(start_ip.substr(10), 10);
            }

            var newConnection ={
                to: to,
                from: from,
                id: id,
                label: weight,
                color:{
                    color: "#2B7CE9",
                }
            };
            edges.add(newConnection);
            getNetworkInfo();
            prepareMap();
        }
    });
}

function processingVerification(transactionInfo) {
    //console.log(transactionInfo);
    $.ajax({
        url: '/demo6/processingVerification',
        method: 'POST',
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(transactionInfo),
        success: function (data) {
            //OK | ERROR
            //console.log(data);
            if (data == "OK") {
                updateTransaction(transactionInfo.transactionId, "APPROVED", pCenter, transactionInfo.storeIp);
            } else {
                updateTransaction(transactionInfo.transactionId, "DENIED", pCenter, transactionInfo.storeIp);
            }
            setTransactionStartTime(transactionInfo.transactionId);
        }
    });
}

function changeCapacity(ip,newLimit){
    $.ajax({
        url: '/demo6/changeCapacity',
        method: 'POST',
        data:{
            ip:ip,
            newLimit:newLimit
        },
        success: function (data) {
            //OK | ERROR
            console.log(data);
        }
    });
}


/**
 * get the whole network info
 */
function getNetworkInfo(){
    $.ajax({
        url: '/demo6/getNetworkInfo',
        method: 'GET',
        async: false,
        success: function (network) {
            networkInfo = network;
            // console.log(networkInfo);
        }
    });
}

/**
 * use this function to get all the transactions. all info will be stored into var transactions
 */
function getTransactions(){
    $.ajax({
        url: '/demo6/getTransactions',
        method: 'GET',
        async: false,
        success: function (data) {
            transactions=data;
            var i = transactions.length;
            while(i--) {
                if( (transactions[i].currentPositionIp == transactions[i].currentDestinationIp && transactions[i].currentPositionIp == transactions[i].storeIp) ){
                    transactions.splice(i, 1);
                }
            }

            // for( var i = 0; i < transactions.length; i++ ) {
            //     if( (transactions[i].currentPositionIp == transactions[i].currentDestinationIp && transactions[i].currentPositionIp == transactions[i].storeIp) ) {
            //         transactions.splice(i, 1);
            //     }
            // }
            //console.log(transactions);
        }
    });
}

/**
 *
 * @param id :the transaction id
 * @param status
 * @param currentIP
 * @param nextIp
 */
function updateTransaction(id,status,currentIP,nextIp){
    $.ajax({
        url: '/demo6/updateTransaction?id='+id+"&status="+status+"&currentIP="+currentIP+"&nextIp="+nextIp,
        method: 'POST',
        success: function(data) {
            updateTransactionQueues();
        }
    });
}

/**
 *
 * @param ip: the current ip
 * @param destination: the destination(Processing center or go back)
 * @param t: the transaction, used in callback function
 */
function getNextIp(ip,destination,t){
    $.ajax({
        url: '/demo6/getNextIp?ip='+ip+'&destination='+destination,
        method: 'GET',
        async: false,
        success: function (data) {
            console.log("ok get next ip success!!!");
            console.log(data);

            //Update the transaction in the database and process it in Processing Center if necessary
            prepareTransactionForUpdate(t, data);

            //GET THE NODE WE WERE AT
            var oldNode;
            if(ip === pCenter){
                oldNode = nodes.get("Processing Center");
            }
            else{
                oldNode = nodes.get(ip.substr(10));
            }

            //GET THE NEW NODE WE ARE MOVING TO
            var newNode;
            if(data === pCenter){
                newNode = nodes.get("Processing Center");
            }
            else{
                newNode = nodes.get(data.substr(10));
            }

            //GET THE CONNECTION BETWEEN THEM
            var temp;
            var connection;
            if( ip != data ) {
                for( var i in edges._data ){
                    temp = edges._data[i];
                    if( (temp.from == oldNode.id && temp.to == newNode.id) || (temp.from == newNode.id && temp.to == oldNode.id) ){
                        connection = temp;
                    }
                }
            }
            //Create the summary to run the animation at the end
            var nodeStepSummary = {
                oldNode : oldNode,
                newNode: newNode,
                connection: connection
            };
            //console.log(nodeStepSummary);
            nodeStepSummaries.push(nodeStepSummary);
        }
    });
}

/**
 * make the connection active or inactive
 * @param id
 */
function changeConnectionStatusById(id){
    $.ajax({
        url: '/demo6/changeConnectionStatusById?id='+id,
        method: 'POST',
        success: function (data) {
            //alert("success");
            getNetworkInfo();
            var e = edges.get(id);
            getEdgeColor(e);
            // var connection;
            // //Get the correct Connection from the database
            // for( var i = 0; i < networkInfo.connections.length; i++ ) {
            //     if( networkInfo.connections[i].connectionId == id ) {
            //         connection = networkInfo.connections[i];
            //         //console.log(connection);
            //         getEdgeColor(e);
            //     }
            // }
        }
    });
}

/**
 * make the station active or inactive
 * @param id
 */
function changeStationStatusByIp(ip){
    $.ajax({
        url: '/demo6/changeStationStatusByIp?ip='+ip,
        method: 'POST',
        success: function (data) {
            //alert("success");
            getNetworkInfo();
            var n = nodes.get(ip.substr(10));
            getNodeColor(n);
            // var station;
            // //Get the correct relayStation from the database
            // for( var i = 0; i < networkInfo.relayStations.length; i++ ) {
            //     if( networkInfo.relayStations[i].stationIp === ip ) {
            //         station = networkInfo.relayStations[i];
            //         //console.log(station);
            //         //setMapActiveInactive(n, 0, station.isActive, station.region);
            //         getNodeColor(n);
            //     }
            // }
        }
    });
}

/**
 * when the transaction started . system need store the start time
 * @param id the transaction id
 */
function setTransactionStartTime(id){
    $.ajax({
        url: '/demo6/setTransactionStartTime?id='+id,
        method: 'POST',
        success: function (data) {
            //alert("success");
        }
    });
}

/**
 *
 * @param sent: Date
 * @param type:String
 * @param amount: double
 * @param start: ip [String]
 * @param card: id [int]
 * @param currentIp
 * @param destination:ip[String]
 */
function createNewTransaction(type,amount,start,card,currentIp,destination,cardName,cardDate,cardCode){
    $.ajax({
        url: '/demo6/createNewTransaction?transaction_type='+type+'&transaction_amount='+amount+
        '&store_ip='+start+'&card_id='+card+'&current_position_ip='+currentIp+'&current_destination_ip='+destination+
        '&given_card_name='+cardName+'&given_card_date='+cardDate+'&given_card_code='+cardCode,
        method: 'POST',
        async: false,
        success: function (data) {
            updateTransactionQueues();
            //console.log(data);
        }
    });
}


//##############################other functions#########################################################################
$(document).ready(function () {
    getNetworkInfo();
    updateTransactionQueues();
    prepareMap();
});


var parsedData = vis.network.convertDot(networkDOT);
var nodes = new vis.DataSet(parsedData.nodes);
var edges = new vis.DataSet(parsedData.edges);
var data = {
    nodes: nodes,
    edges: edges
};

var container = document.getElementById('networkView');
var options = parsedData.options;

//retrieve the border color, options cant change it because of low priority.
for(var i in data.nodes._data){
    if(data.nodes._data[i].hasOwnProperty('color'))
    {
        data.nodes._data[i].color.border='#2B7CE9';
    }
}

//add the shadow
options.nodes = {
    shadow:{
        enabled: true,
        color: 'rgba(0,0,0,0.5)',
        size:10,
        x:5,
        y:5
    },
};
options.edges = {
    shadow:{
        enabled: true,
        color: 'rgba(0,0,0,0.5)',
        size:10,
        x:5,
        y:5
    },
    color:{
        //color: 'red'
        highlight: '#2B7CE9'
    }
};

// create a network
var network = new vis.Network(container, data, options);

//Sets ALL the nodes to the correct color in the map
var prepareMap = function() {
    var node;
    var edge;
    for( var i in nodes._data ) {
        if( nodes._data.hasOwnProperty(i) ){
            node = nodes._data[i];
            getNodeColor(node);
        }
    }
    for( i in edges._data ) {
        if( edges._data.hasOwnProperty(i) ){
            edge = edges._data[i];
            getEdgeColor(edge);
        }
    }
};

//TransactionQueues is an object that contains { stationIp : Array of transactionIds[] }
//Creates transaction object list for helping the transaction sending algorithm
var updateTransactionQueues = function() {
    getTransactions();
    transactionQueues = {};
    for( var i = 0; i < transactions.length; i++ ) {
        var cip = transactions[i].currentPositionIp;
        var t = transactions[i];
        var currentArray = transactionQueues[cip];
        if( currentArray == undefined ) {
            //There are no current records for this node
            currentArray = [];
            currentArray.push(t);
            transactionQueues[cip] = currentArray;
        }
        else{
            //Already transactions present there
            currentArray.push(t);
            transactionQueues[cip] = currentArray;
        }
    }
};

//TODO
// CREATE ARRAYS IN TRANSACTION QUEUES
// UPDATE TRANSACTION QUEUE ALGORITHM
// VERIFICATION

//-----------------------------------DYNAMIC FUNCTIONS------------------------------------------------------

//Decides which popup-window to display and populates it when a node is clicked on
network.on("click", function (params) {
    getNetworkInfo();
    params.event = "[original event]";
    //IT IS AN EDGE OR NOTHING
    if (params.nodes[0] === undefined) {
        if (params.edges[0] === undefined) {
            //DID NOT CLICK ON ANYTHING USEFUL
        }
        //CLICKED ON AN EDGE
        else {
            var edgeId = params.edges[0];
            var ip1, ip2, weight;

            console.log(edgeId);
            var edgeObj = edges._data[edgeId];
            ip1 = edgeObj.from;
            ip2 = edgeObj.to;
            weight = edgeObj.label;

            //Check if the node is active or not
            var c;
            for( i = 0; i < networkInfo.connections.length; i++ ) {
                if( edgeId === networkInfo.connections[i].connectionId ) {
                    c = networkInfo.connections[i];
                }
            }
            if(c.isActive === 1){
                document.getElementById("toggleConnection").style.backgroundColor = '#ff0000';
                document.getElementById("toggleConnection").innerText = "Deactivate";
            }
            else{
                document.getElementById("toggleConnection").style.backgroundColor = '#00ff00';
                document.getElementById("toggleConnection").innerText = "Activate";
            }

            //Create edge window
            $('#connectionId').html(edgeId);
            $('#first_ip').html(ip1);
            $('#second_ip').html(ip2);
            $('#weightValue').html(weight);
            $('#connectionModal').modal('show');
        }
    }
    //IT IS ONE OF THE NODES
    else {
        var myNode = params.nodes[0];
        var btnToggle;
        var applyButton;
        var nodeIp = '192.168.0.' + myNode;
        var nodeObj;
        var limitEntry;
        var isRelayStation = false;
        var queue = document.getElementById('queueTable');

        //Is it the PCenter? If so alter relaystation menu and return
        if (myNode === 'Processing Center') { //PROCESSING CENTER
            $('#relayIp').html('Processing Center');
            //queue.style.display = 'none';
            btnToggle = document.getElementById('toggleRelay');
            btnToggle.style.display = 'none';
            applyButton = document.getElementById('applyButton');
            applyButton.style.display = 'none';
            limitEntry = document.getElementById('newLimit');
            limitEntry.style.display = 'none';

            //CLEAR TABLE
            while(queue.rows.length > 0) {
                queue.deleteRow(0);
            }

            //ADD HEADER
            $('#queueTable').append('<tr>'+
                '<td>Transaction Queue</td>'+
                '<td>Card ID</td>'+
                '<td>Status</td>'+
                '<td>Type</td>'+
                '<td>Store IP</td>'+
                '<td>Destination IP</td>'+
                '</tr>');

            //UPDATE TRANSACTION QUEUE, 'DECRYPTED'
            for( var i = 0; i < transactions.length; i++ ) {
                var t = transactions[i];
                if(t.currentPositionIp == pCenter) {
                    var tId = t.transactionId;
                    var cardId = t.givenCardId;
                    var status = t.transactionStatus;
                    var type = t.transactionType;
                    var store = t.storeIp;
                    var tdest = t.currentDestinationIp;

                    $('#queueTable').append('<tr>'+
                        '<td>Transaction# '+tId+'</td>'+
                        '<td>'+cardId+'</td>'+
                        '<td>'+status+'</td>'+
                        '<td>'+type+'</td>'+
                        '<td>'+store+'</td>'+
                        '<td>'+tdest+'</td>'+
                        '</tr>');
                }
            }

            $('#relayModal').modal('show');
            return;
        }

        //Check if its in the list of relay stations
        //If found, get the relayStation object
        for( var i = 0; i < networkInfo.relayStations.length; i++ ) {
            if( nodeIp === networkInfo.relayStations[i].stationIp ) {
                nodeObj = networkInfo.relayStations[i];
                isRelayStation = true;
            }
        }

        if ( isRelayStation === true ) {  //RELAY STATION
            //CHANGE SOME HTML
            btnToggle = document.getElementById('toggleRelay');
            btnToggle.style.display = 'inline';
            $('#relayIp').html(nodeIp);
            queue.style.display = 'table';
            applyButton = document.getElementById('applyButton');
            applyButton.style.display = 'inline';
            limitEntry = document.getElementById('newLimit');
            limitEntry.style.display = 'inline';

            //SET CURRENT TRANSACTION LIMIT
            limitEntry.value = nodeObj.transactionLimit;

            //CLEAR TABLE
            while(queue.rows.length > 0) {
                queue.deleteRow(0);
            }

            //ADD HEADER
            $('#queueTable').append('<tr>'+
                '<td>Transaction Queue</td>'+
                '<td>Card ID</td>'+
                '<td>Status</td>'+
                '<td>Type</td>'+
                '<td>Store IP</td>'+
                '<td>Destination IP</td>'+
                '</tr>');

            //UPDATE TRANSACTION QUEUE, 'ENCRYPTED'
            for( var i = 0; i < transactions.length; i++ ) {
                var t = transactions[i];
                if(t.currentPositionIp == nodeIp) {
                    var tId = t.transactionId;
                    var cardId = "ENCRYPTED";
                    var status = "ENCRYPTED";
                    var type = "ENCRYPTED";
                    var store = "ENCRYPTED";
                    var tdest = t.currentDestinationIp;

                    $('#queueTable').append('<tr>'+
                        '<td>Transaction# '+tId+'</td>'+
                        '<td>'+cardId+'</td>'+
                        '<td>'+status+'</td>'+
                        '<td>'+type+'</td>'+
                        '<td>'+store+'</td>'+
                        '<td>'+tdest+'</td>'+
                        '</tr>');
                }
            }

            //UPDATE BUTTON STATUS
            if(nodeObj.isActive === 1){
                btnToggle.style.backgroundColor = '#ff0000';
                btnToggle.innerText = "Deactivate";
            }
            else{
                btnToggle.style.backgroundColor = '#00ff00';
                btnToggle.innerText = "Activate";
            }
            $('#relayModal').modal('show');

        }
        else {                          //STORE
            //Get the store object
            for (i = 0; i < networkInfo.stores.length; i++) {
                if ( nodeIp === networkInfo.stores[i].storeIp ) {
                    nodeObj = networkInfo.stores[i];
                }
            }
            var storeName = nodeObj.merchantName;
            $('#storeNameOption').value = "CREDIT";
            //$('#storeNameOption').html(storeName + (' (Credit)'));

            $('#storeIp').html(nodeIp);
            $('#merchantName').html(storeName);
            $('#storeModal').modal('show');
        }
    }
});

$('#btnNewTransaction').click(function () {
    $('#storeModal').modal('hide');
    $('#transactionModal').modal('show');
});

$('#btnSubmitTransaction').click(function () {
    //Retrieve user entered values
    var cardName = document.getElementById('cardName').value;
    var cardNumber = document.getElementById('cardNumber').value;
    var securityCode = document.getElementById('securityCode').value;
    var date = document.getElementById('monthDate').value + '/' + document.getElementById('yearDate').value;
    var transactionType = $('#transactionType').find(":selected").text();
    var transactionAmount = document.getElementById('transactionAmount').value;

    //Verify Card Number
    if( cardNumber.charAt(0) == "0" || cardNumber.charAt(0) == "9" ) {
        alert("The first number of a valid credit card number cannot be zero or nine!");
        return;
    }
    if( cardNumber.length != 16 ) {
        alert("A valid credit card number has 16 characters in it!");
        return;
    }

    //Verify Card Name
    var splitName = cardName.split(" ");
    var firstName = "";
    var lastName = "";
    console.log(splitName);
    for( i = 0; i < splitName.length; i++ ) {
        if( i === 0 ) {
            firstName = splitName[i];
        }
        else{
            lastName += splitName[i];
        }
    }
    if( firstName.length < 2 || firstName.length > 15 ) {
        alert("The first name must be between 2 and 15 characters inclusive");
        return;
    }
    if( lastName.length < 2 || lastName.length > 15 ) {
        alert("The last name must be between 2 and 15 characters inclusive");
        return;
    }

    //Verify Card Code
    if( isNaN(securityCode) ) {
     alert("A security code must be a three digit number, not starting with zero!");
     return;
    }
    if( securityCode.length != 3 ) {
        alert("A security code must be three digits long!");
        return;
    }
    if( securityCode.charAt(0) == "0" ) {
        alert("A security code must not begin with a zero!");
        return;
    }

    //Verify Amount
    if( isNaN(transactionAmount) === false ) {
        //The value is a number
        var num = parseFloat(transactionAmount);
        console.log(num);
        if( num <= 0 ) {
            alert("The transaction amount must be a positive number! To pay off balance, please select the DEBIT option.");
            return;
        }
    }

    //Get current store ip
    var storeIp = document.getElementById('storeIp').innerText;

    createNewTransaction(transactionType,transactionAmount,storeIp,cardNumber,storeIp,pCenter,cardName,date,securityCode);
    //prepareMap();
    //setTimeout(updateTransactionQueues, 250);
    setTimeout(prepareMap, 500);

    document.getElementById("form_one").reset();
    document.getElementById("form_two").reset();
    $('#transactionModal').modal('hide');
});

$('#btnCancel').click(function () {
    document.getElementById("form_one").reset();
    document.getElementById("form_two").reset();
});

//ACTIVATE/DEACTIVATE RELAY STATIONS AND CONNECTIONS---------
$('#toggleRelay').click(function() {
    var ip = document.getElementById("relayIp").innerText;
    changeStationStatusByIp(ip);
    $('#relayModal').modal('hide');
});

$('#toggleConnection').click(function(){
    var id = document.getElementById("connectionId").innerText;
    changeConnectionStatusById(id);
    $('#connectionModal').modal('hide');
});

//CHANGE TRANSACTION LIMITS
$('#applyButton').click(function() {
    var limitEntry = document.getElementById('newLimit');
    var limit = limitEntry.value;
    var ip = document.getElementById('relayIp').innerText;

    //Quick check
    if( limit > 0 && limit < 1000000) {
        changeCapacity(ip,limit);
        $('#relayModal').modal('hide');
        alert("The limit has been changes successfully!");
    }
    else{
        alert("The limit should be a positive value!");
    }
});

//OPEN STORE MODAL
$('#addStore').click(function() {
    var region = document.getElementById('newStoreRegion');
    var maxRegions = 0;

    //Get number of regions
    for( var i = 0; i < networkInfo.relayStations.length; i++ ) {
        var r = networkInfo.relayStations[i];
        if( r.region > maxRegions ) {
            maxRegions = r.region;
            totalRegions = maxRegions;
        }
    }

    //Clear table
    var table = document.getElementById('storeRelayTable');
    while(table.rows.length > 1) {
        table.deleteRow(table.rows.length-1);
    }

    //Clear values
    for( i = region.options.length -1; i >=0; i-- ) {
        region.remove(i);
    }

    //Add current region options
    for( i = 0; i < maxRegions; i++ ) {
        var option = document.createElement("option");
        option.text = (i+1);
        region.add(option);
    }
    //Add new region option
    // option = document.createElement("option");
    // option.text = "New";
    // region.add(option);

    //region.selecedIndex = -1;

    $('#addStoreModal').modal('show');
});

//FILL OUT STORE TABLE
$('#newStoreRegion').change(function() {
    var region = $('#newStoreRegion option:selected').text();
    var table = document.getElementById('storeRelayTable');

        //Clear table
        while(table.rows.length > 1) {
            table.deleteRow(table.rows.length-1);
        }

        //Fill out table
        for( i = 0; i < networkInfo.relayStations.length; i++ ) {
            var r = networkInfo.relayStations[i];
            if( r.region == region ) {
                var ip = r.stationIp;
                $('#storeRelayTable').append('<tr>'+
                    '<td>'+ip+'</td>'+
                    '<td><input type="number" placeholder="Weight" id="storeRelayWeight1"></td>'+
                    '<td><input type="checkbox" id="storeRelayCheckbox1"</td>'+
                    '</tr>');
            }
        }


});

//OPEN RELAY MODAL
$('#addRelay').click(function() {
    var region = document.getElementById('newRelayRegion');
    var maxRegions = 0;

    //Reset store field
    var newStoreToNewRegionForm = document.getElementById('newStoreToNewRegion');
    newStoreToNewRegionForm.style.display = 'none';

    //Get number of regions
    for( var i = 0; i < networkInfo.relayStations.length; i++ ) {
        var r = networkInfo.relayStations[i];
        if( r.region > maxRegions ) {
            maxRegions = r.region;
            totalRegions = maxRegions;
        }
    }

    //Clear relayRelayTable
    var table = document.getElementById('relayRelayTable');
    while(table.rows.length > 1) {
        table.deleteRow(table.rows.length-1);
    }

    //Clear relayStoreTable
    var table = document.getElementById('relayStoreTable');
    while(table.rows.length > 1) {
        table.deleteRow(table.rows.length-1);
    }

    //Clear values
    for( i = region.options.length -1; i >=0; i-- ) {
        region.remove(i);
    }

    //Add current region options
    for( i = 0; i < maxRegions; i++ ) {
        var option = document.createElement("option");
        option.text = (i+1);
        region.add(option);
    }
    //Add new region option
    option = document.createElement("option");
    option.text = "New";
    region.add(option);

    //region.selecedIndex = -1;
    //Possible make index not 1?

    $('#addRelayModal').modal('show');
});

//Controls The Relay Tables
$('#newRelayRegion').change(function() {
    //var newStoreToNewRegionForm = $('#newStoreToNewRegion');
    var newStoreToNewRegionForm = document.getElementById('newStoreToNewRegion');
    newStoreToNewRegionForm.style.display = 'none';

    var region = $('#newRelayRegion option:selected').text();
    var result1 = fillRelayRelayTable(region);
    var result2 = fillRelayStoreTable(region);
    if( result1 == "New" && result2 == "New" ) {
        newStoreToNewRegionForm.style.display = 'block';
    }
});

//FILL OUT RELAY RELAY TABLE
var fillRelayRelayTable = function(region) {
    var table = document.getElementById('relayRelayTable');
    table.style.display = 'table';

    //Clear table
    while(table.rows.length > 1) {
        table.deleteRow(table.rows.length-1);
    }

    if( region == "New" ){
        //Allow user to select gateways or the pcenter to attach to
        table.style.display = 'table';
        for( i = 0; i < networkInfo.relayStations.length; i++ ) {
            var r = networkInfo.relayStations[i];
            if( r.stationType != 0 ) {
                var ip = r.stationIp;
                $('#relayRelayTable').append('<tr>'+
                    '<td>'+ip+'</td>'+
                    '<td><input type="number" placeholder="Weight" id="relayRelayWeight1"></td>'+
                    '<td><input type="checkbox" id="relayRelaycheckbox1"</td>'+
                    '</tr>');
            }
        }
        return "New";
    }
    else{
        //Fill out table
        for( i = 0; i < networkInfo.relayStations.length; i++ ) {
            var r = networkInfo.relayStations[i];
            if( r.region == region ) {
                var ip = r.stationIp;
                $('#relayRelayTable').append('<tr>'+
                    '<td>'+ip+'</td>'+
                    '<td><input type="number" placeholder="Weight" id="relayRelayWeight1"></td>'+
                    '<td><input type="checkbox" id="relayRelaycheckbox1"</td>'+
                    '</tr>');
            }
        }
    }
};

//FILL OUT RELAY STORE TABLE
var fillRelayStoreTable = function(region) {
    var table = document.getElementById('relayStoreTable');
    table.style.display = 'table';

    //Clear table
    while(table.rows.length > 1) {
        table.deleteRow(table.rows.length-1);
    }

    console.log(region);
    if( region == "New" ){
        //Hide table, return NEW
        table.style.display = 'none';
        return "New";
    }
    else{
        //Fill out table
        for( i = 0; i < networkInfo.stores.length; i++ ) {
            var s = networkInfo.stores[i];
            if( s.region == region ) {
                var ip = s.storeIp;
                $('#relayStoreTable').append('<tr>'+
                    '<td>'+ip+'</td>'+
                    '<td><input type="number" placeholder="Weight" id="relayStoreWeight1"></td>'+
                    '<td><input type="checkbox" id="relayStorecheckbox1"</td>'+
                    '</tr>');
            }
        }
    }
};

//ADD STORE
$('#addStoreButton').click(function() {
    var table = document.getElementById("storeRelayTable");

    //Add store
    var region = $('#newStoreRegion option:selected').text();
    var ip = document.getElementById('newStoreIp').value;
    var name = document.getElementById('newStoreName').value;

    //Verification
    var exists = nodes.get(ip.substr(10));
    //console.log(exists);
    if( name != "" ) {
        if(!exists) {
            if(!ipIsCorrectFormat(ip)) {
                alert("The store ip must follow the format 192.168.0.--- and cannot end in 0, 255 or greater than 255");
                return;
            }

            //Check for a selected relaystation
            if( isAnItemSelected(table) === false ) {
                alert("You must select a relay station to attach the store to!");
                return;
            }

            //Check weights
            if( areWeightsFilledIn(table) === false ){
                alert("A weight must be given for any connection being created!");
                return;
            }

            //Add store
            createStore(ip,name,region);

            //Add connection for every relay station connected
            for( var r = 1, n = table.rows.length; r < n; r++ ) {
                var checkbox = table.rows[r].cells[2].childNodes[0];
                if( checkbox.checked ) {
                    //THE ROW IS SELECTED
                    var nodeIp = table.rows[r].cells[0].innerText;
                    var weight = table.rows[r].cells[1].childNodes[0].value;
                    createConnection(ip,nodeIp,1,weight);
                }
            }
            document.getElementById("addStoreFormOne").reset();
            $('#addStoreModal').modal('hide');
            setTimeout(prepareMap, 250);
        }
        else{
            alert("This Ip is being used by another store or relay station!");
        }
    }
    else{
        alert("You must enter a store name!");
    }
});

//ADD Relay
$('#addRelayButton').click(function() {
    var relayTable = document.getElementById("relayRelayTable");
    var storeTable = document.getElementById("relayStoreTable");

    //Relay Station
    var region = $('#newRelayRegion option:selected').text();
    var ip = document.getElementById('newRelayIp').value;
    var limit = document.getElementById('newRelayLimit').value;

    //VALIDATION
    if( !ipIsCorrectFormat(ip) ) {
        alert("The relay ip must follow the format 192.168.0.--- and cannot end in 0, 255 or greater than 255");
        return;
    }

    console.log("Here");
    console.log(ip);

    var exists = nodes.get(ip.substr(10));
    if( exists ) {
        alert("This Ip is being used by another store or relay station!");
        return;
    }

    if( limit < 0 ) {
        alert("The limit should be a positive value or 0!");
        return;
    }

    //Are we adding to a new region?
    if( region == "New" ) {
        console.log("New Region Added");
        var newStoreIp = document.getElementById('newStoreToNewRegionIp').value;
        var newStoreName = document.getElementById('newStoreToNewRegionName').value;
        var newStoreWeight = document.getElementById('newStoreToNewRegionWeight').value;

        //VALIDATION
        if( !ipIsCorrectFormat(ip) ) {
            alert("The store ip must follow the format 192.168.0.--- and cannot end in 0, 255 or greater than 255");
            return;
        }

        var exists = nodes.get(ip.substr(10));
        if( exists ) {
            alert("This Ip is being used by another store or relay station!");
            return;
        }

        if( newStoreName == "" ) {
            alert("The store must have a name!");
            return;
        }

        //Check Relay table selection
        if( isAnItemSelected(relayTable) ===false ) {
            alert("You must attach the region to at least one gateway or the processing center");
            return;
        }

        //Check weights
        if( areWeightsFilledIn(relayTable) === false ){
            alert("A weight must be given for any connection being created!");
            return;
        }

        //Add relaystation
        totalRegions += 1;
        createRelayStation(ip,1,1,totalRegions,limit);
        createStore(newStoreIp, newStoreName, totalRegions);
        createConnection(ip,newStoreIp,1,newStoreWeight);

        //ALLOW USER TO PICK OTHER GATEWAYS/PCENTER TO ATTACH TO
        for( var r = 1, n = relayTable.rows.length; r < n; r++ ) {
            var checkbox = relayTable.rows[r].cells[2].childNodes[0];
            if( checkbox.checked ) {
                var nodeIp = relayTable.rows[r].cells[0].innerText;
                var weight = relayTable.rows[r].cells[1].childNodes[0].value;
                createConnection(ip,nodeIp,1,weight);
            }
        }
        document.getElementById("addRelayFormOne").reset();
        document.getElementById("addStoreToNewRegion").reset();
        $('#addRelayModal').modal('hide');
        setTimeout(prepareMap, 250);
        return;
    }

    //Verification
            if( isAnItemSelected(relayTable) === false && isAnItemSelected(storeTable) === false ) {
                alert("You must attach the relay station to either a store or other relay station");
                return;
            }

            //Check weights relayTable
            if( areWeightsFilledIn(relayTable) === false ){
                alert("A weight must be given for any connection being created!");
                return;
            }

            //Check weights storeTable
            if( areWeightsFilledIn(storeTable) === false ){
                alert("A weight must be given for any connection being created!");
                return;
            }

            //Add Relay Station
            createRelayStation(ip,1,0,region,limit);

            //Add connection for every relay station connected
            for( var r = 1, n = relayTable.rows.length; r < n; r++ ) {
                var checkbox = relayTable.rows[r].cells[2].childNodes[0];
                if( checkbox.checked ) {
                    //THE ROW IS SELECTED
                    var nodeIp = relayTable.rows[r].cells[0].innerText;
                    var weight = relayTable.rows[r].cells[1].childNodes[0].value;
                    createConnection(ip,nodeIp,1,weight);
                }
            }

            //Add connection for every store connected
            for( var r = 1, n = storeTable.rows.length; r < n; r++ ) {
                var checkbox = storeTable.rows[r].cells[2].childNodes[0];
                if( checkbox.checked ) {
                    //THE ROW IS SELECTED
                    var nodeIp = storeTable.rows[r].cells[0].innerText;
                    var weight = storeTable.rows[r].cells[1].childNodes[0].value;
                    createConnection(ip,nodeIp,1,weight);
                }
            }
            document.getElementById("addRelayFormOne").reset();
            document.getElementById("addStoreToNewRegion").reset();
            $('#addRelayModal').modal('hide');
            setTimeout(prepareMap, 250);
});

$('#cancelAddStore').click(function() {
    document.getElementById("addStoreFormOne").reset();
});

$('#cancelAddRelay').click(function() {
    document.getElementById("addRelayFormOne").reset();
    document.getElementById("addStoreToNewRegion").reset();
});

var ipIsCorrectFormat = function(ip) {
    if( ip.length > 13 || ip.length < 11 ) {
        return false;
    }
    var threeDigits = ip.substr(10);
    if( isNaN(threeDigits) ) {
        return false;
    }
    var num = parseInt(threeDigits,10);
    if( num >= 254 || num == 0) {
        return false;
    }
    return true;
};

var areWeightsFilledIn = function(table) {
    //Check weights
    for( var r = 1, n = table.rows.length; r < n; r++ ) {
        var checkbox = table.rows[r].cells[2].childNodes[0];
        if( checkbox.checked ) {
            var weight = table.rows[r].cells[1].childNodes[0].value;
            if( weight == "" ) {
                return false;
            }
        }
    }
    return true;
};

var isAnItemSelected = function(table) {
    for( var r = 1, n = table.rows.length; r < n; r++ ) {
        var checkbox = table.rows[r].cells[2].childNodes[0];
        if( checkbox.checked ) {
            return true;
        }
    }
    return false;
};

//ANIMATION STUFF--------------------------------------------

//Handle the play/pause button
$('#toggle_button').click(function () {
    var button = document.getElementById("toggle_button");

   if( button.innerText === "Start") {  //BEGIN ANIMATION
       button.innerText = "Pause";
       button.style.backgroundColor = '#f44336';
       running = true;
       //tryAgain = true;
       //tryRunningRepeat();
   }
   else{                                //PAUSE ANIMATION
       button.innerText = "Start";
       button.style.backgroundColor = '#4CAF50';
       running = false;
       //tryAgain = false;
   }
});

// var tryRunningRepeat = function() {
//     if( tryAgain === true ) {
//         runAnimation();
//         setTimeout(tryRunningRepeat, 250);
//     }
// };

// var runAnimation = function() {
//    if(running)
//    {
//        for( var i = 0; i < transactions.length; i++ )
//        {
//            //console.log(transactions.length);
//            var currentIp = transactions[i].currentPositionIp;
//            var destinationIp = transactions[i].currentDestinationIp;
//            var t = transactions[i];
//            getNextIp(currentIp, destinationIp, t);
//        }
//        prepareMap();
//        //setTimeout(updateTransactionQueues, animationTimer*.85); //POTENTIAL PROBLEM
//    }
// };

//Calls one transaction at a time from each node, to be moved along to the next node.
var runAnimation = function() {
    //Only proceed if we are running
    if(running) {
        console.log("Begin RUN");
        nodeStepSummaries = [];
        //var count = -1;
        for( var ip in transactionQueues ) {
            if( transactionQueues.hasOwnProperty(ip) ) {
                var isActive = true;
                //Check to make sure the current station is not inActive
                for( var i = 0; i < networkInfo.relayStations.length; i++ ) {
                    var r = networkInfo.relayStations[i];
                    if( r.stationIp == ip ) {
                        //We have found the network info for this ip
                        if( r.isActive == 0 ) {
                            isActive = false;
                        }
                    }
                }
                if( isActive ) {
                    //Grab first transaction in queue for this node
                    var array = transactionQueues[ip];
                    var t = array[0];

                    //Error catcher
                    if( t != undefined ) {
                        //count = count + 1;
                        var currentIp = t.currentPositionIp;
                        var destination = t.currentDestinationIp;
                        //console.log(destination);
                        getNextIp(currentIp, destination, t);
                        //nodeStepSummaries.push(nss);

                    }
                    else{
                        console.log("Warning: Grabbed from empty queue");
                    }
                }
            }
        }
        //Do the animation
        for( var j = 0; j < nodeStepSummaries.length; j++ ) {
            var nodeStepSummary = nodeStepSummaries[j];
            setNextAnimationStep(nodeStepSummary.oldNode, nodeStepSummary.newNode, nodeStepSummary.connection);
        }
        nodeStepSummaries = [];
        //console.log("End RUN");
    }
};

var setConnectionWidth = function( connection, w ) {
    connection.width = w;
    edges.update(connection);
};

var setNextAnimationStep = function( oldNode, newNode, connection) {
    if( connection != undefined ) {
        //--------ANIMATION--------------
        //Update connection animations
        setTimeout(function() {
            setConnectionWidth(connection,15);
        }, 0);

        setTimeout(function() {
            setConnectionWidth(connection,1);
        }, 1000);

        // setTimeout(function() {
        //     prepareTransactionForUpdate(t, data);
        // }, animationTimer*.60);

        //Update both of the node's colors on the graph
        setTimeout(function() {
            getNodeColor(oldNode);
        }, 1000);

        setTimeout(function() {
            getNodeColor(newNode);
        }, 1000);
    }
};

var prepareTransactionForUpdate = function(t, data) {
    //Update the transaction.
    if(data == pCenter && t.currentDestinationIp == pCenter){
            var transaction = {
                transactionId: t.transactionId,
                storeIp: t.storeIp,
                transactionType: t.transactionType,
                transactionAmount: t.transactionAmount,
                cardId: t.givenCardId+"",
                cardName: t.givenCardName,
                securityCode: t.givenCardCode,
                expirationDate: t.givenCardDate
            };
            console.log(transaction);
        processingVerification(transaction);
    }
    else if(t.transactionStatus === "PENDING"){
        updateTransaction(t.transactionId,t.transactionStatus, data, t.currentDestinationIp);
    }
    else{
        updateTransaction(t.transactionId,t.transactionStatus, data, t.currentDestinationIp);
    }
};

//GET A PRESET COLOR FOR THE GRAPH BASED ON REGION NUMBER
var getPresetColor = function(i) {
    var hGrey = "#CCCCCC";
    var hCyan = "#00FFFF";
    var hLGreen = "#99CC33";
    var hYellow = "#FFFF00";
    var hPink = "#FF66CC";
    var hOrange = "#FF9900";
    var hDGreen = "#006600";
    var hBlue = "#0000FF";

    i = i % 7;
    switch(i) {
        case 0 :
            return hGrey;
        case 1 :
            return hCyan;
        case 2 :
            return hLGreen;
        case 3 :
            return hYellow;
        case 4 :
            return hPink;
        case 5 :
            return hOrange;
        case 6 :
            return hDGreen;
        case 7 :
            return hBlue;
        default :
            return hGrey;
    }
};

//PASS IT A NODE AND ITS COLOR WILL BE UPDATED
var getNodeColor = function(node) {
	var red = "#f44336";
	var black = "#000000";
	
	//Find node info
	var nodeInfo;
	
	for( var i = 0; i < networkInfo.relayStations.length; i++ ) {
		if( node.id == networkInfo.relayStations[i].stationIp.substr(10) ){
			nodeInfo = networkInfo.relayStations[i];
		}
		else if(node.id == "Processing Center" && networkInfo.relayStations[i].stationIp == pCenter){
			nodeInfo = networkInfo.relayStations[i];
		}
	}
	for ( i = 0; i < networkInfo.stores.length; i++ ) {
		if( node.id == networkInfo.stores[i].storeIp.substr(10) ){
			nodeInfo = networkInfo.stores[i];
		}
	}
	
	//IT IS INACTIVE
	if( nodeInfo.isActive === 0 ) {
		node.color.background = black;
		node.color.highlight = black;
		nodes.update(node);
		return;
	}
	//IT CONTAINS A TRANSACTION
	for( i = 0; i < transactions.length; i++ ) {
		if( transactions[i].currentPositionIp == nodeInfo.stationIp || transactions[i].currentPositionIp == nodeInfo.storeIp ) {
			node.color.background = red;
			node.color.highlight = red;
			nodes.update(node);
			return;
		}
	}
	//IT IS ITS BASE COLOR
	var myColor = getPresetColor(nodeInfo.region);
	node.color.background = myColor;
	node.color.highlight = myColor;
	nodes.update(node);
};

//PASS IT AN EDGE AND IT WILL BE UPDATED
var getEdgeColor = function(edge) {
    //Find edgeInfo
    var edgeInfo;
    for( var i = 0; i < networkInfo.connections.length; i++ ) {
        if( edge.id == networkInfo.connections[i].connectionId ) {
            edgeInfo = networkInfo.connections[i];
        }
    }

    if( edgeInfo.isActive == 1 ) {
        edge.color.color = "#2B7CE9";
        edge.color.highlight = "#2B7CE9";
    }
    else{
        edge.color.color = "#000000";
        edge.color.highlight = "#000000";
    }
    edges.update(edge);
};

$("#newStoreIp").keydown(function(e) {
    var oldvalue=$(this).val();
    var field=this;
    setTimeout(function () {
        if(field.value.indexOf('192.168.0.') !== 0) {
            $(field).val(oldvalue);
        }
    }, 1);
});

$("#newRelayIp").keydown(function(e) {
    var oldvalue=$(this).val();
    var field=this;
    setTimeout(function () {
        if(field.value.indexOf('192.168.0.') !== 0) {
            $(field).val(oldvalue);
        }
    }, 1);
});

$('#newStoreToNewRegionIp').keydown(function(e) {
    var oldvalue=$(this).val();
    var field=this;
    setTimeout(function () {
        if(field.value.indexOf('192.168.0.') !== 0) {
            $(field).val(oldvalue);
        }
    }, 1);
});

//Starts the animation clock that runs during execution
setInterval(runAnimation, cycleTimer);



