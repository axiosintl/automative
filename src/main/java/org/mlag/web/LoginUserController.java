package org.mlag.web;
import org.mlag.model.LoginUser;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/loginusers")
@Controller
@RooWebScaffold(path = "loginusers", formBackingObject = LoginUser.class)
public class LoginUserController {
}
