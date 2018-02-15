package com.ssm.dto;

import com.ssm.dao.ConnectionDao;
import com.ssm.dao.RelayStationDao;
import com.ssm.dao.StoreDao;
import com.ssm.entity.Connection;
import com.ssm.entity.RelayStation;
import com.ssm.entity.Store;
import guru.nidi.graphviz.engine.Graphviz;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2018/2/15 17:16.
 */
public class Network {
    @Autowired
    private ConnectionDao connectionDao;
    @Autowired
    private RelayStationDao relayStationDao;
    @Autowired
    private StoreDao storeDao;

    public Network(){
        //generate the network.
        List<Connection> connections =  connectionDao.findAllConnections();
        List<RelayStation> relayStations =  relayStationDao.findAllRelayStations();
        List<Store> stores = storeDao.findAllStores();
    }
}
