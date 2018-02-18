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
    private List<Connection> connections;
    private List<RelayStation> relayStations;
    private List<Store> stores;

    public List<Connection> getConnections() {
        return connections;
    }

    public void setConnections(List<Connection> connections) {
        this.connections = connections;
    }

    public List<RelayStation> getRelayStations() {
        return relayStations;
    }

    public void setRelayStations(List<RelayStation> relayStations) {
        this.relayStations = relayStations;
    }

    public List<Store> getStores() {
        return stores;
    }

    public void setStores(List<Store> stores) {
        this.stores = stores;
    }

    @Override
    public String toString() {
        return "Network{" +
                "connections=" + connections +
                ", relayStations=" + relayStations +
                ", stores=" + stores +
                '}';
    }
}
