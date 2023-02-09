import java.util.Scanner;

public class App {
  public static void main(String[] args) throws Exception {
    Scanner reader = new Scanner(System.in);
    System.out.print("Enter total number of entries: ");
    int count = Integer.parseInt(reader.nextLine());
    int i = 0;
    int positive = 0;
    int negative = 0;
    int x = 0;

    while (i < count) {
      System.out.print("Enter an integer: ");
      x = Integer.parseInt(reader.nextLine());

      if (x > 0) {
        positive++;
      } else {
        negative++;
      }
      i++;
    }

    System.out.println("Total positive " + positive);
    System.out.println("Total negative " + negative);

    reader.close();
  }
}
