package service;

import domain.StockDTO;
import domain.param.StockRequestModel;
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
    public List<StockDTO> getStockList(StockRequestModel model) {
        return stockMapper.getStockList(model);
    }

}
