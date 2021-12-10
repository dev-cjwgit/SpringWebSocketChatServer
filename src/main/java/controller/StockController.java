package controller;

import domain.StockDTO;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.interfaces.IStockService;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.List;

@Controller // TODO: Controller Setting
public class StockController {
    @Autowired
    private IStockService stockService;

    @ResponseBody
    @RequestMapping(value = "/stock", method = RequestMethod.GET)
    public List<StockDTO> stock(@RequestParam("sortType") String sortType) {
        return stockService.getStockList(sortType);
    }

    @ResponseBody
    @RequestMapping(value = "/stocktestpage", method = RequestMethod.GET)
    public List<StockDTO> getStockToAPI(@RequestParam("name") String name, @RequestParam(value = "date", required = false) String date) {
        return stockService.getStockToAPI(name, date);
    }


}
