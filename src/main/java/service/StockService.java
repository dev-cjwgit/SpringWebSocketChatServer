package service;

import domain.StockDTO;
import domain.param.StockRequestDTO;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import repository.StockMapper;
import service.interfaces.IStockService;
import yahoofinance.Stock;
import yahoofinance.YahooFinance;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

@Service
public class StockService implements IStockService {

    @Autowired
    private StockMapper stockMapper;

    @Override
    public List<StockDTO> getStockList(StockRequestDTO model) {
        return stockMapper.getStockList(model);
    }

}
