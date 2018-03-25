package com.ssm.dao;

import com.ssm.entity.Connection;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2018/2/15 17:13.
 */
public interface ConnectionDao {
    List<Connection> findAllConnections();
    void updateStatus(int id);
    void createConnection(@Param("start_ip")String start_ip,
                          @Param("end_ip") String end_ip,
                          @Param("is_active")int is_active,
                          @Param("weight")int weight);
}
