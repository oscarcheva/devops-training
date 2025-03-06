package org.example;

import java.util.*;

public class Main {
    public static void main(String[] args) {
        // System.out.println(armsTrongNumber(153));
        // System.out.println(vowelsCounter("Oscar"));
        // duplicatesChecker(List.of(1,2,3,4,5,5,2));
        // System.out.println(factorial(3));
        // System.out.println(missingNumber(12356));
        // System.out.println(palindrome("racecara"));
        // primeNumbers(100);
         // System.out.println(reversedString("Original"));
        System.out.println(sumNumbers(134));

    }

    public static String armsTrongNumber(int number) {
        int digits = String.valueOf(number).length();
        String[] eachDigit = String.valueOf(number).split("");
        int result = 0;
        int powerResult = 1;


        for (String num : eachDigit) {
            int loneNumber = Integer.parseInt(num);
            for (int i = 0; i < digits; i++) {
                powerResult *= loneNumber;
            }
            result += powerResult;
            powerResult = 1;

        }
        if (result == number)
            return (number + " is an Armstrong number");
        return (number + " is not an Armstrong number");
    }

    public static String vowelsCounter(String word) {
        char[] separated = word.toLowerCase().toCharArray();
        int counter = 0;
        for (char letter : separated) {
            if ("aeiou".indexOf(letter) != -1)
                counter++;
        }
        return "Your word has " + counter + " vowels";

    }

    public static void duplicatesChecker(List<Integer> list) {
        List<Integer> mutableList = new ArrayList<>(list);
        Collections.sort(mutableList);
        for (Integer num: mutableList)
        {
            mutableList.
        }

        for (int i = 0; i < list.size() - 1; i++) {
            if (Objects.equals(mutableList.get(i), mutableList.get(i + 1))) {
                System.out.println(mutableList.get(i) + " is a duplicate!");
            }
        }


    }

    public static String factorial(int number) {
        int result = 1;
        for (int i = 1; i <= number; i++) {
            result *= i;
        }

        return "The factorial of " + number + " is " + result;

    }

    public static String missingNumber(int number) {
        List<Integer> myList = new ArrayList<>();
        String[] eachDigit = String.valueOf(number).split("");
        for (String digit : eachDigit)
            myList.add(Integer.valueOf(digit));

        for (int i = 0; i <= myList.size(); i++) {
            if (myList.get(i + 1) - myList.get(i) != 1) {
                return "The missing number is " + (myList.get(i) + 1);
            }
        }
        return "No number is missing";

    }

    public static String palindrome(String word) {
    /*    String[] array = word.split("");
        String [] reversedArray = Arrays.stream(array)
                .sorted((a, b) -> -1)
                .toArray(String[]::new);

        for (int i = 0 ; i <array.length; i++)
            if (!array[i].equalsIgnoreCase( reversedArray[i]))
                return "Not a palindrome";
                */

        String reversedString = new StringBuilder(word).reverse().toString();

        return word.equalsIgnoreCase(reversedString) ? "We have a palindrome" : "Not a palindrome";

    }

    public static void primeNumbers(int limit) {

        for (int i = 0; i <= limit;i++)
        {
            if (i % 5 == 0)
                System.out.printf("The number %d is not a prime number.%n",i);
            else if (i % 3 == 0)
                System.out.printf("The number %d is not a prime number.%n",i);
            else if (i % 2 == 0)
                System.out.printf("The number %d is not a prime number.%n",i);
            else
                System.out.printf("The number %d is a prime number!.%n",i);

        }

    }

    public static String reversedString(String word) {

    StringBuilder reversedWord = new StringBuilder();

        for ( int i = word.length()-1; i>=0 ; i--)
            reversedWord.append(word.charAt(i));

        return reversedWord.toString();
    }

    public static String sumNumbers(int number) {

        String [] numbers = String.valueOf(number).split("");
        int result = 0 ;

        for (String digit : numbers)
            result+= Integer.parseInt(digit);

        return "The value of the sum is: " + result;
    }

}