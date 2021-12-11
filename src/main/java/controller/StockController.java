package controller;

import domain.StockDTO;
import domain.param.StockRequestModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import service.interfaces.IStockService;

import java.util.List;

@Controller // TODO: Controller Setting
public class StockController {
    @Autowired
    private IStockService stockService;

    @ResponseBody
    @RequestMapping(value = "/stock", method = RequestMethod.GET)
    public List<StockDTO> stock(@ModelAttribute StockRequestModel model) {
        System.out.println(model.toString());
        return stockService.getStockList(model);
    }
}
