package com.sellfeed.auction;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuctionDao {
	Logger logger = LoggerFactory.getLogger(AuctionDao.class);
	@Autowired
	public SqlSessionTemplate sqlSessionTemplate = null;
	public List<Map<String, Object>> beforeAuctionList() {
		List<Map<String,Object>> rList = new ArrayList<>();
		rList = sqlSessionTemplate.selectList("beforeAuctionList");
		return rList;
	}
	public int auctionIns(Map<String, Object> pMap) {
		int result=sqlSessionTemplate.update("auctionIns",pMap);
		return result;
	}
	public int statusAuction(Map<String,Object> pMap) {
		int result=sqlSessionTemplate.update("statusAuction",pMap);
		return result;
	}
	public List<Map<String, Object>> endAuctionList() {
		List<Map<String,Object>> rList = new ArrayList<>();
		rList = sqlSessionTemplate.selectList("endAuctionList");
		return rList;
	}
}
