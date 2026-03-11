import java.util.Scanner; 
 
public class ConsoleMethods { 
 
    private final Scanner scanner = new Scanner(System.in); 
    //A Scanner osztálynak meghívjuk a konstruktorát, 
    // mely megkapja a System.in bemenetet - ez a billentyűzet 
 
    //string-et kér a usertől 
    public String readString(String message) //ez lesz a kiírt üzenet. 
    { 
        System.out.println(message); 
        return scanner.nextLine().trim(); // teljes sort olvas be, eltávolitja a szóközöket 
    } 
 
    public int readInt(String message) { 
        while (true) { 
            System.out.println(message); 
            String line = scanner.nextLine().trim(); 
            //beolvassa, amit a user beirt, és levágja a szóközöket 
 
            try { 
                return Integer.parseInt(line); //átalakitja számmá, ha nem szám - hibát dob 
            } catch (NumberFormatException e) { 
System.out.println("Hibás szám, próbáld újra!"); 
} 
} 
} 
}