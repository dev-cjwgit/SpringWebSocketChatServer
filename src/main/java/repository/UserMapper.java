package repository;

import domain.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    List<User> mybatisTest(Long cash_point);
    //TODO: 추가
}
