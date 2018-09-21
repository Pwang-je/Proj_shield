package hero.cases.manager;

import java.util.ArrayList;

public class imsihero {
	ArrayList<String> list;
	public imsihero() {
		// TODO Auto-generated constructor stub
		list = new ArrayList<>();
	}
	public ArrayList<String> addHero(String name) {
		list.add(name);
		return list;
	}
	public ArrayList<String> getHero() {
		return list;
	}
	
	public void remove(String no) {
		int index = Integer.parseInt(no);
		list.remove(index);
	}
	
	public void newlist() {
		list.clear();
	}
}
