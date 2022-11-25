package com.yang.service.impl;

import com.yang.dao.MerchantDao;
import com.yang.domain.Merchant;
import com.yang.service.IMerchantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("merchantService")
public class MerchantService implements IMerchantService{

	@Qualifier("merchantDao")
	@Autowired
	private MerchantDao merchantDao;
	
	@Override
	public Merchant findUserByMerchantName(String username) throws Exception {
		// TODO Auto-generated method stub
		return merchantDao.findUserByMerchantName(username);
	}

	@Override
	public void addMerchant(Merchant merchant) throws Exception {
		// TODO Auto-generated method stub
		merchantDao.addMerchant(merchant);
	}

}
