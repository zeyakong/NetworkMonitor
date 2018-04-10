
//##########################Class variables#########################
//object
var networkInfo;
//array
var transactions;

//Controls start/stop
var running;
var animationTimer = 3000;

//Global Constant
var pCenter = "192.168.0.253";

//##########################ajax functions##########################

function createStore(ip,name,region){
    $.ajax({
        url: '/createStore',
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
        }
    });
}

function createRelayStation(ip,status,type,region,limit){
    $.ajax({
        url: '/createRelayStation',
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
            var newRelay = {
                id: ip.substr(10),
                label: ip.substr(10),
                shape: "diamond",
                color:{
                    background: getPresetColor(region),
                    border: "#2B7CE9",
                    highlight: "#99CC33"
                }
            };
            nodes.add(newRelay);
            getNetworkInfo();
        }
    });
}

function createConnection(start_ip,end_ip,is_active,weight) {
    $.ajax({
        url: '/createConnection',
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

            var newConnection ={
                to: parseInt(end_ip.substr(10), 10),
                from: parseInt(start_ip.substr(10), 10),
                id: id,
                label: weight,
                color:{
                    color: "#2B7CE9",
                }
            };
            edges.add(newConnection);
            getNetworkInfo();
        }
    });
}

/**
 this function will return a message (SUCCESS | ERROR | DENY)
 SUCCESS: all info matched and the balance(only) was changed.(You should update the transaction later)
 ERROR: INNER ERROR.(impossible I THINK,UNLESS YOU SEND A EMPTY TRANSACTION)
 DENY: THE CARD NOT EXIST OR BALANCE IS WRONG....
 PS: ALL the transaction type is UPPERCASE.
 currentPositionIp: storeIp,[I DONT USE THIS]
 currentDestinationIp: pCentercardId: cardNumber, [I DONT USE THIS]
 * @param transactionInfo= {
            transactionType: transactionType, [String]
            transactionAmount: transactionAmount, [Double]
            cardId: cardNumber, [String]
            cardName: cardName,[String]
            securityCode: securityCode,[int]
            expirationDate: date [String]
        }
 */
// function processingVerification(transactionInfo){
//     $.ajax({
//         url: '/processingVerification',
//         method: 'POST',
//         data:{
//             transactionInfo:transactionInfo
//         },
//         success: function (data) {
//             //OK | ERROR
//             console.log(data);
//             if(data=="OK"){
//                 //Update transaction with Approved
//                 updateTransaction(transactionInfo.transactionId,"APPROVED",data, t.storeIp);
//             }else if(data=="DENY"){
//                 updateTransaction(transactionInfo.transactionId,"DENIED",data, t.storeIp);
//             }
//         }
//     });
// }

function processingVerification(transactionInfo) {
    console.log(transactionInfo);
    $.ajax({
        url: '/processingVerification',
        method: 'POST',
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(transactionInfo),
        success: function (data) {
            //OK | ERROR
            console.log(data);
            if (data == "OK") {
                updateTransaction(transactionInfo.transactionId, "APPROVED", pCenter, transactionInfo.storeIp);
            } else {
                updateTransaction(transactionInfo.transactionId, "DENIED", pCenter, transactionInfo.storeIp);
            }
        }
    });
}

