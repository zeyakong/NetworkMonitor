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
    private String getPreSetColor(int i) {
        String hGrey = "#CCCCCC";
        String hBlue = "#0000FF";
        String hCyan = "#00FFFF";
        String hLGreen = "#99CC33";
        String hDGreen = "#006600";
        String hYellow = "#FFFF00";
        String hOrange = "#FF9900";
        String hPink = "#FF66CC";

        i = i % 7;
        switch (i) {
            case 0:
                return hGrey;
            case 1:
                return hCyan;
            case 2:
                return hLGreen;
            case 3:
                return hYellow;
            case 4:
                return hPink;
            case 5:
                return hOrange;
            case 6:
                return hDGreen;
            case 7:
                return hBlue;
            default:
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
        for (int i = 0; i < 8; i++) {
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

            result += startIp + " -- " + endIp + "[ id=" + c.getConnectionId() + ",label=\"" + c.getWeight() + "\",color=\"#2B7CE9\"];";
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
    public String getNextIp(String startIp, String destination) {
//        if(isReachable(startIp,destination)){
//            return destination;
//        }
//        if(startIp.equals("192.168.0.253")){
//            List<String> path = new ArrayList<String>();
//            String s = destination;
//            String d = startIp;
//            while(!s.equals("192.168.0.253")){
//                String n = getNextIp(s,d);
//                path.add(n);
//                s= n;
//            }
//            return path.get(path.size()-2);
//        }
//
//        List<String> policy = new ArrayList<String>();
//        policy.add("192.168.0.209 192.168.0.203");
//        policy.add("192.168.0.203 192.168.0.253");
//        policy.add("192.168.0.208 192.168.0.203");
//        policy.add("192.168.0.221 192.168.0.231");
//        policy.add("192.168.0.231 192.168.0.212");
//        policy.add("192.168.0.231 192.168.0.253");
//        policy.add("192.168.0.244 192.168.0.253");
//        policy.add("192.168.0.248 192.168.0.244");
//        policy.add("192.168.0.237 192.168.0.253");
//        policy.add("192.168.0.239 192.168.0.237");
//
//        List<Connection> list = connectionDao.findAllConnections();
//        List<String> next = new ArrayList<String>();
//        if(startIp.equals(destination)){
//            return startIp;
//        }
//        for(int i= 0 ; i<list.size(); i++){
//            Connection c = list.get(i);
//            if(c.getIsActive()==1){
//                if(startIp.equals(c.getStartIp()) && Integer.parseInt(c.getEndIp().substring(10))>200 ){
//                    next.add(c.getEndIp());
//                }else if(startIp.equals(c.getEndIp())&Integer.parseInt(c.getStartIp().substring(10))>200){
//                    next.add(c.getStartIp());
//                }
//            }
//        }
//
//        if(Integer.parseInt(startIp.substring(10))<200&&next!=null){
//            return next.get(next.size()-1);
//        }
//
//        //get good next ip
//        if(destination.equals("192.168.0.253")){
//            for(int i = 0 ;i<policy.size(); i++){
//                String[] p = policy.get(i).split(" ");
//                if(p[0].equals(startIp)&&next.contains(p[1])){
//                    return p[1];
//                }
//            }
//        }else{
//            for(int i = 0 ;i<policy.size(); i++){
//                String[] p = policy.get(i).split(" ");
//                if(p[1].equals(startIp)&&next.contains(p[0])){
//                    return p[0];
//                }
//            }
//        }
        //get the path list
        List<String> path = findShortestPath(startIp, destination);
        if (path == null) {
            return startIp;
        } else {
            String nextIp = path.get(1);
//            RelayStation nextStation = relayStationDao.findRelayStationByIp(nextIp);
//            if (nextStation != null) {
//
//                int count = nextStation.getTransactionCount();
//                relayStationDao.updateTransactionCount(nextIp, count + 1);
//            } else {
//                System.out.println("the nextStation is null!!!!!!!!!");
//            }
//
//            RelayStation old = relayStationDao.findRelayStationByIp(startIp);
//            if (old != null) {
//                System.out.println(old.toString());
//                int count = old.getTransactionCount();
//                relayStationDao.updateTransactionCount(startIp, count - 1);
//            } else {
//                System.out.println("the old is null!!!!!!!!!");
//            }

            return nextIp;
        }
    }

    public void changeConnectionStatusById(int id) {
        connectionDao.updateStatus(id);
    }

    public void changeStationStatusByIp(String ip) {
        relayStationDao.updateRelayStationActive(ip);
    }

    public void createTransaction(String transaction_type, double transaction_amount, String store_ip, String card_id, String current_position_ip, String current_destination_ip, String given_card_name, String given_card_date, String given_card_code) {
        transactionDao.createTransaction(transaction_type, transaction_amount, store_ip, card_id, current_position_ip, current_destination_ip, given_card_name, given_card_date, given_card_code);
    }

    public void updateTransaction(int transaction_id, String status, String current_position_ip, String current_destination_ip) {
        transactionDao.updateTransaction(transaction_id, status, current_position_ip, current_destination_ip);
    }

    public List<Transaction> findAllTransactions() {
        return transactionDao.findAllTransactions();
    }

    public void setTransactionStartTime(int id) {
        transactionDao.setTransactionProcessedTime(id);
    }

    public void createStore(String ip, String name, int region) {
        storeDao.createStore(ip, name, region);
    }

    public void createRelayStation(String ip, String status, int type, int region, int limit) {
        relayStationDao.createRelayStation(ip, type, region, limit);
    }

    public void createConnection(String start_ip, String end_ip, int is_active, int weight) {
        connectionDao.createConnection(start_ip, end_ip, is_active, weight);
    }

    public void updateRelayStationLimit(String ip, int limit) {
        relayStationDao.updateRelayStationLimit(ip, limit);
    }


    //path algorithm BFS
    private List<String> findShortestPath(String start, String destination) {
        //generate graph with ip;
        List<RelayStation> relayStations = relayStationDao.findAllRelayStations();

        //graph set{ip1,ip2....}
        Set<String> graph = new HashSet<String>();
        Queue<String> queue = new LinkedList<String>();
        List<String> marked = new ArrayList<String>();
        //Map <ip , parent>
        Map<String, String> path = new HashMap<String, String>();


        //add start and end node into graph.
        graph.add(start);
        graph.add(destination);

        //add all relay stations as nodes.
        for (int i = 0; i < relayStations.size(); i++) {
            RelayStation relayStation = relayStations.get(i);
            if (relayStation.getIsActive() == 1) {
                graph.add(relayStation.getStationIp());
            }
        }

        //now all the nodes belongs to the open set.

        System.out.println("===============\nFrom " + start + " to " + destination + ".\nPath finding start...\nThe graph contains:" + graph.toString());

        //add the start into queue.marked it reached.
        queue.add(start);
        marked.add(start);

        while (!queue.isEmpty()) {
            String top = queue.poll();//remove it
            marked.add(top);

            //find all adjacent nodes for the top node of the queue.
            for (Iterator i = graph.iterator(); i.hasNext(); ) {
                String temp = i.next() + "";
                if (!marked.contains(temp) && isReachable(top, temp)) {
                    //marked it and add it into queue
                    marked.add(temp);
                    queue.add(temp);
                    path.put(temp, top);
                }
            }
        }

        System.out.println(path.toString());

        String index = destination;
        String parent = "";
        List<String> finalPath = new ArrayList<String>();
        finalPath.add(destination);
        while (!parent.equals(start)) {
            if (path.containsKey(index)) {
                parent = path.get(index);
                finalPath.add(parent);
                index = parent;
            } else {
                //no path
                return null;
            }
        }

        Collections.reverse(finalPath);
        return finalPath;
    }

    private boolean isReachable(String start, String end) {
        if(isFull(end)){
            return false;
        }
        List<Connection> connections = connectionDao.findAllConnections();
        List<String> next = new ArrayList<String>();
        for (int i = 0; i < connections.size(); i++) {
            Connection c = connections.get(i);
            if (c.getIsActive() == 1) {
                if (end.equals(c.getStartIp())) {
                    next.add(c.getEndIp());
                } else if (end.equals(c.getEndIp())) {
                    next.add(c.getStartIp());
                }
            }
        }
        for (int i = 0; i < next.size(); i++) {
            if (next.get(i).equals(start)) {
                return true;
            }
        }
        return false;
    }

    /**
     * check if the station is full or not.
     *
     * @param ip the relay station ip
     * @return
     */
    public boolean isFull(String ip) {

        RelayStation r = relayStationDao.findRelayStationByIp(ip);
        if(r==null){
         return false;
        }
        int limit = r.getTransactionLimit();
        List<Transaction> transactions = transactionDao.findAllTransactions();
        for (int j = 0; j < transactions.size(); j++) {
            Transaction t = transactions.get(j);
            if (t.getCurrentPositionIp().equals(r.getStationIp())) {
                limit--;
                if (limit <= 0) {
                    return true;
                }
            }
        }
        return false;
//        RelayStation r = relayStationDao.findRelayStationByIp(ip);
//        int count = r.getTransactionCount();
//        int limit = r.getTransactionLimit();
//        if (count >= limit) {
//            return true;
//        } else {
//            return false;
//        }
    }

}
