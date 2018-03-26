package com.ssm.services.Impl;

import com.ssm.dao.ConnectionDao;
import com.ssm.dao.RelayStationDao;
import com.ssm.dao.StoreDao;
import com.ssm.dao.TransactionDao;
import com.ssm.dto.Network;
import com.ssm.entity.Connection;
import com.ssm.entity.RelayStation;
import com.ssm.entity.Store;
import com.ssm.entity.Transaction;
import com.ssm.services.NetworkServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.sql.Date;

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
    @Autowired
    private TransactionDao transactionDao;

    public Network getNetwork() {
        Network network = new Network();
        network.setConnections(connectionDao.findAllConnections());
        network.setStores(storeDao.findAllStores());
        network.setRelayStations(relayStationDao.findAllRelayStations());
        return network;
    }

    /**
     * @return the color string such as 000fff
     */
    private String getRandomColor() {
        String r, g, b;
        Random random = new Random();
        r = Integer.toHexString(random.nextInt(256)).toUpperCase();
        g = Integer.toHexString(random.nextInt(256)).toUpperCase();
        b = Integer.toHexString(random.nextInt(256)).toUpperCase();
        r = r.length() == 1 ? "0" + r : r;
        g = g.length() == 1 ? "0" + g : g;
        b = b.length() == 1 ? "0" + b : b;
        return "#" + r + g + b;
    }

    public String generateDOT(Network network) {
        if (network == null)
            return "error";

        List<Connection> connections = network.getConnections();
        List<RelayStation> relayStations = network.getRelayStations();
        List<Store> stores = network.getStores();
        String startIp, endIp;

        //generate the random color for each region
        Map<Integer, String> region = new HashMap();
        for (int i = 0; i < relayStations.size(); i++) {
            if (!region.containsKey(relayStations.get(i).getRegion())) {
                region.put(relayStations.get(i).getRegion(), getRandomColor());
            }
        }

        //find pCenter,default 256
        String pCenter = "256";
        for (int i = 0; i < relayStations.size(); i++) {
            if (relayStations.get(i).getStationType() == 2) pCenter = relayStations.get(i).getStationIp().substring(10);
        }
        //key
//        result += "Relay [color =yellow, shape=diamond,x=5,y=5];";
//        result += "Gateway [color =green, shape=diamond,x=10,y=10];";
//        result += "ProcessingCenter [color =grey, shape=square,margin=5];";
        //Initiate graph
        String result = "graph { ";
        //Add key
        result += "node[style=filled]";

        //Add connection info
        for (int i = 0; i < connections.size(); i++) {
            Connection c = connections.get(i);
            startIp = c.getStartIp().substring(10);
            endIp = c.getEndIp().substring(10);

            //Check for processing center and label
            if (startIp.equals(pCenter))
                startIp = "\"Processing Center\"";

            if (endIp.equals(pCenter))
                endIp = "\"Processing Center\"";

            result += startIp + " -- " + endIp + "[ label=\"" + c.getWeight() + "\"];";
        }

        //Add node beautification
        for (int i = 0; i < stores.size(); i++) {
            Store s = stores.get(i);
            startIp = s.getStoreIp().substring(10);
//            result += startIp + " [color = \"0.355 0.563 1.000\"];";
            result += startIp + " [color=" + region.get(s.getRegion()) + "];";
        }

        for (int i = 0; i < relayStations.size(); i++) {
            RelayStation rs = relayStations.get(i);
            startIp = rs.getStationIp().substring(10);

            //gateway decoration
            if (rs.getStationType() == 1) {
                result += startIp + " [color=green, shape=diamond];";
            } else if (startIp.equals(pCenter)) {
                startIp = "\"Processing Center\"";
                result += startIp + " [color=grey, shape=square];";
            } else
                result += startIp + " [color=yellow, shape=diamond];";
        }

        result = result + "}";
        return result;
    }

    //path algorithm
    public String getNextIp(String startIp,String destination) {
        List<Connection> list = connectionDao.findAllConnections();
        List<String> next = new ArrayList<String>();
        for(int i= 0 ; i<list.size(); i++){
            Connection c = list.get(i);
            if(startIp == c.getStartIp()){
                next.add(c.getEndIp());
            }
        }
        //get random
        Collections.shuffle(next);
        if(next!=null)return next.get(0);
        else return "error";
    }

    public void changeConnectionStatusById(int id) {
        connectionDao.updateStatus(id);
    }

    public void changeStationStatusByIp(String ip) {
        relayStationDao.updateRelayStationActive(ip);
    }

    public void createTransaction(Date transaction_date_sent, String transaction_type, double transaction_amount, String store_ip, String card_id, String current_position_ip, String current_destination_ip) {
        transactionDao.createTransaction(transaction_date_sent,transaction_type,transaction_amount,store_ip,card_id,current_position_ip,current_destination_ip);
    }

    public void updateTransaction(int transaction_id, String status, String current_position_ip, String current_destination_ip) {
        transactionDao.updateTransaction(transaction_id,status,current_position_ip,current_destination_ip);
    }

    public List<Transaction> findAllTransactions() {
        return transactionDao.findAllTransactions();
    }

    public void setTransactionStartTime(int id) {
        transactionDao.setTransactionProcessedTime(id);
    }
}
