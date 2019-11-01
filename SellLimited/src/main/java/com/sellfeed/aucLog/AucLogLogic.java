package com.sellfeed.aucLog;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AucLogLogic {
	Logger logger = LoggerFactory.getLogger(AucLogLogic.class);
	@Autowired
	public AucLogDao aucLogDao = null;
	
	public int aucLogIns(Map<String,Object> pMap) {
		logger.info("Logic| aucLogIns 호출성공 parameter: "+pMap);
		int result;
		logger.info("pMap : "+pMap);
		result = aucLogDao.aucLogIns(pMap);
		return result;
	}

	public int myBid(Map<String, Object> pMap) {
		int my_Bid = aucLogDao.myBid(pMap); 
		return my_Bid;
	}
}
