package repository;

import domain.StockDTO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StockMapper {

    List<StockDTO> getStockList();
    //TODO: 추가
}
