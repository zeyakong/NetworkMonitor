package com.ssm.services.Impl;

import com.ssm.dao.CardAccountDao;
import com.ssm.entity.CardAccount;
import com.ssm.services.CardAccountServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2018/2/6 0:13.
 */
@Service
public class CardAccountServicesImpl implements CardAccountServices {
    @Autowired
    CardAccountDao cardAccountDao;
    public List<CardAccount> findAllCardAccounts() {
        return cardAccountDao.findAllCardAccounts();
    }

    public CardAccount findCardAccountById(int id) {
        return cardAccountDao.findCardAccountById(id);
    }
}
