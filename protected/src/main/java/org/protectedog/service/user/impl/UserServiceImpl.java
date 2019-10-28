package org.protectedog.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.User;
import org.protectedog.service.user.UserDAO;
import org.protectedog.service.user.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService{

	///Field
	@Autowired
	@Qualifier("userDAOImpl")
	private UserDAO userDAO;
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	///Constructor
	public UserServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	///Method
	@Override
	public void addUsersBase(User user) throws Exception {
		// TODO Auto-generated method stub
		userDAO.addUsersBase(user);
	}

	@Override
	public void addUsersAdditional(User user) throws Exception {
		// TODO Auto-generated method stub
		userDAO.addUsersAdditional(user);
	}

	@Override
	public User getUsers(String id) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.getUsersById(id);
	}
	
	@Override
	public User getUsersByNick(String nickname) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.getUsersByNick(nickname);
	}

	@Override
	public Map<String, Object> getUsersList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<User> list=userDAO.getUsersList(search);
		int totalCount=userDAO.getTotalCount(search);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public void updateUsers(User user) throws Exception {
		// TODO Auto-generated method stub
		userDAO.updateUsers(user);
	}

	@Override
	public int checkId(String id) throws Exception {
		// TODO Auto-generated method stub
		int result=0;
		User user=userDAO.getUsersById(id);
		System.out.println("chkDup :"+id);
		System.out.println("chkDup : "+user);
		if(user!=null) {
			result=1;
		}
		return result;
	}

	@Override
	public User getKakao(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.getKakao(map);
	}
	
	@Override
	public User getGoogle(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.getGoogle(map);
	}
	
	@Override
	public User getNaver(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.getNaver(map);
	}
	
	@Override
	public int checkNick(String nickname) throws Exception {
		// TODO Auto-generated method stub
		int result=0;
		User user=userDAO.getUsersByNick(nickname);
		System.out.println("chkDup :"+nickname);
		System.out.println("chkDup : "+user);
		if(user!=null) {
			result=1;
		}
		return result;
	}




	
	

}
