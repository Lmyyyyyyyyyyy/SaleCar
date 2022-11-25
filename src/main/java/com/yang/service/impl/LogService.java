package com.yang.service.impl;

import com.github.pagehelper.PageHelper;
import com.yang.dao.LogDao;
import com.yang.domain.SLog;
import com.yang.service.ILogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("logService")
@Transactional
public class LogService implements ILogService {

	@Qualifier("logDao")
	@Autowired
	private LogDao logDao;
	
	@Override
	public List<SLog> findAllSysLog(Integer page,Integer size) throws Exception {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, size);
		return logDao.findAllSysLog();
	}

	@Override
	public void save(SLog sLog) throws Exception {
		// TODO Auto-generated method stub
		logDao.save(sLog);
	}

	@Override
	@Transactional
	public void deleteLogById(String id) throws Exception {
		// TODO Auto-generated method stub
		logDao.deleteLogById(id);
	}

}
