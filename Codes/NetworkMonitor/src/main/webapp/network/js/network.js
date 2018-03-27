
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
/**
 * get the whole network info
 */
function getNetworkInfo(){
    $.ajax({
        url: '/getNetworkInfo',
        method: 'GET',
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
        success: function (data) {
            transactions=data;
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
            for( var i = 0; i < parsedData.edges.length; i++ ){
                temp = parsedData.edges[i];
                if( (temp.from === oldNode.id && temp.to === newNode.id) || (temp.from === newNode.id && temp.to === oldNode.id) ){
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
                setShapes(oldNode, newNode, t, data);
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
function createNewTransaction(type,amount,start,card,currentIp,destination){
    $.ajax({
        url: '/createNewTransaction?transaction_type='+type+'&transaction_amount='+amount+
        '&store_ip='+start+'&card_id='+card+'&current_position_ip='+currentIp+'&current_destination_ip='+destination,
        method: 'POST'
    });
}


//##############################other functions#############################
$(document).ready(function () {
    getNetworkInfo();
    getTransactions();
});


var parsedData = vis.network.convertDot(networkDOT);
// console.log(parsedData);
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
};

// create a network
var network = new vis.Network(container, data, options);

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
            for (i = 0; i < parsedData.edges.length; i++) {
                if (edgeId === parsedData.edges[i].id) {
                    ip1 = parsedData.edges[i].from;
                    ip2 = parsedData.edges[i].to;
                    weight = parsedData.edges[i].label;
                }
            }

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
        if (myNode === 'Processing Center') { //PROCESSING CENTER
            $('#relayIp').html('Processing Center');
            $('#relayModal').modal('show');
        }
        else if (myNode >= 200) {  //RELAY STATION
            var stationIp = '192.168.0.' + myNode;
            $('#relayIp').html(stationIp);

            //Check if the node is active or not
            var n;
            var i;
            for( i = 0; i < networkInfo.relayStations.length; i++ ) {
                if( stationIp === networkInfo.relayStations[i].stationIp ) {
                    n = networkInfo.relayStations[i];
                }
            }
            if(n.isActive === 1){
                document.getElementById("toggleRelay").style.backgroundColor = '#ff0000';
                document.getElementById("toggleRelay").innerText = "Deactivate";
            }
            else{
                document.getElementById("toggleRelay").style.backgroundColor = '#00ff00';
                document.getElementById("toggleRelay").innerText = "Activate";
            }

            $('#relayModal').modal('show');

        }
        else {                       //STORE
            var storeIp = '192.168.0.' + myNode;
            for (i = 0; i < networkInfo.stores.length; i++) {
                if (networkInfo.stores[i].storeIp === storeIp) {
                    var storeName = networkInfo.stores[i].merchantName;
                }
            }
            $('#storeNameOption').value = storeName;
            $('#storeNameOption').html(storeName + (' (Credit)'));

            $('#storeIp').html(storeIp);
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
    var destinationIp = "192.168.0.253"; //THE PROCESSING CENTER

    //This object contains both verification information needed for the credit card
    //and transaction information that will be logged in the database
    var transaction = {
        transactionInfo: {
           transactionType: transactionType,
           transactionAmnount: transactionAmount,
           cardId: cardNumber,
           currentPositionIp: storeIp,
           currentDestinationIp: destinationIp
        },
        creditCardInfo: {
            cardId: cardNumber,
            cardName: cardName,
            securityCode: securityCode,
            expirationDate: date
        }
    };
    console.log(transaction);
    createNewTransaction(transactionType,transactionAmount,storeIp,cardNumber,storeIp,destinationIp);
    //TEST
    //updateTransaction(1,'PENDING', storeIp, destinationIp);

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

//ANIMATION STUFF--------------------------------------------
$('#toggle_button').click(function () {
    var button = document.getElementById("toggle_button");

   if( button.innerText === "Start") {  //BEGIN ANIMATION
       button.innerText = "Pause";
       button.style.backgroundColor = '#f44336';
       running = true;
       runAnimation();
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
           //getNextIp('192.168.0.83', '192.168.0.253');
           //console.log(currentIp);
           //console.log(destinationIp);
           getNextIp(currentIp, destinationIp, t);
       }
      //console.log("Test Message");
       refreshTransactionList();
   }
};

var refreshTransactionList = function() {
    setTimeout(getTransactions, animationTimer*.85);
    setTimeout(runAnimation, animationTimer);
};

var setConnectionWidth = function( connection, w ) {
    connection.width = w;
    edges.update(connection);
};

var setShapes = function(oldNode, newNode, t, data) {
    //CHANGE THE SHAPES
    if(oldNode.id < 200 ) {
        oldNode.shape = "ellipse";
    }
    else if(oldNode.id === "Processing Center"){
        oldNode.shape = "square";
    }
    else{
        oldNode.shape = "diamond";
    }
    newNode.shape = "star";

    nodes.update(oldNode);
    nodes.update(newNode);

    //update the transaction.
    if(data.substr(10) === '253'){
        updateTransaction(t.transactionId,"APPROVED",data, t.storeIp);
    }
    else if(t.transactionStatus === "PENDING"){
        updateTransaction(t.transactionId,"PENDING",data, pCenter);
    }
    else{
        updateTransaction(t.transactionId,"APPROVED",data, t.storeIp);
    }
}



