package com.cts.VehicleReservationSystem.dao;

import java.util.List;  

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cts.VehicleReservationSystem.bean.Vehicle;


@Repository("vehicleDAO")
@Transactional
public class VehicleDAOImpl implements VehicleDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public Vehicle insertVehicle(Vehicle vehicle) {
		//System.out.println("In DAO" + vehicle);

		Session session=null;
		session=sessionFactory.getCurrentSession();
		//System.out.println(vehicle);
		
		session.saveOrUpdate(vehicle);
		// TODO Auto-generated method stub
		return vehicle;
	}

	
	
	@Transactional(readOnly=true)
	public List<Vehicle> getallVehicle() {
		Session session=null;
		String query="SELECT * from vehicle";
		org.hibernate.query.Query<Vehicle> query2=null;
		session = sessionFactory.openSession();
		//query2=session.createQuery(query);
		query2=session.createNativeQuery(query,Vehicle.class);
		List<Vehicle> list=(List<Vehicle>)query2.getResultList();
		/*for(Vehicle element:list)
		{
		element.setVehicleNumber(Integer.parseInt(element.getVehicleNumber().toString()));}*/
		System.out.println(list);
		System.out.println("exiting DAO");

		
		return list;
	}


	@Transactional
	public List<Vehicle> searchVehicle(String search_by, String search) {
		
		if("vehicleType".equals(search_by)){
		//System.out.println("in DAO" + search + search_by);
		Session session = null;
		String query="from vehicle where vehicleType = ?";
		//System.out.println("query formed");
		org.hibernate.query.Query<Vehicle> query2 = null;
		session = sessionFactory.getCurrentSession();
		//query2.setParameter(0, search_by);
		query2= session.createQuery(query);
		query2.setParameter(0, search);
		List<Vehicle> list=(List<Vehicle>)query2.getResultList();
		//System.out.println("list value"+list);
		return list;
	}
		else if("serviceDue".equals(search_by)){
			//System.out.println("in DAO" + search + search_by);
			Session session = null;
			String query="from vehicle where serviceDue = ?";
			//System.out.println("query formed");
			org.hibernate.query.Query<Vehicle> query2 = null;
			session = sessionFactory.getCurrentSession();
			//query2.setParameter(0, search_by);
			query2= session.createQuery(query);
			query2.setParameter(0, search);
			List<Vehicle> list=(List<Vehicle>)query2.getResultList();
			return list;
		}
		
		else if("insuranceExpiry".equals(search_by)){
			//System.out.println("in DAO" + search + search_by);
			Session session = null;
			String query="from vehicle where insuranceExpiry = ?";
			//System.out.println("query formed");
			org.hibernate.query.Query<Vehicle> query2 = null;
			session = sessionFactory.getCurrentSession();
			//query2.setParameter(0, search_by);
			query2= session.createQuery(query);
			query2.setParameter(0, search);
			List<Vehicle> list=(List<Vehicle>)query2.getResultList();
			return list;
		}
		else if("branch".equals(search_by)){
			//System.out.println("in DAO" + search + search_by);
			Session session = null;
			String query="from vehicle where branch = ?";
			//System.out.println("query formed");
			org.hibernate.query.Query<Vehicle> query2 = null;
			session = sessionFactory.getCurrentSession();
			//query2.setParameter(0, search_by);
			query2= session.createQuery(query);
			query2.setParameter(0, search);
			List<Vehicle> list=(List<Vehicle>)query2.getResultList();
			return list;
		}
		return null;
	}
	
	

}
