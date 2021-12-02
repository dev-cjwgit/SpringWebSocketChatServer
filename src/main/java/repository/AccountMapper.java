package repository;

import domain.AccountDTO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AccountMapper {
    List<AccountDTO> mybatisTest(Long cash_point);
    //TODO: 추가
}
