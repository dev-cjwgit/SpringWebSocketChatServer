package repository;

import domain.StockDTO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StockMapper {

    List<StockDTO> getStockList(@Param("name") String name, @Param("sortType") String sortType);
    //TODO: 추가
}
