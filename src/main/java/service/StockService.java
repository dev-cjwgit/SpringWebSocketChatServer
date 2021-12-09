package service;

import domain.StockDTO;
import org.apache.ibatis.annotations.Param;
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
    public List<StockDTO> getStockList(@Param("sortType") String sortType) {
        return stockMapper.getStockList(sortType);
    }
}
