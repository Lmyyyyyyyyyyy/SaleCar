package com.yang.service;

import com.yang.domain.Merchant;

public interface IMerchantService {
	
	public Merchant findUserByMerchantName(String username) throws Exception;

	public void addMerchant(Merchant merchant) throws Exception;
}
