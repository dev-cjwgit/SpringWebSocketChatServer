package service.interfaces;

import domain.StockDTO;
import java.util.List;

public interface IStockService {
//    @Select(value = "select * from account where cash_point = #{cash_point}")
    List<StockDTO> getStockList();
}
