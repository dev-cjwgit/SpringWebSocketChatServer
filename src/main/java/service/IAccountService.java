package service;

import domain.AccountDTO;

import java.util.List;

public interface IAccountService {
//    @Select(value = "select * from account where cash_point = #{cash_point}")
    List<AccountDTO> mybatisTest(Long point);

    List<AccountDTO> getAccountList();
}
