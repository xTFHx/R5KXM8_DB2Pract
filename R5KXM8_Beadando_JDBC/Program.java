public class Program {

    static DbMethods dbm = new DbMethods();
    static ConsoleMethods cm = new ConsoleMethods();

    public static void main(String[] args) {

        dbm.Reg();

        while (true) {
            menu();
        }
    }

    static void menu() {

        System.out.println("\nMENÜ");
        System.out.println("0 Kilépés");
        System.out.println("1 Versenyző lista");
        System.out.println("2 Versenyző beszúrás");
        System.out.println("3 Csapat lista");
        System.out.println("4 Csapat beszúrás");
        System.out.println("5 Versenyző-Csapat kapcsolat beszúrás");
        System.out.println("6 Kapcsolatok listája");
        System.out.println("7 Csapat költség módosítása");
        System.out.println("8 Csapatok listája motor szerint");

        String m = cm.ReadData("Választás: ");

        switch (m) {

            case "0":
                System.exit(0);
                break;

            case "1":
                dbm.VersenyzoLista();
                break;

            case "2":
                VersenyzoInsert();
                break;

            case "3":
                dbm.CsapatLista();
                break;

            case "4":
                CsapatInsert();
                break;

            case "5":
                KapcsolatInsert();
                break;

            case "6":
                dbm.VersenyzoCsapatLista();
                break;

            case "7":
                KoltsegModositas();
                break;

            case "8":
                MotorLista();
                break;
        }
    }

    static void VersenyzoInsert() {

        String id = cm.ReadData("Versenyző ID: ");
        String nev = cm.ReadData("Név: ");
        String nemzet = cm.ReadData("Nemzetiség: ");
        String datum = cm.ReadData("Születési dátum: ");
        String pont = cm.ReadData("Pontszám: ");

        dbm.InsertVersenyzo(id, nev, nemzet, datum, pont);
    }

    static void CsapatInsert() {

        String id = cm.ReadData("Csapat ID: ");
        String nev = cm.ReadData("Név: ");
        String motor = cm.ReadData("Motor: ");
        String alapitas = cm.ReadData("Alapítás éve: ");
        String koltseg = cm.ReadData("Költségvetés: ");

        dbm.InsertCsapat(id, nev, motor, alapitas, koltseg);
    }

    static void KapcsolatInsert() {

        String versenyzo = cm.ReadData("Versenyző ID: ");
        String csapat = cm.ReadData("Csapat ID: ");

        dbm.InsertKapcsolat(versenyzo, csapat);
    }

    static void KoltsegModositas() {

        String id = cm.ReadData("Csapat ID: ");

        if (dbm.SelectCount("Csapat", "csapat_id", id) == 0) {
            System.out.println("Nincs ilyen csapat!");
            return;
        }

        String koltseg = cm.ReadData("Új költségvetés: ");

        dbm.UpdateKoltseg(id, koltseg);
    }

    static void MotorLista() {

        String motor = cm.ReadData("Motor: ");

        dbm.CsapatMotorLista(motor);
    }
}