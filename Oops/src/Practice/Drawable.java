package Practice;

interface Drawable {
	void draw();
}
class circle implements Drawable{
	public void draw() {
		System.out.println("Drawing circle");
	}
}
class square implements Drawable{
	public void draw() {
		System.out.println("Drawing square");
	}
}
