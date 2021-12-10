package service;

import domain.StockDTO;
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
    public List<StockDTO> getStockList(String sortType) {
        return stockMapper.getStockList(sortType);
    }

    @Override
    public List<StockDTO> getStockToAPI(String name, String date) {
        try {
            Stock stock = YahooFinance.get("INTC");

            BigDecimal price = stock.getQuote().getPrice();
            BigDecimal change = stock.getQuote().getChangeInPercent();
            BigDecimal peg = stock.getStats().getPeg();
            BigDecimal dividend = stock.getDividend().getAnnualYieldPercent();

            stock.print();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
