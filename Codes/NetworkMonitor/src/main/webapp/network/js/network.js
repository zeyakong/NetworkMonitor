
//##########################Class variables#########################
//object
var networkInfo;
//array
var transactions;

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
function getNextIp(ip,destination){
    $.ajax({
        url: '/getNextIp?ip='+ip+'&destination='+destination,
        method: 'GET',
        success: function (data) {
            //show the animation of transaction.
            //update the transaction.
            return data;
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
function createNewTransaction(sent,type,amount,start,card,currentIp,destination){
    $.ajax({
        url: '/createNewTransaction?transaction_date_sent='+sent+'&transaction_type='+type+'&transaction_amount='+amount+
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
    params.event = "[original event]";
    console.log(params);
    //IT IS AN EDGE OR NOTHING
    if (params.nodes[0] == undefined) {
        if (params.edges[0] == undefined) {
            //DID NOT CLICK ON ANYTHING USEFUL
        }
        //CLICKED ON AN EDGE
        else {
            var edgeId = params.edges[0];
            var ip1, ip2, weight;
            for (i = 0; i < parsedData.edges.length; i++) {
                if (edgeId == parsedData.edges[i].id) {
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
    else {
        var myNode = params.nodes[0];
        if (myNode == 'Processing Center') { //PROCESSING CENTER
            $('#relayIp').html('Processing Center');
            $('#relayModal').modal('show');
        }
        else if (myNode >= 200) {  //RELAY STATION
            var stationIp = '192.168.0.' + myNode;
            $('#relayIp').html(stationIp);
            $('#relayModal').modal('show');
        }
        else {                       //STORE
            var storeIp = '192.168.0.' + myNode;

            //TEST
            var clickedNode = nodes.get(myNode);
            clickedNode.color = {
                border : '#000000',
                background : '#000000'
            }
            nodes.update(clickedNode);
            //

            for (i = 0; i < networkInfo.stores.length; i++) {
                if (networkInfo.stores[i].storeIp == storeIp) {
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

    //Get current store ip
    var storeIp;
    for (i = 0; i < networkInfo.stores.length; i++) {
        if (networkInfo.stores[i].merchantName == $('#merchantName').html()) {
            storeIp = networkInfo.stores[i].storeIp;
        }
    }
    var myNode = storeIp.substring(10);
    var destinationIp = "192.168.0.253"; //THE PROCESSING CENTER
    var transaction = {
        currentIp: storeIp,
        destinationIp: destinationIp,
        cardName: cardName,
        cardNumber: cardNumber,
        securityCode: securityCode,
        date: date,
        transactionType: transactionType
    };
    //console.log(transaction);

    document.getElementById("form_one").reset();
    document.getElementById("form_two").reset();
    $('#transactionModal').modal('hide');
});

$('#btnCancel').click(function () {
    document.getElementById("form_one").reset();
    document.getElementById("form_two").reset();
});

