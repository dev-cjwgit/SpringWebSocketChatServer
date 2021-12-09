package controller;

import domain.AccountDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.IAccountService;
import yahoofinance.Stock;
import yahoofinance.YahooFinance;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@Controller // TODO: Controller Setting
public class HelloController {
    @Autowired
    private IAccountService userService;

    // find views/{%return}.jsp
    @RequestMapping(value = "/hello1", method = RequestMethod.GET)
    public String hello1() {
        return "hello";
    }


    @ResponseBody
    @RequestMapping(value = "/hello2", method = RequestMethod.GET)
    public String hello2() {
        return "Hello Spring World Copy";
    }

    @ResponseBody
    @RequestMapping(value = "/stock", method = RequestMethod.GET)
    public String stock() {
        return userService.stockTest();
    }

    @ResponseBody
    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public List<AccountDTO> mybatisTest(Long cash_point) {
        return userService.mybatisTest(cash_point);
    }


}
