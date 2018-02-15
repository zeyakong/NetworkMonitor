package com.ssm.dao;

import com.ssm.entity.Connection;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2018/2/15 17:13.
 */
public interface ConnectionDao {
    List<Connection> findAllConnections();
}
