package service;

import domain.AccountDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.AccountMapper;
import service.interfaces.IAccountService;

import java.util.List;

@Service
public class AccountService implements IAccountService {

    @Autowired // 의존성 주입
    private AccountMapper accountMapper;

    @Override
    public AccountDTO getAccount(String email) {
        return accountMapper.getAccount(email);
    }

    @Override
    public int isLogin(String email, String password) {
        return accountMapper.isLogin(email, password);
    }
    //TODO: 오버라이드 해서 추가
}
