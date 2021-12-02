package service;

import domain.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IUserService {
//    @Select(value = "select * from account where cash_point = #{cash_point}")
    List<User> mybatisTest(Long cash_point);
    //TODO: 추가
}
