package repository;

import domain.StockDTO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StockMapper {

    List<StockDTO> getStockList(@Param("sortType")String sortType);
    //TODO: 추가
}
