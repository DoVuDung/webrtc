package com.webrtc.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.webrtc.model.Customizeinterest;

@Repository("customizeinterestDao")
public class CustomizeinterestDaoImpl implements CustomizeinterestDao{

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addCustomizeinterest(Customizeinterest customizeinterest){
		// TODO Auto-generated method stub
		
		String accessories=customizeinterest.getCustomizeaccessories();
		String automobile=customizeinterest.getCustomizeautomobile();
		String food=customizeinterest.getCustomizefood();
		String sipuri=customizeinterest.getCustomizesipuri();
		System.out.println("------"+sipuri);
		
		/*Query query =(Query) sessionFactory.getCurrentSession().get(Customizeinterest.class,
				sipuri);
		*/
			Query query =sessionFactory.getCurrentSession().createQuery("from Customizeinterest where customizesipuri='"+sipuri
			+ "'");
				List l=query.list();
		
		if(l.size()>0){
			System.out.println("inside if ");
			sessionFactory
			.getCurrentSession()
			.createQuery(
					"UPDATE Customizeinterest set  customizeaccessories='"+accessories
							+ "',customizeautomobile='"+automobile
							+ "',customizefood='"+food
							+ "' where customizesipuri='"+sipuri
							+ "'")
			.executeUpdate();
			
		}
		else{
			System.out.println("inside else");
			sessionFactory
			.getCurrentSession()
			.createSQLQuery(
					"INSERT into Customizeinterest values('"+sipuri
							+ "','"+accessories
							+ "', '"+automobile
							+ "','"+food
							+ "')")
			.executeUpdate();
				}
			}
	@SuppressWarnings("unchecked")
	@Override
	public List<Customizeinterest> listCustomizeinterestss(String sipuri) {
		// TODO Auto-generated method stub
		Query query =sessionFactory.getCurrentSession().createQuery("from Customizeinterest where customizesipuri='"+sipuri
				+ "'");
					List<Customizeinterest> l=query.list();
		/*return (List<Customizeinterest>) sessionFactory.getCurrentSession()
				.createCriteria(Customizeinterest.class).list();*/
					
					return l;
	}
}
