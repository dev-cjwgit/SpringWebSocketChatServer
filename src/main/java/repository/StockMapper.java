package repository;

import domain.StockDTO;
import domain.param.StockRequestModel;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StockMapper {

    List<StockDTO> getStockList(@Param("model") StockRequestModel model);
    //TODO: 추가
}
