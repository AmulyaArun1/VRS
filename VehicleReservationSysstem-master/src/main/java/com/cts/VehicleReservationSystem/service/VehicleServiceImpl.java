package com.cts.VehicleReservationSystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cts.VehicleReservationSystem.bean.Vehicle;

import com.cts.VehicleReservationSystem.dao.VehicleDAO;

@Service("vehicleService")
@Transactional(propagation=Propagation.SUPPORTS)
public class VehicleServiceImpl implements VehicleService {

	@Autowired
	VehicleDAO vehicleDAO ;

	@Override
	public Vehicle insertVehicle(Vehicle vehicle) {
		System.out.println("In Service" + vehicle);
		return vehicleDAO.insertVehicle(vehicle);
	}

	@Override
	public List<Vehicle> getallVehicle() {
		// TODO Auto-generated method stub
		return vehicleDAO.getallVehicle();
	}

	@Override
	public List<Vehicle> searchVehicle(String search_by, String search) {
		// TODO Auto-generated method stub
		return vehicleDAO.searchVehicle(search_by,search);
	}

}
