package com.springboot.springbootdealvps.service;

import java.util.*;

import com.springboot.springbootdealvps.entity.User;

public class Service {

	static ArrayList<User> list = new ArrayList<User>();

	public Service(int id, String name, String discp) {
		list.add(new User(id, name, discp));
	}

	public static ArrayList<User> display() {

		return list;

	}

	public static User submitId(int id) {

		User u = null;
		for (User obj : list) {
			if (obj.getId() == id) {
				u = obj;
				break;
			}
		}

		return u; 
	}

}
