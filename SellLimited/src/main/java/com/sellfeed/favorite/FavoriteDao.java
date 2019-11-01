package com.sellfeed.favorite;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class FavoriteDao {
   Logger logger = LoggerFactory.getLogger(FavoriteDao.class);
   List<Map<String,Object>> favList = null;
   int Ok = 0;
   @Autowired
   public SqlSessionTemplate sqlSessionTemplate = null;
   public List<Map<String, Object>> favSellerList(Map<String,Object> pMap) {
      logger.info("Dao| favSellerList 호출성공");
      favList = sqlSessionTemplate.selectList("favSellerList",pMap);
      return favList;
   }
   public void favSellerDel(Map<String, Object> pMap) {
      logger.info("Dao| favSellerDel 호출성공");
      sqlSessionTemplate.delete("favSellerDel",pMap);
   }
   public List<Map<String, Object>> favProductList(String mem_id) {
      logger.info("Dao| favProductList 호출성공");
      favList = sqlSessionTemplate.selectList("favProductList",mem_id);
      return favList;
   }
   public int favProductDel(Map<String, Object> pMap) {
      logger.info("Dao| favProductDel 호출성공");
      Ok = sqlSessionTemplate.delete("favProductDel",pMap);
      return Ok;
   }
   public int favSellerAdd(Map pMap) {
      logger.info("Dao| favSellerAdd 호출성공");
      Ok = sqlSessionTemplate.update("favSellerIns",pMap);
      return Ok;
   }
   public int favProdAdd(Map pMap) {
      logger.info("Dao| favProdAdd 호출성공");
      Ok = sqlSessionTemplate.update("favProductIns",pMap);
      return Ok;
   }
   public int favSellerCheck(Map pMap) {
      logger.info("pMap체크 : "+pMap);
      Ok = sqlSessionTemplate.selectOne("favSellerCheck",pMap);
      return Ok;
   }
   public int favProductCheck(Map pMap) {
      Ok = sqlSessionTemplate.selectOne("favProductCheck",pMap);
      return Ok;
   }
   public int getFavSellerList(Map<String, Object> pMap) {
      int total = 0;
      total = sqlSessionTemplate.selectOne("getFavSellerList",pMap);
      return total;
   }
}