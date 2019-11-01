package com.sellfeed.aucLog;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AucLogDao {
	Logger logger = LoggerFactory.getLogger(AucLogDao.class);
	@Autowired
	public SqlSessionTemplate sqlSessionTemplate = null;
	public List<Map<String, Object>> aucLogList(Map<String, Object> pMap) {
		logger.info("Dao| aucLogList 호출성공");
		List<Map<String, Object>> aucList = null;
		aucList = sqlSessionTemplate.selectList("aucLogList",pMap);
		return aucList;
	}
	public int aucLogFirstIns(Map<String, Object> pMap) {
		logger.info("Dao| aucLogFristIns 호출성공");
		int result = 0;
		result = sqlSessionTemplate.update("aucLogFirstIns",pMap);
		return result;
	}
	public int aucLogIns(Map<String, Object> pMap) {
		logger.info("Dao| aucLogIns 호출성공");
		int result = 0;
		result = sqlSessionTemplate.update("aucLogIns",pMap);
		return result;
	}
	
	public int aucLogBuyNowIns(Map<String, Object> pMap) {
		logger.info("Dao| aucLogIns2 호출성공");
		int result = 0;
		result = sqlSessionTemplate.update("aucLogBuyNowIns",pMap);
		return result;
		
	}
	public void aucWinner(Map<String, Object> pMap) {
		logger.info("aucWinner 호출 성공 | pMap :"+pMap);
		sqlSessionTemplate.selectOne("aucWinner", pMap);
	}
	public List<Map<String, Object>> LooserList(Map<String, Object> pMap) {
		List<Map<String, Object>> looserList = new ArrayList<>();
		looserList = sqlSessionTemplate.selectList("looserList",pMap);
		logger.info("looserList : "+looserList);
		return looserList;
	}
	public int myBid(Map<String, Object> pMap) {
		int my_bid = 0;
		my_bid =sqlSessionTemplate.selectOne("myBid",pMap);
		return my_bid;
	}

}
