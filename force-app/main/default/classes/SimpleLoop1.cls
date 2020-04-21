/*********************************************
 *
 * Mentz 'Simple Loop 1' solution class
 *
 *
 *********************************************/
 public with sharing class SimpleLoop1 {
    
    public List<Integer> getOneToN(Integer n) {
        // change this method to return a list (array) of numbers from 
        // 1 to n (e.g. 1, 2, 3 where n=3)
        // use a loop!
        List<Integer> listOfNumbers = new List<Integer>();

        for(Integer i = 1 ; i <= n ; i++) {
            listOfNumbers.add(i);
        }

        return listOfNumbers;
    }

    public List<Integer> getOneToNOddOnly(Integer n) {
        // change this method to return a list (array) of numbers from 
        // 1 to n that are odd (e.g. 1, 3, 5 for n=5)
        // use a loop!


    /**
      * Alertnate for more effeciency
        for (Integer i=1; i<=n; i+=2) {
            listOfOddNumbers.add(i);
        }
    }*/

        List<Integer> listOfOddNumbers = new List<Integer>();

        for(Integer i = 1 ; i <= n ; i++) {
            if(Math.mod(i,2) != 0) {
                listOfOddNumbers.add(i);
            }
        }

        return listOfOddNumbers;
    }

    public List<Integer> getTimesTable(Integer n) {
        // change this method to return a the times table for n, up to 12 times
        // (e.g. 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24 where n=2)
        // use a loop!

        /**
         * Alertnate approach
         * for (Integer i = n; i <= 12*n; i+=n) {
                timesTable.add(i);
            }
         */
        List<Integer> timesTable = new List<Integer>();

        for(Integer i = 1 ; i <= 12 ; i++ ) {
            timesTable.add(i * n);
        }

        return timesTable;
    }
}
