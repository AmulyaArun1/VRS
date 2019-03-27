package com.cts.VehicleReservationSystem.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.cts.VehicleReservationSystem.bean.Vehicle;
import com.cts.VehicleReservationSystem.service.VehicleService;

@Controller
public class VehicleController {

	@Autowired
	VehicleService vehicleService;
	
	@RequestMapping(value="update.html")                //GetMapping(value="update.html", method= RequestMethod.GET) could also be done
	public ModelAndView getUpdatePage(){
		//System.out.println(vehicle);
		ModelAndView modelAndView = new ModelAndView();
		List<Vehicle> list = vehicleService.getallVehicle();
System.out.println(list);
		System.out.println("in v controller");
		System.out.println(vehicleService.getallVehicle());
		System.out.println("exiting v controller");

		System.out.println("update");
		modelAndView.addObject("vehicle", list);
		modelAndView.setViewName("update");
		return modelAndView;
	}
	@RequestMapping(value="addVehicles.html")                //GetMapping(value="login.html", method= RequestMethod.GET) could also be done
	public String getaddVehiclePage(){
		return "addVehicle";
	}
	@RequestMapping(value="addVehicle.html", method=RequestMethod.POST)
	public ModelAndView addVehicle(@ModelAttribute Vehicle vehicle){
	//System.out.println(vehicle);
		ModelAndView modelAndView=new ModelAndView();
		vehicleService.insertVehicle(vehicle);
		modelAndView.setViewName("home");
		//System.out.println("In controller" + vehicle);
		return modelAndView;
}
	@RequestMapping(value="search.html")
	public ModelAndView searchVehicle()
	{
		ModelAndView modelAndView=new ModelAndView();
		
		modelAndView.setViewName("search");
		
		return modelAndView;

	}
	
	@RequestMapping(value="search.html", method=RequestMethod.POST)
	public ModelAndView searchingVehicle(@RequestParam("search_by") String search_by, @RequestParam("search") String search)
	{
		ModelAndView modelAndView = new ModelAndView();
		List<Vehicle> list = vehicleService.searchVehicle(search_by,search);
		modelAndView.addObject("vehicle", list);
		modelAndView.setViewName("search");
		//System.out.println(list);
		// System.out.println(search +" "+ search_by);
		 //System.out.println("printing the vehicle list");
		 search = String.valueOf(vehicleService.searchVehicle(search_by,search));
		 //System.out.println(search);
		 return modelAndView;

	}
}