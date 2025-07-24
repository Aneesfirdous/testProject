package multithreading;

public class Busticketbooking {
	public static void main(String[] args) {
		Bus bus = new Bus();
		passenger p1= new passenger(bus,"Anees",8);
		passenger p2= new passenger(bus,"Firdous",2);
		
		p1.start();
		p2.start();
	}
}
class Bus{
	int availableSeat =10;
	
	synchronized void ticketBook(String Name,int required ){
		
		if(availableSeat >=required) {
			System.out.println(Name + "is booking "+ required +" seats");
			try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			availableSeat -=required;
			System.out.println(Name + " Successfully Booked " +required+ "seats");
		}else {
			System.out.println(Name +" Seats are not available");
		}
	}
}
class passenger extends Thread{
	Bus bus;
	String P_Name;
	int seat;
	
	public passenger(Bus bus,String P_Name,int seat) {
		this.bus=bus;
		this.P_Name= P_Name;
		this.seat=seat;
	}
	public void run(){
		bus.ticketBook(P_Name,seat);
		}
}