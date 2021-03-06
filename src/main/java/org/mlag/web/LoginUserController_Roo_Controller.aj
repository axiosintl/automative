// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.mlag.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.mlag.model.LoginUser;
import org.mlag.web.LoginUserController;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect LoginUserController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String LoginUserController.create(@Valid LoginUser loginUser, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, loginUser);
            return "loginusers/create";
        }
        uiModel.asMap().clear();
        loginUser.persist();
        return "redirect:/loginusers/" + encodeUrlPathSegment(loginUser.getUserId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String LoginUserController.createForm(Model uiModel) {
        populateEditForm(uiModel, new LoginUser());
        return "loginusers/create";
    }
    
    @RequestMapping(value = "/{userId}", produces = "text/html")
    public String LoginUserController.show(@PathVariable("userId") Long userId, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("loginuser", LoginUser.findLoginUser(userId));
        uiModel.addAttribute("itemId", userId);
        return "loginusers/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String LoginUserController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("loginusers", LoginUser.findLoginUserEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) LoginUser.countLoginUsers() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("loginusers", LoginUser.findAllLoginUsers(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "loginusers/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String LoginUserController.update(@Valid LoginUser loginUser, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, loginUser);
            return "loginusers/update";
        }
        uiModel.asMap().clear();
        loginUser.merge();
        return "redirect:/loginusers/" + encodeUrlPathSegment(loginUser.getUserId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{userId}", params = "form", produces = "text/html")
    public String LoginUserController.updateForm(@PathVariable("userId") Long userId, Model uiModel) {
        populateEditForm(uiModel, LoginUser.findLoginUser(userId));
        return "loginusers/update";
    }
    
    @RequestMapping(value = "/{userId}", method = RequestMethod.DELETE, produces = "text/html")
    public String LoginUserController.delete(@PathVariable("userId") Long userId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        LoginUser loginUser = LoginUser.findLoginUser(userId);
        loginUser.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/loginusers";
    }
    
    void LoginUserController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("loginUser_dateofbirth_date_format", "MM/dd/yyyy");
    }
    
    void LoginUserController.populateEditForm(Model uiModel, LoginUser loginUser) {
        uiModel.addAttribute("loginUser", loginUser);
        addDateTimeFormatPatterns(uiModel);
    }
    
    String LoginUserController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
