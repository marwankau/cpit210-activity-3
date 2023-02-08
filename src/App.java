import java.util.Scanner;

public class App {
  public static void main(String[] args) throws Exception {
    Scanner reader = new Scanner(System.in);
    System.out.print("Enter total number of students: ");
    int count = Integer.parseInt(reader.nextLine());
    int i = 0;
    int top_student = -1;
    int score = 0;

    while (i < count) {
      System.out.print("Enter student score: ");
      score = Integer.parseInt(reader.nextLine());

      if (score > top_student) {
        top_student = score;
      }
      i++;
    }

    System.out.println("Highest score is " + top_student);

    reader.close();
  }
}
