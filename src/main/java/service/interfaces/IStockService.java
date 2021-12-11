package service.interfaces;

import domain.StockDTO;
import domain.param.StockRequestDTO;

import java.util.List;

public interface IStockService {

    List<StockDTO> getStockList(StockRequestDTO model);

}
