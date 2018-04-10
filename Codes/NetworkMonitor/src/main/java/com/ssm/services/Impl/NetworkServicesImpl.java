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

    /*
    @param i : the region 0-7
    @return the hex color of that region
     */
    private String getPreSetColor( int i ) {
        String hGrey = "#CCCCCC";
        String hBlue = "#0000FF";
        String hCyan = "#00FFFF";
        String hLGreen = "#99CC33";
        String hDGreen = "#006600";
        String hYellow = "#FFFF00";
        String hOrange = "#FF9900";
        String hPink = "#FF66CC";

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
    }

    public String generateDOT(Network network) {
        if (network == null)
            return "error";

        List<Connection> connections = network.getConnections();
        List<RelayStation> relayStations = network.getRelayStations();
        List<Store> stores = network.getStores();
        String startIp, endIp;


        Map<Integer, String> region = new HashMap();

        //generate random color for each region
//        for (int i = 0; i < relayStations.size(); i++) {
//            if (!region.containsKey(relayStations.get(i).getRegion())) {
//                region.put(relayStations.get(i).getRegion(), getRandomColor());
//            }
//        }

        //Generate Pre-Set Color For Each Region
        for( int i = 0; i < 8; i++ ) {
            region.put(i, getPreSetColor(i));
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

            result += startIp + " -- " + endIp + "[ id="+c.getConnectionId()+",label=\"" + c.getWeight() + "\",color=\"#2B7CE9\"];";
        }

        //Add node beautification
        //STORES
        for (int i = 0; i < stores.size(); i++) {
            Store s = stores.get(i);
            startIp = s.getStoreIp().substring(10);
//            result += startIp + " [color = \"0.355 0.563 1.000\"];";
            result += startIp + " [color=" + region.get(s.getRegion()) + "];";
        }

        //RELAY STATIONS
        for (int i = 0; i < relayStations.size(); i++) {
            RelayStation rs = relayStations.get(i);
            startIp = rs.getStationIp().substring(10);

            //gateway decoration
            if (rs.getStationType() == 1) {
                //result += startIp + " [color=green, shape=diamond];";
                result += startIp + " [color=" + region.get(rs.getRegion()) + ", shape=star];";
            } else if (startIp.equals(pCenter)) {
                startIp = "\"Processing Center\"";
                //result += startIp + " [color=grey, shape=square];";
                result += startIp + " [color=" + region.get(rs.getRegion()) + ", shape=square];";
            } else
                //result += startIp + " [color=yellow, shape=diamond];";
                result += startIp + " [color=" + region.get(rs.getRegion()) + ", shape=diamond];";
        }

        result = result + "}";
        return result;
    }

    //path algorithm
    public String getNextIp(String startIp,String destination) {

        List<Connection> list = connectionDao.findAllConnections();
        List<String> next = new ArrayList<String>();
        if(startIp.equals(destination)){
            return startIp;
        }
        for(int i= 0 ; i<list.size(); i++){
            Connection c = list.get(i);
            if(c.getIsActive()==1){
                if(startIp.equals(c.getStartIp()) && Integer.parseInt(c.getEndIp().substring(10))>200 ){
                    next.add(c.getEndIp());
                }else if(startIp.equals(c.getEndIp())&Integer.parseInt(c.getStartIp().substring(10))>200){
                    next.add(c.getStartIp());
                }
            }
        }

        //get good next ip
        Collections.shuffle(next);
        if(next!=null)return next.get(0);
        else return startIp;
    }

    public void changeConnectionStatusById(int id) {
        connectionDao.updateStatus(id);
    }

    public void changeStationStatusByIp(String ip) {
        relayStationDao.updateRelayStationActive(ip);
    }

    public void createTransaction(String transaction_type, double transaction_amount, String store_ip, String card_id, String current_position_ip, String current_destination_ip, String given_card_name, String given_card_date, String given_card_code) {
        transactionDao.createTransaction(transaction_type,transaction_amount,store_ip,card_id,current_position_ip,current_destination_ip, given_card_name, given_card_date, given_card_code);
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

    public void createStore(String ip, String name, int region) {
        storeDao.createStore(ip,name,region);
    }

    public void createRelayStation(String ip, String status, int type, int region,int limit) {
        relayStationDao.createRelayStation(ip,type,region,limit);
    }

    public void updateRelayStationLimit(String ip, int limit) {
        relayStationDao.updateRelayStationLimit(ip,limit);
    }


    //path algorithm
    private List<String> findShortestPath(String start , String destination){
        //generate graph with ip;
        List<RelayStation> relayStations = relayStationDao.findAllRelayStations();
        Set<String> graph = new HashSet<String>();
        Set<String> openSet = new HashSet<String>();
        Set<String> closeSet = new HashSet<String>();

        graph.add(start);
        graph.add(destination);

        for(int i = 0 ;i<relayStations.size() ; i++){
            RelayStation relayStation = relayStations.get(i);
            graph.add(relayStation.getStationIp());
        }

        openSet.addAll(graph);

        //add start into close set
        closeSet.add(start);

        //remove the node in openset
        openSet.remove(start);

        String startIndex =start;
        String endIndex;

        for(Iterator i =openSet.iterator();i.hasNext();) {//比较常规的for写法
            endIndex = i.next()+"";
            if(isNear(startIndex,endIndex)){

            }
            System.out.println(i.next());
        }
        return null;
    }

    private boolean isNear(String ip1, String ip2){
        List<Connection>connections = connectionDao.findAllConnections();
        List<String> next = new ArrayList<String>();
        for(int i = 0 ;i<connections.size() ;i++){
            Connection c = connections.get(i);
            if(c.getIsActive()==1){
                if(ip1.equals(c.getStartIp())&&c.getIsActive()==1){
                    next.add(c.getEndIp());
                }else if(ip1.equals(c.getEndIp())&&c.getIsActive()==1){
                    next.add(c.getStartIp());
                }
            }
        }
        for(int i = 0 ;i<next.size() ; i++){
            if(next.get(i).equals(ip2)){
                return true;
            }
        }
        return false;
    }
}
