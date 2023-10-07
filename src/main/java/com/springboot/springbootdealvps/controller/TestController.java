package com.springboot.springbootdealvps.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.springboot.springbootdealvps.entity.User;
import com.springboot.springbootdealvps.service.Service;

@Controller
public class TestController {

	
	@RequestMapping("/")
	private String home() {
		return "home";
	}
	
	
	@PostMapping("/submit")
	public String submit(@RequestParam("id") int id,@RequestParam("name") String name,@RequestParam("desciption") String desciption) {
		
		User user = new User();
		user.setId(id);
		user.setName(name);
		user.setDescription(desciption);
		
		Service service = new Service(id,name,desciption);
		
		/* ArrayList<User> list = service.display(); */
		ArrayList<User> list  = service.display(); 
		
		
		return "home";
		
	}
	
	
	/*
	 * @PostMapping("/submitid") public String submitid(@RequestParam("id") String
	 * id) {
	 * 
	 * 
	 * Service.submitId(Integer.parseInt(id));
	 * 
	 * 
	 * 
	 * return "home"; }
	 */
	
	@PostMapping("/submitid")
    public String submitId(@RequestParam("ids") String id,Model model) {
       
       User u1 = Service.submitId(Integer.parseInt(id));
       
       if(u1 != null) {
        model.addAttribute("user",u1);
        return "read"; 
        
    }else {
    	model.addAttribute("message","User Not Found");
    	return "read";
    }
      
}
}
