public with sharing class SimpleConditional1 {

    /**
     *  Validates if parameters are equal or NOT equal
     *  @param Integer one 
     *  @param Integer other
     *  @return Boolean : true if equal false if not
     */
    public static Boolean isEqual(Integer one, Integer other) {
     
        return one == other ? true : false;
    }

    /**
     *  Validates if Integer parameter is positive
     *  @param Integer num
     *  @return Boolean : true if positve false if not
     */
    public static Boolean isPositive(Integer num) {    
            
        return num > 0 ? true : false ;
    }

   /**
     *  Validates if Integer parameter is even
     *  @param Integer num
     *  @return Boolean : true if even  false if not
     */
    public static Boolean isEven(Integer num) {

        return Math.mod(num, 2) == 0 ? true : false;
    }

   /**
     * Validates which of the four parameters in largest
     * @param Integer first
     * @param Integer second
     * @param Integer thrid
     * @param Integer fourth
     * @return Integer : largest value or arguments
     */
    public static Integer getLargest(Integer first, Integer second, Integer third, Integer fourth) {

        List<Integer> integerList = new List<Integer>();

        integerList.add(first);
        integerList.add(second);
        integerList.add(third);
        integerList.add(fourth);

        Integer largest = integerList[0];

        for(Integer num : integerList) {
            if(num > largest) {
                largest = num;
            }
        }

        return largest;

      /*  
      Possible Alternate Solutions

      Integer largest = 0;

        if(first > second && first > third && first > fourth) {
            largest = first;
        }
        if(second > first && second > third && second > fourth) {
            largest = second;
        }
        if(third > first && third > second && third > fourth) {
            largest = third;
        }
        if(fourth > first && fourth > second && fourth > third) {
            largest = fourth;
        }

        return largest;
        
        ------------------------------------------------------------
        
        List<Integer> integerList = new List<Integer>();   
        integerList.add(first);
        integerList.add(second);
        integerList.add(third);
        integerList.add(fourth);

        integerList.sort();

        return integerList[integerList.size() - 1]; */
    }

   /**
     * Compares two numbers and determines if one is greater than, less than or equal to the other
     * @param Integer one
     * @param Integer other
     * @return Integer : -1 when one is less than other, +1 when one is greater than other, 0 if one is the same as other
     */
    public static Integer compare(Integer one, Integer other) {

        return one == other ? 0 : one > other ? 1 : -1 ;
       
        /* Alternate Solution
           if(one == other){
             return 0;
            }else {
            return one > other ? 1 : -1 ; 
         }*/
    }
    
}
