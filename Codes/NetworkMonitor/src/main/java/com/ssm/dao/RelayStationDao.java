package com.ssm.dao;

import com.ssm.entity.RelayStation;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2018/2/15 17:14.
 */
public interface RelayStationDao {
    List<RelayStation> findAllRelayStations();
}
