package service;

import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.UserMapper;

import java.util.List;

@Service
public class UserService implements IUserService {

    @Autowired // 의존성 주입
    private UserMapper userMapper;

    @Override
    public List<User> mybatisTest(Long cash_point) {
        return userMapper.mybatisTest(cash_point);
    }

    //TODO: 오버라이드 해서 추가
}
