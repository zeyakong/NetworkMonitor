package com.ssm.dao;

import com.ssm.entity.Transaction;
import org.apache.ibatis.annotations.Param;

import java.sql.Date;
import java.util.List;

/**
 * Created by Zeya Kong
 * On 2018/2/15 17:14.
 */
public interface TransactionDao {
    List<Transaction> findAllTransactions();
    void createTransaction(@Param("transaction_type") String transaction_type,
                           @Param("transaction_amount") double transaction_amount,
                           @Param("store_ip") String store_ip,
                           @Param("card_id") String card_id,
                           @Param("current_position_ip") String current_position_ip,
                           @Param("current_destination_ip") String current_destination_ip);
    void updateTransaction(@Param("transaction_id") int transaction_id,
                           @Param("status") String transaction_status,
                           @Param("current_position") String current_position_ip,
                           @Param("current_destination") String current_destination_ip);
    void setTransactionProcessedTime(int transaction_id);

}
