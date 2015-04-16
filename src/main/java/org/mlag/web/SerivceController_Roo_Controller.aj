// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.mlag.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.mlag.model.Service;
import org.mlag.web.SerivceController;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect SerivceController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String SerivceController.create(@Valid Service service, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, service);
            return "services/create";
        }
        uiModel.asMap().clear();
        service.persist();
        return "redirect:/services/" + encodeUrlPathSegment(service.getServiceid().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String SerivceController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Service());
        return "services/create";
    }
    
    @RequestMapping(value = "/{serviceid}", produces = "text/html")
    public String SerivceController.show(@PathVariable("serviceid") Long serviceid, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("service", Service.findService(serviceid));
        uiModel.addAttribute("itemId", serviceid);
        return "services/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String SerivceController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("services", Service.findServiceEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Service.countServices() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("services", Service.findAllServices(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "services/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String SerivceController.update(@Valid Service service, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, service);
            return "services/update";
        }
        uiModel.asMap().clear();
        service.merge();
        return "redirect:/services/" + encodeUrlPathSegment(service.getServiceid().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{serviceid}", params = "form", produces = "text/html")
    public String SerivceController.updateForm(@PathVariable("serviceid") Long serviceid, Model uiModel) {
        populateEditForm(uiModel, Service.findService(serviceid));
        return "services/update";
    }
    
    @RequestMapping(value = "/{serviceid}", method = RequestMethod.DELETE, produces = "text/html")
    public String SerivceController.delete(@PathVariable("serviceid") Long serviceid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Service service = Service.findService(serviceid);
        service.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/services";
    }
    
    void SerivceController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("service_createddate_date_format", "MM/dd/yyyy");
        uiModel.addAttribute("service_updateddate_date_format", "MM/dd/yyyy");
    }
    
    void SerivceController.populateEditForm(Model uiModel, Service service) {
        uiModel.addAttribute("service", service);
        addDateTimeFormatPatterns(uiModel);
    }
    
    String SerivceController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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