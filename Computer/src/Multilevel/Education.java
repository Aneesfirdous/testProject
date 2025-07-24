package Multilevel;

public class Education {
	void ug() {
		System.out.println("Under Graduate");
	}
	void pg() {
		System.out.println("Post Graduate");
	}
}
class Arts extends Education{
	void bsc() {
		System.out.println("Bachelor of Science");
	}
	void Bed() {
		System.out.println("Bachelor of Education");
	}
}
class Engineering extends Arts{
	void be() {
		System.out.println("Bachelor of Engineering");
	}
	void btech() {
		System.out.println("Bachelor of Technology");
	}
}
class Medicine extends Engineering{
	void mbbs() {
		System.out.println("Bachelor of Medicine and Bachelor of surgery");
	}
}
