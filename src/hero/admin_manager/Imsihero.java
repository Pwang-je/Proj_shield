package hero.admin_manager;

import java.util.ArrayList;
import java.util.HashMap;

public class Imsihero {
	ArrayList<String> list;
	HashMap<String, ArrayList<String>> makelist;
	
	public Imsihero() {
		makelist = new HashMap<>();
	}
	
	public ArrayList<String> addHero(String name, ArrayList<String> list) {
		list.add(name);
		return list;
	}
	
	public ArrayList<String> getHero(String number) {
		if(makelist.get(number) != null) {
			list = makelist.get(number);			
		} else {
			makelist(number);
			list = makelist.get(number);	
		}
		return list;
	}
	
	public void makelist(String number) {
		list = new ArrayList<>();
		makelist.put(number, list);
	}
	
	public void remove(String no, ArrayList<String> list) {
		int index = Integer.parseInt(no);
		list.remove(index);
	}
	
	public void newlist(ArrayList<String> list) {
		list.clear();
	}
	
}

