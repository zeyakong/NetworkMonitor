package com.ssm.services.Impl;

import com.ssm.dao.ConnectionDao;
import com.ssm.dao.RelayStationDao;
import com.ssm.dao.StoreDao;
import com.ssm.dto.Network;
import com.ssm.entity.Connection;
import com.ssm.entity.RelayStation;
import com.ssm.entity.Store;
import com.ssm.services.NetworkServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2018/2/15 17:36.
 */
@Service
public class NetworkServicesImpl implements NetworkServices {
    @Autowired
    private ConnectionDao connectionDao;
    @Autowired
    private StoreDao storeDao;
    @Autowired
    private RelayStationDao relayStationDao;

    public Network getNetwork() {
        Network network = new Network();
        network.setConnections(connectionDao.findAllConnections());
        network.setStores(storeDao.findAllStores());
        network.setRelayStations(relayStationDao.findAllRelayStations());
        return network;
    }

//    public String generateDOT(Network network) {
//        if(network==null)return "error";
//
//        List<Connection> connections = network.getConnections();
//        List<RelayStation> relayStations = network.getRelayStations();
//        List<Store> stores = network.getStores();
//        String start, end;
//
//        String result = "graph {";
//        for(int i = 0;i<connections.size();i++){
//            Connection c = connections.get(i);
//            result += c.getStartIp().substring(10) + " -- " +c.getEndIp().substring(10)+";";
//        }
//        result = result + "}";
//
//        return result;
//    }

    public String generateDOT(Network network) {
        if(network == null)
            return "error";

        final String pCenter = "253";

        List<Connection> connections = network.getConnections();
        List<RelayStation> relayStations = network.getRelayStations();
        List<Store> stores = network.getStores();
        String startIp, endIp;

        //Initiate graph
        String result = "graph { ";
        result += "node[style=filled]";

        //Add connection info
        for( int i = 0; i < connections.size(); i++ ) {
            Connection c = connections.get(i);
            startIp = c.getStartIp().substring(10);
            endIp = c.getEndIp().substring(10);

            //Check for processing center and label
            if( startIp.equals(pCenter) )
                startIp = "\"Processing Center\"";

            if( endIp.equals(pCenter) )
                endIp = "\"Processing Center\"";

            result += startIp + " -- " + endIp + "[ label=" + c.getWeight() + " ];";
        }

        //Add node beautification
        for( int i = 0; i < stores.size(); i++ ) {
            Store s = stores.get(i);
            startIp = s.getStoreIp().substring(10);

//            result += startIp + " [color = \"0.355 0.563 1.000\"];";
            result += startIp+" ";
        }

        for( int i = 0; i < relayStations.size(); i++ ) {
            RelayStation rs = relayStations.get(i);
            startIp = rs.getStationIp().substring(10);

            if( startIp.equals(pCenter) ) {
                startIp = "\"Processing Center\"";
//                result += startIp + " [color = \"0.201 0.753 1.000\" shape=square];";
                result += startIp + " [shape=square];";
            }
            else
//                result += startIp + " [color = \"0.578 0.289 1.000\" shape=diamond];";
                result += startIp + " [shape=diamond];";
        }

//        //Add key
//        result += "Store [color = \"0.355 0.563 1.000\"];";
//        result += "Relay [color = \"0.578 0.289 1.000\" shape=diamond];";

        result = result + "}";
        return result;
    }

    public List<String> getBFSPath(String startIp,String destinationIp){
        return null;
    }
}
