package com.ssm.services.Impl;

import com.ssm.dao.CreditCardDao;
import com.ssm.entity.CreditCard;
import com.ssm.services.CreditCardServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Zeya Kong
 * On 2018/2/6 0:36.
 */
@Service
public class CreditCardServicesImpl implements CreditCardServices {
    @Autowired
    private CreditCardDao creditCardDao;

    public List<CreditCard> findCreditCardsByAccountId(int id) {
        return creditCardDao.findCreditCardsByAccountId(id);
    }
}
