package service;

import domain.StockDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.StockMapper;
import service.interfaces.IStockService;

import java.util.List;

@Service
public class StockService implements IStockService {

    @Autowired
    private StockMapper stockMapper;

    @Override
    public List<StockDTO> getStockList() {
        List<StockDTO> temp = stockMapper.getStockList();
        for (StockDTO item : temp) {
            System.out.println(item.getDate().toString().split(" ")[0]);
        }
        return stockMapper.getStockList();
    }
}
