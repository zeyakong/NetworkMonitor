var networkInfo;

$(document).ready(function () {
    <!--ajax function to get the information-->
    $.ajax({
        url: '/getNetworkInfo',
        method: 'GET',
        success: function (network) {
            networkInfo = network;
        }
    });
});

var parsedData = vis.network.convertDot(networkDOT);
console.log(parsedData);

var data = {
    nodes: parsedData.nodes,
    edges: parsedData.edges
};

var container = document.getElementById('networkView');

var options = parsedData.options;

//retrieve the border color, options cant change it because of low priority.
for(var i = 0 ; i<data.nodes.length; i++){
    if(data.nodes[i].hasOwnProperty('color'))
    {
        data.nodes[i].color.border='#2B7CE9';
    }
}

// you can extend the options like a normal JSON variable:
// options.layout = {
//     hierarchical: {
//         enabled:true
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

