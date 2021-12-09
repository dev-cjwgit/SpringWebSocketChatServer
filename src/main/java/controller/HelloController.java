package controller;

import domain.AccountDTO;
import domain.StockDTO;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.interfaces.IAccountService;
import service.interfaces.IStockService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller // TODO: Controller Setting
public class HelloController {
    @Autowired
    private IAccountService userService;
    // TODO: Resouces, Inject, Autowired, Quilfyer - 차이점 확인 후 사용
    @Autowired
    private IStockService stockService;

    @RequestMapping(value = "/user1", method = RequestMethod.GET)
    public String goUser1() {
        return "user1";
    }

    @RequestMapping(value = "/user2", method = RequestMethod.POST)
    public ModelAndView goStudent(HttpServletRequest httpServletRequest) {
        System.out.println("RequestMethod.POST");
        String id = httpServletRequest.getParameter("id");
        System.out.println("id : " + id);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("user2");
        mav.addObject("userId", id);
        return mav;
    }

    // find views/{%return}.jsp
    @RequestMapping(value = "/hello1", method = RequestMethod.GET)
    public String hello1() {
        return "hello";
    }

/*
    @ResponseBody
    @RequestMapping(value = "/hello2", method = RequestMethod.GET)
    public String hello2() {
        return "Hello Spring World Copy";
    }*/

    @ResponseBody
    @RequestMapping(value = "/stock", method = RequestMethod.GET)
    public List<StockDTO> stock(@Param("sortType") String sortType) {
        return stockService.getStockList(sortType);
    }

    @ResponseBody
    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public List<AccountDTO> mybatisTest(Long point) {
        return userService.mybatisTest(point);
    }

    @ResponseBody
    @RequestMapping(value = "/userinfo", method = RequestMethod.GET)
    public List<AccountDTO> getAccountList() {
        return userService.getAccountList();
    }


}
