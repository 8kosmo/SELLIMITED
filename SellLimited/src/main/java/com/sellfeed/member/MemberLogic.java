package com.sellfeed.member;

import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.sellfeed.account.AccountDao;
import com.sellfeed.account.AccountLogic;

@Service
public class MemberLogic {
   Logger logger = LoggerFactory.getLogger(MemberLogic.class);
   @Autowired
   public MemberDao memberDao = null;
   @Autowired
   public AccountDao accountDao = null;
   

   public String idInspection(Map<String,Object> pMap) {
      String inspectedId="";
      inspectedId = memberDao.idInspection(pMap);
      logger.info("=================>inspectedId : "+inspectedId);
      return inspectedId;
      
   }
   @Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor= {DataAccessException.class})
   @Pointcut(value="execution(* com.sellfeed.member.*Logic.*(..)")
   public int memberIns(Map<String, Object> pMap)  {
      logger.info("=================>memberIns 호출 성공");
      int result=0;
      String acct_number = "";
      //트랜잭션처리
         try {
            result = memberDao.memberIns(pMap);
            acct_number = accountDao.getAcct_number();
           pMap.put("acct_number", acct_number);
           accountDao.accountMake(pMap);
         } 
         catch (DataAccessException e) {
            throw e;
         }
         return result;
   }
   
   @Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor= {DataAccessException.class})
   @Pointcut(value="execution(* com.sellfeed.member.*Logic.*(..)")
   public List<String> login(Map<String, Object> pMap) {
      logger.info("=================>login 호출 성공");
      String mem_name="";
      int acct_balance=0;
      String mem_id = "";
      String acct_number= "";
      List<String> list = new ArrayList<String>(); 
      try {
         mem_name = memberDao.login(pMap);
         logger.info(mem_name);
         mem_id = pMap.get("mem_id").toString();
         if(!"비밀번호를 잘못 입력하셨습니다.".equals(mem_name )&& !"아이디가 존재하지 않습니다.".equals(mem_name)) {
        	 acct_balance = accountDao.accountNowBalance(mem_id);
        	 acct_number = accountDao.acct_number(mem_id);
         }
         list.add(pMap.get("mem_name").toString());
         list.add(""+acct_balance);
         list.add(""+acct_number);
   } catch (DataAccessException e) {
        throw e;
     }
      return list;
   }

   public int memberUpd(Map<String, Object> pMap) {
      logger.info("=================>memberUpd 호출 성공");
      int result = 0;
      result = memberDao.memberUpd(pMap);
      return result;
   }

   public int memberDel(Map<String, Object> pMap) {
      logger.info("=================>memberDel 호출 성공");
      int result = 0;
      result = memberDao.memberDel(pMap);
      return result;
   }

   public Map<String, Object> memberList(Map<String, Object> pMap) {
      logger.info("=================>memberList 호출 성공");
      Map<String,Object> rMap = new HashMap<>();
      rMap = memberDao.memberList(pMap);
      return rMap;
      
   }


}