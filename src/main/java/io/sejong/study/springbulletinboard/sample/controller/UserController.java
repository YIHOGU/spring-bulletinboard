package io.sejong.study.springbulletinboard.sample.controller;

import io.sejong.study.springbulletinboard.sample.entity.Sample;
import io.sejong.study.springbulletinboard.sample.entity.User;
import io.sejong.study.springbulletinboard.sample.http.req.SampleCreateRequest;
import io.sejong.study.springbulletinboard.sample.http.req.UserCreateRequest;
import io.sejong.study.springbulletinboard.sample.service.SampleService;
import io.sejong.study.springbulletinboard.sample.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    /** user 등록 http://localhost:8080/sign/sign-up */
    @RequestMapping("/sign/sign-up")
    public String goToSignUp(Model model) {

        return "sign-up";
    }
    @RequestMapping("/sign/sign-in")
    public String goToSignIn(Model model) {

        return "sign-in";
    }

    @RequestMapping("/sign/create")
    public String signUp(Model model, @ModelAttribute UserCreateRequest request) {
        User user = userService.createUser(request);
        model.addAttribute("uid",user.getUid());
//        model.addAttribute("name",user.getName());
//        model.addAttribute("userId",user.getUserId());
//        model.addAttribute("password",user.getPassword());
//        model.addAttribute("created_at",user.getCreated_at());
        return "redirect:/board/board-all";
    }

}
