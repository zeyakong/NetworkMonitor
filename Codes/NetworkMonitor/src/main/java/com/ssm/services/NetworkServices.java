package com.ssm.services;

import com.ssm.dto.Network;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2018/2/15 17:35.
 */
public interface NetworkServices {
    Network getNetwork();
    String generateDOT(Network network);
    List<String> getBFSPath(String startIp,String destinationIp);
    String getPath(String startIp);
    void changeConnectionStatusById(int id);
    void changeStationStatusByIp(String ip);
    void updateTransaction();
    void createTransaction();
}
