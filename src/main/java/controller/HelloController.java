package controller;

import domain.AccountDTO;
import domain.StockDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.interfaces.IAccountService;
import service.interfaces.IStockService;

import java.util.List;

@Controller // TODO: Controller Setting
public class HelloController {
    @Autowired
    private IAccountService userService;
    // TODO: Resouces, Inject, Autowired, Quilfyer - 차이점 확인 후 사용
    @Autowired
    private IStockService stockService;


    /*// find views/{%return}.jsp
    @RequestMapping(value = "/hello1", method = RequestMethod.GET)
    public String hello1() {
        return "hello";
    }


    @ResponseBody
    @RequestMapping(value = "/hello2", method = RequestMethod.GET)
    public String hello2() {
        return "Hello Spring World Copy";
    }*/

    @ResponseBody
    @RequestMapping(value = "/stock", method = RequestMethod.GET)
    public List<StockDTO> stock() {
        return stockService.getStockList();
    }

    @ResponseBody
    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public List<AccountDTO> mybatisTest(Long point) {
        return userService.mybatisTest(point);
    }

    @ResponseBody
    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public List<AccountDTO> getAccountList() {
        return userService.getAccountList();
    }


}
