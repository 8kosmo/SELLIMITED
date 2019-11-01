package com.sellfeed.auction;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sellfeed.account.AccountDao;
import com.sellfeed.aucLog.AucLogDao;
import com.sellfeed.product.ProductDao;

@Service
public class AuctionLogic {
	Logger logger = LoggerFactory.getLogger(AuctionLogic.class);
	@Autowired
	private AuctionDao auctionDao = null;
	@Autowired
	private AucLogDao aucLogDao = null;
	@Autowired
	private ProductDao productDao = null;
	@Autowired
	private AccountDao accountDao = null;
	public List<Map<String, Object>> beforeAuctionList() {
		List<Map<String,Object>> rList = new ArrayList<>();
		rList = auctionDao.beforeAuctionList();
		return rList;
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor= {DataAccessException.class})
	@Pointcut(value="excution(* com.sellfeed.auction.*Logic.*(..)")
	public void auctionIns(Map<String, Object> pMap) {
		logger.info("auctionLogic auctionIns호출 성공");
		int step1, step2 =0; 
		try {
			step1=auctionDao.auctionIns(pMap);
			step2=auctionDao.statusAuction(pMap);
		} catch (DataAccessException e) {
			throw e;
		}
	}
	public List<Map<String, Object>> endAuctionList() {
		List<Map<String,Object>> rList = new ArrayList<>();
		rList = auctionDao.endAuctionList();
		return rList;
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor= {DataAccessException.class})
	   @Pointcut(value="excution(* com.sellfeed.auction.*Logic.*(..)")
	   public int endAuction(Map<String,Object> pMap) {
	      logger.info("Logic| endAuctino 호출 성공");
	      List<Map<String,Object>> looserList = new ArrayList<>();
	      int result = 0;
	      try {
	         //입찰 패찰 UPDATE
	         aucLogDao.aucWinner(pMap);
	         //루저 리스트
	         looserList = aucLogDao.LooserList(pMap);
	         if(looserList.size()!=0 && looserList!=null) {
	            logger.info("패찰자 보증금 반환");
	            //패찰자 보증금봔환
	            accountDao.returnDeposit(looserList);
	         }
	         //경매진행중=> 배송준비중
	         productDao.auct_end(pMap);
	         result = 1;
	         
	      } catch (Exception e) {
	         result = 0;
	         throw e;
	      }
	      logger.info("AuctinoLogic endAuction 끝 | result= "+result);
	      return result;            
	   }
	public void buyNow(Map<String, Object> pMap) {
		logger.info("Logic | buyNow 호출 성공");
			aucLogDao.aucLogBuyNowIns(pMap);		//BID_LOG에 즉시구매 INSERT | BID_LOG에 낙찰 패찰 UPDATE | AUCT_PROGRESS에 경매종료일 UPDATE
	}
}
