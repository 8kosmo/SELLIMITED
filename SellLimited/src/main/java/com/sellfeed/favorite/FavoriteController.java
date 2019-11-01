package com.sellfeed.favorite;

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

import com.google.gson.Gson;


@Controller
@RequestMapping(value="/favorite")
public class FavoriteController {
   Logger logger = LoggerFactory.getLogger(FavoriteController.class);
   @Autowired
   public FavoriteLogic favoriteLogic = null;
   
   //관심 판매자 리스트
  @GetMapping("/favSellerList.sf")
  public String favSellerList(@RequestParam("mem_id") String mem_id,Model mod, Map<String,Object> pMap) {
     logger.info("Controller| favSellerList 호출성공");
     List<Map<String,Object>> favList = null;
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
     pMap.put("mem_id",mem_id);
     favList = favoriteLogic.favSellerList(pMap);
     String favInfo = null;
     Gson g = new Gson();
     favInfo = g.toJson(favList);
     logger.info("컨트롤러타니ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ"+favInfo);
     mod.addAttribute("favList",favList);
     return "forward:/testview/favSeller3.jsp";
  }
  //관심상품
  @GetMapping("/favProductList.sf")
  public String favProductList(@RequestParam (required=false) String mem_id) {
     logger.info("Controller| favProductList 호출성공");
     List<Map<String,Object>> favList = null;
     mem_id = "uh4ng";
     favList = favoriteLogic.favProductList(mem_id);
     logger.info(".."+favList);
     return "";
  }

   //관심 판매자 삭제
   @GetMapping("/favSellerDel.sf")
   public String favSellerDel(@RequestParam Map<String,Object> pMap) {
      String fav_sellerid = pMap.get("fav_sellerid").toString();
      String mem_id = pMap.get("mem_id").toString();
      pMap.put("fav_sellerid", fav_sellerid);
      pMap.put("mem_id", mem_id);
      favoriteLogic.favSellerDel(pMap);
      return "redirect:/favorite/favSellerList.sf?mem_id="+mem_id;
      
   }

}