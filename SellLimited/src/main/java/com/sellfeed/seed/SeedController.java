package com.sellfeed.seed;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/seed")
public class SeedController {
   
   Logger logger = LoggerFactory.getLogger(SeedController.class);
   
   @Autowired
   public SeedLogic seedLogic = null;
   
   @GetMapping(value="seedList.sf")
   public String seedList(@RequestParam Map<String,Object> pMap) {
      logger.info("============>seedList 호출 성공");
      List<Map<String,Object>> rList = null;
      rList =seedLogic.seedList(pMap);
      return "redirect:../index.jsp";
   }
   
   @GetMapping(value="seedInsProduct.sf")
   public String seedInsProduct(@RequestParam Map<String,Object> pMap,Model mod) {
      logger.info("========>seedInsProduct 호출성공");
      List<Map<String,Object>> mySeedList = null;
      int nowPage = 0;
      int pageSize = 0;
      if(pMap.get("nowPage")!=null) {
            nowPage = Integer.parseInt(pMap.get("nowPage").toString());
        }
        if(pMap.get("pageSize")!=null) {
           pageSize = Integer.parseInt(pMap.get("pageSize").toString());
        }
      pMap.put("nowPage",nowPage);
      pMap.put("pageSize",pageSize);
      mySeedList = seedLogic.seedInsProduct(pMap);
      mod.addAttribute("mySeedList",mySeedList);
      return "forward:/testview/seedInsProduct.jsp";
   }

   
}