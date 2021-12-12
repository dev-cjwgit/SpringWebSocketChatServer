package repository;

import domain.AccountDTO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AccountMapper {
    List<AccountDTO> mybatisTest(Long point);

    AccountDTO getAccount(@Param(value = "email") String email);

    int isLogin(@Param(value = "email") String email, @Param(value = "password") String password);
    //TODO: 추가
}
