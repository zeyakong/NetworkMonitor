package com.ssm.dao;

import com.ssm.entity.RelayStation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2018/2/15 17:14.
 */
public interface RelayStationDao {
    List<RelayStation> findAllRelayStations();
    void createRelayStation(@Param("station_ip")String station_ip,
                            @Param("station_type") int station_type,
                            @Param("region")int region,
                            @Param("limit") int limit);
    void updateRelayStationLimit(@Param("station_ip")String station_ip,
                                 @Param("limit") int limit);
    void updateRelayStationActive(@Param("station_ip")String station_ip);

    RelayStation findRelayStationByIp(@Param("ip")String ip);

    void updateTransactionCount(@Param("station_ip")String station_ip,@Param("count")int count);
}
