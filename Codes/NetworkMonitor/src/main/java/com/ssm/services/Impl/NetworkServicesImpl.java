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

    public String generateDOT(Network network) {
        if(network==null)return "error";

        List<Connection> connections = network.getConnections();
        List<RelayStation> relayStations = network.getRelayStations();
        List<Store> stores = network.getStores();
        String start, end;

        String result = "graph {";
        for(int i = 0;i<connections.size();i++){
            Connection c = connections.get(i);
            result += c.getStartIp().substring(10) + " -- " +c.getEndIp().substring(10)+";";
        }
        result = result + "}";

        return result;
    }
}
