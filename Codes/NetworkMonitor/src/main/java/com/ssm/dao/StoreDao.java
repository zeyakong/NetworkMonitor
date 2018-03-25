package com.ssm.dao;

import com.ssm.entity.Store;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2018/2/15 17:13.
 */
public interface StoreDao {
    List<Store> findAllStores();
    void createStore(@Param("store_ip") String store_ip,
                     @Param("name") String name,
                     @Param("region") int region);
}
