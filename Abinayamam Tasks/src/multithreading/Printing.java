package multithreading;

public class Printing {
    public static void main(String[] args) {
        Printer sharedPrinter = new Printer();

        PrintJob user1 = new PrintJob(sharedPrinter, "User1", 3);
        PrintJob user2 = new PrintJob(sharedPrinter, "User2", 2);
        PrintJob user3 = new PrintJob(sharedPrinter, "User3", 4);

        user1.start();
        user2.start();
        user3.start();
    }
}
class Printer {
    
	synchronized void printDocument(String user, int pages) {
        System.out.println(user + " started printing " + pages + " page(s)");
        for (int i = 1; i <= pages; i++) {
            System.out.println(user + " is printing page " + i);
            try {
                Thread.sleep(500); 
            } catch (InterruptedException e) {
                System.out.println(e);
            }
        }
        System.out.println(user + " finished printing\n");
    }
}
class PrintJob extends Thread {
    Printer printer;
    String user;
    int pages;

    PrintJob(Printer printer, String user, int pages) {
        this.printer = printer;
        this.user = user;
        this.pages = pages;
    }

    public void run() {
        printer.printDocument(user, pages);
    }
}

