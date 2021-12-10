package service.interfaces;

import domain.StockDTO;
import java.util.List;

public interface IStockService {

    List<StockDTO> getStockList(String sortType);

}
