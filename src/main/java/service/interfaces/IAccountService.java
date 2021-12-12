package service.interfaces;

import domain.AccountDTO;

import java.util.List;


public interface IAccountService {
    //    @Select(value = "select * from account where cash_point = #{cash_point}")
    AccountDTO getAccount(String email);

    int isLogin(String email, String password);
}