function changeCapacity(ip,newLimit){
    $.ajax({
        url: '/changeCapacity',
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
        url: '/getNetworkInfo',
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
        url: '/getTransactions',
        method: 'GET',
        //async: false,
        success: function (data) {
            transactions=data;
            for( var i = 0; i < transactions.length; i++ ) {
                if( (transactions[i].currentPositionIp === transactions[i].currentDestinationIp && transactions[i].currentPositionIp === transactions[i].storeIp) ) {
                    transactions.splice(i, 1);
                }
            }
            console.log(transactions);
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
        url: '/updateTransaction?id='+id+"&status="+status+"&currentIP="+currentIP+"&nextIp="+nextIp,
        method: 'POST'
    });
}

/**
 *
 * @param ip: the current ip
 * @param destination: the destination(Processing center or go back)
 */
function getNextIp(ip,destination,t){
    $.ajax({
        url: '/getNextIp?ip='+ip+'&destination='+destination,
        method: 'GET',
        success: function (data) {

            //GET THE NODE WE WERE AT
            var oldNode;
            if(ip.substr(10) === '253'){
                oldNode = nodes.get("Processing Center");
            }
            else{
                oldNode = nodes.get(ip.substr(10));
            }

            //GET THE NEW NODE WE ARE MOVING TO
            var newNode;
            if(data.substr(10) === '253'){
                newNode = nodes.get("Processing Center");
            }
            else{
                newNode = nodes.get(data.substr(10));
            }

            //GET THE CONNECTION BETWEEN THEM
            var temp;
            var connection;
            // for(var i in data.nodes._data){
            //     if(data.nodes._data[i].hasOwnProperty('color'))
            //     {
            //         data.nodes._data[i].color.border='#2B7CE9';
            //     }
            // }
            for( var i in edges._data ){
                temp = edges._data[i];
                if( (temp.from == oldNode.id && temp.to == newNode.id) || (temp.from == newNode.id && temp.to == oldNode.id) ){
                    connection = temp;
                }
            }

            setTimeout(function() {
                setConnectionWidth(connection,15);
            }, animationTimer*.25);

            setTimeout(function() {
                setConnectionWidth(connection,1);
            }, animationTimer*.60);

            setTimeout(function() {
                setColors(oldNode, newNode, t, data);
            }, animationTimer*.60);
        }
    });
}

/**
 * make the connection active or inactive
 * @param id
 */
function changeConnectionStatusById(id){
    $.ajax({
        url: '/changeConnectionStatusById?id='+id,
        method: 'POST',
        success: function (data) {
            //alert("success");
            getNetworkInfo();
            var e = edges.get(id);
            var connection;
            //Get the correct Connection from the database
            for( var i = 0; i < networkInfo.connections.length; i++ ) {
                if( networkInfo.connections[i].connectionId == id ) {
                    connection = networkInfo.connections[i];
                    console.log(connection);
                    setMapActiveInactive(e, 1, connection.isActive, null);
                }
            }
        }
    });
}

/**
 * make the station active or inactive
 * @param id
 */
function changeStationStatusByIp(ip){
    $.ajax({
        url: '/changeStationStatusByIp?ip='+ip,
        method: 'POST',
        success: function (data) {
            //alert("success");
            getNetworkInfo();
            var n = nodes.get(ip.substr(10));
            var station;
            //Get the correct relayStation from the database
            for( var i = 0; i < networkInfo.relayStations.length; i++ ) {
                if( networkInfo.relayStations[i].stationIp === ip ) {
                    station = networkInfo.relayStations[i];
                    console.log(station);
                    setMapActiveInactive(n, 0, station.isActive, station.region);
                }
            }
        }
    });
}

/**
 * when the transaction started . system need store the start time
 * @param id the transaction id
 */
function setTransactionStartTime(id){
    $.ajax({
        url: '/setTransactionStartTime?id='+id,
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
        url: '/createNewTransaction?transaction_type='+type+'&transaction_amount='+amount+
        '&store_ip='+start+'&card_id='+card+'&current_position_ip='+currentIp+'&current_destination_ip='+destination+
        '&given_card_name='+cardName+'&given_card_date='+cardDate+'&given_card_code='+cardCode,
        method: 'POST'
    });
    console.log("here");
}


//##############################other functions#########################################################################
$(document).ready(function () {
    getNetworkInfo();
    getTransactions();
});


var parsedData = vis.network.convertDot(networkDOT);
var nodes = new vis.DataSet(parsedData.nodes);
var edges = new vis.DataSet(parsedData.edges);
var data = {
    nodes: nodes,
    edges: edges
};
console.log(data);

var container = document.getElementById('networkView');
var options = parsedData.options;

//retrieve the border color, options cant change it because of low priority.
for(var i in data.nodes._data){
    if(data.nodes._data[i].hasOwnProperty('color'))
    {
        data.nodes._data[i].color.border='#2B7CE9';
    }
}

// you can extend the options like a normal JSON variable:
// options.nodes = {
//     color:{
//         border:'#2B7CE9'
//     }
// };

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

//LOAD ALL TRANSACTIONS AND ACTIVE/INACTIVE INFO ONTO THE MAP
var prepareMap = function() {
    //Load transactions
    for( var i = 0; i < transactions.length; i++ ) {
        var ip = transactions[i].currentPositionIp;

        var n;
        if(ip.substr(10) === '253'){
            n = nodes.get("Processing Center");
        }
        else{
            n = nodes.get(ip.substr(10));
        }

        n.color.background = "#f44336";
        n.color.highlight = "#f44336";
        n.color.border = '#2B7CE9';
        nodes.update(n);
    }

    //Load active/inactive relayStations
    for( i = 0; i < networkInfo.relayStations.length; i++ ) {
        var node;
        if( networkInfo.relayStations[i].isActive == 0 ) {
            node = nodes.get(networkInfo.relayStations[i].stationIp.substr(10));
            setMapActiveInactive(node, 0, 0, networkInfo.relayStations[i].region);
        }
    }
    //Load active/inactive connections
    for (i = 0; i < networkInfo.connections.length; i++ ) {
        var edge;
        if( networkInfo.connections[i].isActive == 0 ) {
            edge = edges.get(networkInfo.connections[i].connectionId);
            setMapActiveInactive(edge, 1, 0, null);
        }
    }
};

var fixHighlights = function() {
    //Fix highlights relay
    for( i = 0; i < networkInfo.relayStations.length; i++ ) {
        var node;
        if( networkInfo.relayStations[i].stationIp === pCenter ) {
            node = nodes.get("Processing Center")
        }
        else{
            node = nodes.get(networkInfo.relayStations[i].stationIp.substr(10));
        }
        node.color.highlight = getPresetColor(networkInfo.relayStations[i].region);
        nodes.update(node);
    }
    //Stores
    for (i = 0; i < networkInfo.stores.length; i++) {
        var node;
        node = nodes.get(networkInfo.stores[i].storeIp.substr(10));
        node.color.highlight = getPresetColor(networkInfo.stores[i].region);
        nodes.update(node);
    }
};

setTimeout(fixHighlights, 500);
setTimeout(prepareMap, 500);

//Decides which popup-window to display and populates it when a node is clicked on
network.on("click", function (params) {
    getNetworkInfo();
    params.event = "[original event]";
    //console.log(params);
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
                    var cardId = t.cardId;
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

    //Get current store ip
    var storeIp;
    for (i = 0; i < networkInfo.stores.length; i++) {
        if (networkInfo.stores[i].merchantName === $('#merchantName').html()) {
            storeIp = networkInfo.stores[i].storeIp;
        }
    }

    //This object contains both verification information needed for the credit card
    //and transaction information that will be logged in the database
    var transaction = {
        transactionInfo: {
            transactionType: transactionType,
            transactionAmount: transactionAmount,
            cardId: cardNumber,
            currentPositionIp: storeIp,
            currentDestinationIp: pCenter,
            cardName: cardName,
            securityCode: securityCode,
            expirationDate: date
        }
    };
    console.log(transaction);
    createNewTransaction(transactionType,transactionAmount,storeIp,cardNumber,storeIp,pCenter,cardName,date,securityCode);
    setTimeout(getTransactions, 250);
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

//CHANGE TRANSACTION LIMIT
$('#applyButton').click(function() {
    var limitEntry = document.getElementById('newLimit');
    var limit = limitEntry.value;
    var ip = document.getElementById('relayIp').innerText;

    //Quick check
    if( limit > -1 && limit < 1000000) {
        changeCapacity(ip,limit);
        $('#relayModal').modal('hide');
    }
    // console.log(limit);
    // console.log(ip);
});

//OPEN STORE MODAL
$('#addStore').click(function() {
    var region = document.getElementById('newStoreRegion');
    var maxRegions = 4;

    //Get number of regions
    for( var i = 0; i < networkInfo.relayStations.length; i++ ) {
        var r = networkInfo.relayStations[i];
        if( r.region > maxRegions ) {
            maxRegions = r.region;
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
    option = document.createElement("option");
    option.text = "New";
    region.add(option);

    //region.selecedIndex = -1;

    $('#addStoreModal').modal('show');
});

//FILL OUT STORE TABLE
$('#newStoreRegion').change(function() {
    var region = $('#newStoreRegion option:selected').text();
    var table = document.getElementById('storeRelayTable');

    if( region === "New" ){
        //Need to hide table, instead show add relay station options

    }
    else{
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
    }

});

//OPEN RELAY MODAL
$('#addRelay').click(function() {
    var region = document.getElementById('newRelayRegion');
    var maxRegions = 4;

    //Get number of regions
    for( var i = 0; i < networkInfo.relayStations.length; i++ ) {
        var r = networkInfo.relayStations[i];
        if( r.region > maxRegions ) {
            maxRegions = r.region;
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

    $('#addRelayModal').modal('show');
});

//FILL OUT RELAY TABLES
$('#newRelayRegion').change(function() {
    var region = $('#newRelayRegion option:selected').text();
    var result1 = fillRelayRelayTable(region);
    var result2 = fillRelayStoreTable(region);
    if( result1 == "NEW" && result2 == "NEW" ) {
        //Show new store stuff
    }
});

//FILL OUT RELAY RELAY TABLE
var fillRelayRelayTable = function(region) {
    var table = document.getElementById('relayRelayTable');

    if( region === "New" ){
        //Hide table, return NEW
        return "NEW";
    }
    else{
        //Clear table
        while(table.rows.length > 1) {
            table.deleteRow(table.rows.length-1);
        }

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
    var rowNum = 1;

    if( region === "New" ){
        //Hide table, return NEW
        return "NEW";
    }
    else{
        //Clear table
        while(table.rows.length > 1) {
            table.deleteRow(table.rows.length-1);
        }

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
            //Add store
            createStore(ip,name,region);

            //Add connection for every relay station connected
            for( var r = 1, n = table.rows.length; r < n; r++ ) {
                var checkbox = table.rows[r].cells[2].childNodes[0];
                if( checkbox.checked ) {
                    //THE ROW IS SELECTED
                    var nodeIp = table.rows[r].cells[0].innerText;
                    var weight = table.rows[r].cells[1].childNodes[0].value;
                    // console.log("Row " + r);
                    // console.log(ip);
                    // console.log(nodeIp);
                    // console.log(1);
                    // console.log(weight);
                    createConnection(ip,nodeIp,1,weight);
                }
            }
            $('#addStoreModal').modal('hide');
        }
        else{
            alert("This Ip is being used by another store or relay station!");
        }
    }
    else{
        alert("Name must contain a value!");
    }
});

//ADD Relay
$('#addRelayButton').click(function() {
    var relayTable = document.getElementById("relayRelayTable");
    var storeTable = document.getElementById("relayStoreTable");

    //Add Relay Station
    var region = $('#newRelayRegion option:selected').text();
    var ip = document.getElementById('newRelayIp').value;
    var limit = document.getElementById('newRelayLimit').value;

    //Verification
    var exists = nodes.get(ip.substr(10));
    if( !(limit < 0) ) {
        if(!exists){
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
            $('#addRelayModal').modal('hide');
        }
        else{
            alert("This Ip is being used by another store or relay station!");
        }
    }
    else{
        alert("The limit should be a positive value or 0!");
    }
});

//ANIMATION STUFF--------------------------------------------

//Handle the play/pause button
$('#toggle_button').click(function () {
    var button = document.getElementById("toggle_button");

   if( button.innerText === "Start") {  //BEGIN ANIMATION
       button.innerText = "Pause";
       button.style.backgroundColor = '#f44336';
       running = true;
       //runAnimation();
   }
   else{                                //PAUSE ANIMATION
       button.innerText = "Start";
       button.style.backgroundColor = '#4CAF50';
       running = false;
   }
});

var runAnimation = function() {
   if(running)
   {
       //Refresh transaction list
       var i;
       for( i = 0; i < transactions.length; i++ )
       {
           //console.log(transactions.length);
           var currentIp = transactions[i].currentPositionIp;
           var destinationIp = transactions[i].currentDestinationIp;
           var t = transactions[i];
           getNextIp(currentIp, destinationIp, t);
       }
      //console.log("Running");
       refreshTransactionList();
   }
   //console.log("Waiting...");
};

var refreshTransactionList = function() {
    setTimeout(getTransactions, animationTimer*.85);
    //setTimeout(runAnimation, animationTimer);
};

var setConnectionWidth = function( connection, w ) {
    connection.width = w;
    edges.update(connection);
};

//UPDATED THE GRAPH SHAPES --- DEPRICATED
// var setShape = function(oldNode, newNode, t, data) {
//     //CHANGE THE SHAPES
//     if(oldNode.id < 200 ) {
//         oldNode.shape = "ellipse";
//     }
//     else if(oldNode.id === "Processing Center"){
//         oldNode.shape = "square";
//     }
//     else{
//         oldNode.shape = "diamond";
//     }
//     newNode.shape = "star";
//
//     nodes.update(oldNode);
//     nodes.update(newNode);
//
//     //update the transaction.
//     if(data.substr(10) === '253'){
//         updateTransaction(t.transactionId,"APPROVED",data, t.storeIp);
//     }
//     else if(t.transactionStatus === "PENDING"){
//         updateTransaction(t.transactionId,"PENDING",data, pCenter);
//     }
//     else{
//         updateTransaction(t.transactionId,"APPROVED",data, t.storeIp);
//     }
// };

//UPDATE THE GRAPH WITH COLORS
var setColors = function(oldNode, newNode, t, data) {
    //Set the old colors back
    for( var i = 0; i < networkInfo.relayStations.length; i++ ) {
        var n = networkInfo.relayStations[i];
        if( oldNode.label === "Processing Center") {
            oldNode.color.background = getPresetColor(n.region);
            oldNode.color.highlight = getPresetColor(n.region);
            oldNode.color.border = '#2B7CE9';
        }
        else if(oldNode.label === n.stationIp.substr(10)) {
            oldNode.color.background = getPresetColor(n.region);
            oldNode.color.highlight = getPresetColor(n.region);
            oldNode.color.border = '#2B7CE9';
        }
    }
    for( var i = 0; i < networkInfo.stores.length; i++ ) {
        var s = networkInfo.stores[i];
        if(oldNode.label === s.storeIp.substr(10)) {
            oldNode.color.background = getPresetColor(s.region);
            oldNode.color.highlight = getPresetColor(s.region);
            oldNode.color.border = '#2B7CE9';
        }
    }

    //Set the new color
    newNode.color.background = "#f44336";
    newNode.color.highlight = "#f44336";
    newNode.color.border = "#2B7CE9";

    //Update the nodes
    nodes.update(oldNode);
    nodes.update(newNode);

    //Update the transaction.
    if(data.substr(10) === '253'){
        //updateTransaction(t.transactionId,"APPROVED",data, t.storeIp);
            var transaction = {
                transactionId: t.transactionId,
                storeIp: t.storeIp,
                transactionType: t.transactionType,
                transactionAmount: t.transactionAmount,
                cardId: t.cardId+"",
                // currentPositionIp: t.currentPositionIp,
                // currentDestinationIp: t.currentDestinationIp,
                cardName: t.givenCardName,
                securityCode: t.givenCardCode,
                expirationDate: t.givenCardDate
            };
            //console.log(transaction);
        processingVerification(transaction);
    }
    else if(t.transactionStatus === "PENDING"){
        updateTransaction(t.transactionId,t.transactionStatus, data, t.currentDestinationIp);
    }
    else{
        updateTransaction(t.transactionId,t.transactionStatus, data, t.currentDestinationIp);
    }
    //prepareMap();
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

var setMapActiveInactive = function( edge, type, isActive, region ) {
    //Relay Station
    if( type === 0 ) {
        //Check if the station is now active or inactive
        if( isActive === 1 ) {
            edge.color.background = getPresetColor(region);
            edge.color.highlight = getPresetColor(region);
        }
        else {
            edge.color.background = "#000000";
            edge.color.highlight = "#000000";
        }
        nodes.update(edge);
    }
    //Connection
    else {
        //Check if the connection is now active or inactive
        if( isActive === 1 ) {
            edge.color.color = "#2B7CE9";
            edge.color.highlight = "#2B7CE9";
        }
        else{
            edge.color.color = "#000000";
            edge.color.highlight = "#000000";
        }
        edges.update(edge);
    }
};

setInterval(runAnimation, animationTimer);



