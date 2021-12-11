package controller;

import domain.StockDTO;
import domain.param.StockRequestModel;
import io.swagger.annotations.ApiOperation;
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
    @ApiOperation(value = "주식 정보", notes = "주식 정보를 가져옵니다.")
    public List<StockDTO> stock(@ModelAttribute StockRequestModel model) {
        return stockService.getStockList(model);
    }
}
