package service.interfaces;

import domain.StockDTO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IStockService {

    List<StockDTO> getStockList(@Param("sortType")String sortType);
}
