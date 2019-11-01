package com.sellfeed.seed;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SeedLogic {
   Logger logger = LoggerFactory.getLogger(SeedLogic.class);
   
   @Autowired
   public SeedDao seedDao = null;
   
   public List<Map<String,Object>> seedList(Map<String, Object> pMap) {
      logger.info("============>seedList 호출 성공");
      List<Map<String,Object>> rList = null;
      rList = seedDao.seedList(pMap);
      return rList;
   }
   
   public int seedIns(Map<String, Object> pMap) {
         logger.info("============>seedIns 호출 성공");
         int result=0;
            result = seedDao.seedIns(pMap);
         return result;
      }
   
   public int seedOverlapCheck(Map<String, Object> pMap) {
         logger.info("============>seedOverlapCheck 호출 성공");
         int result=0;
         //이미 참여한 경우
         String bidders_id = seedDao.seedOverlapCheck(pMap).toString();
         if(pMap.get("bidders_id").equals(bidders_id)) {
            result=0;
         }else{
            result = 1;
         }
         return result;
      }
   
   public int bidWin(Map<String, Object> pMap) {
      logger.info("============>bidWin 호출 성공");
      int result=0;
      seedDao.bidLose(pMap);
      result = seedDao.bidWin(pMap);
      return result;
   }

   public List<Map<String,Object>> seedInsProduct(Map<String, Object> pMap) {
      logger.info("=============> seedInsProduct 호출 성공");
      List<Map<String,Object>> mySeedList = null;
      int nowPage = 0;
      int pageSize = 0;
      int start = 0;
      int end = 0;
      int total = seedDao.getSeedInsProdTotal(pMap);
      if(Integer.parseInt(pMap.get("nowPage").toString())>0) {
         nowPage = Integer.parseInt(pMap.get("nowPage").toString());
      }
      if(Integer.parseInt(pMap.get("pageSize").toString())>0) {
         pageSize = Integer.parseInt(pMap.get("pageSize").toString());
      }
      if(nowPage>0) {
         start = ((nowPage-1)*pageSize)+1;
         end = nowPage*pageSize;
         pMap.put("start", start);
         if(end>=total) {
            pMap.put("end", total);
         } else {
            pMap.put("end", end);
         }
      }
      mySeedList=seedDao.seedInsProduct(pMap);
      return mySeedList;
   }
}