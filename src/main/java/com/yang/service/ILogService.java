package com.yang.service;

import com.yang.domain.SLog;

import java.util.List;


public interface ILogService {
	
	void save(SLog sLog) throws Exception;
	
	public List<SLog> findAllSysLog(Integer page,Integer size) throws Exception;
	
	public void deleteLogById(String id) throws Exception;
}
