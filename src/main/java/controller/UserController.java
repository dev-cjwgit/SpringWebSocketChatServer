package controller;

import domain.AccountDTO;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.interfaces.IAccountService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller // TODO: Controller Setting
public class UserController {
    @Autowired
    private IAccountService userService;
    // TODO: Resouces, Inject, Autowired, Quilfyer - 차이점 확인 후 사용


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    @ApiOperation(value = "유저 페이지", notes = "유저를 입력할 수 있는 페이지로 이동합니다.")
    public String loginPage() {
        return "login";
    }

    @RequestMapping(value = "/index", method = RequestMethod.POST)
    @ApiOperation(value = "유저 페이지", notes = "유저를 받을 수 있는 페이지로 이동합니다.")
    public ModelAndView goStudent(HttpServletRequest httpServletRequest) {
        String userID = httpServletRequest.getParameter("userID");
        String userPW = httpServletRequest.getParameter("userPW");
        ModelAndView mav = new ModelAndView();
        mav.setViewName("index");
        mav.addObject("userID", userID);
        mav.addObject("userPW", userPW);
        return mav;
    }

    @ResponseBody
    @ApiOperation(value = "유저 페이지", notes = "유저의 정보를 가져옵니다.")
    @RequestMapping(value = "/user/info", method = RequestMethod.GET)
    public List<AccountDTO> getAccountList() {
        return userService.getAccountList();
    }
}
