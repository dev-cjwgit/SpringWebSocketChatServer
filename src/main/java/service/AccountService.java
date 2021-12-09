package service;

import domain.AccountDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.AccountMapper;

import java.util.List;

@Service
public class AccountService implements IAccountService {

    @Autowired // 의존성 주입
    private AccountMapper accountMapper;

    @Override
    public List<AccountDTO> mybatisTest(Long point) {
        return accountMapper.mybatisTest(point);
    }

    @Override
    public List<AccountDTO> getAccountList() {
        return accountMapper.getAccountList();
    }
    //TODO: 오버라이드 해서 추가
//    @Override
//    public String stockTest() {
//        return "Hello Stock World";
//    }
}
