package R5KXM8;

import java.util.Scanner;

public class ConsoleMethods {
	private final Scanner scanner = new Scanner(System.in);
	
	public String readString(String message) 
	{
		System.out.println(message);
		return scanner.nextLine().trim();
	}
	
	public int readInt(String message) {
		while (true) {
			System.out.println(message);
			String line = scanner.nextLine().trim();
		}
	}
}
