package vn.edu.fpt.quickhire.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeAdminController {
    @GetMapping("")
    public String Index(){
        return "admin/index";
    }

}