public with sharing class SimpleCollections1 {


    /** Gets the Max value from a List 
    *  @param List<Integer> values
    *  @return Integer : Max value in List
    */
    public Integer getMaxInList(List<Integer> values) {

        if(!values.isEmpty()) {
            values.sort();    
        
            return values[values.size() - 1];
        }
        return 0;
    }

    /** Validates if candidate is present in the list of values.
    *  @param List<Integer> values
    *  @param List<Integer> candidate
    *  @return Boolean :  true if the candidate value is present in the list of values, otheerwise false.
    */
    public Boolean isInList(List<Integer> values, Integer candidate) {
        
        return values.contains(candidate) ? true : false; 
    }
    
    /** Reverses list of values passed as the argument.
    *  @param List<Integer> values
    *  @return List<Integer> : a revered List of values
    */
    public List<Integer> reverseList(List<Integer> values) {

        List<Integer> reversedList = new List<Integer>();

        for(Integer i = values.size() - 1 ; i >= 0 ; i--) {
            reversedList.add(values[i]);
        }

        return reversedList;
    }
    
    /** Shifs to the left the number of spaces specifed by num provided.
    *  @param List<Integer> 
    *  @param Integer num
    *  @return List<Integer> : a list shifted to the left the number of spaces specifed by num
    */
    public List<Integer> shiftLeft(List<Integer> values, Integer num) {
        /**
         * http://heatheryou.com/using_the_modulo_operator_to_rotate_arrays
         * https://www.youtube.com/watch?v=84qSAdqOI1I
         */
        List<Integer> shiftedValues = new List<Integer>();    

        for(Integer i = 0; i < values.size(); i++) {
            shiftedValues.add(values[Math.mod(i + num, values.size())]);
        }
        return shiftedValues;
    }

    /** Combines Lists provided with alternating values.
    *  @param  List<Integer> left
    *  @param  List<Integer> right
    *  @return List<Integer> : Combined List with alternating values
   */
    public List<Integer> joinAlternate(List<Integer> left, List<Integer> right) {
   
        List<Integer> combinedList =new List<Integer>();
        Integer numOfLoops = left.size() < right.size() ? left.size() : right.size();
        
        for(Integer i = 0 ; i < numOfLoops ; i++) {
            combinedList.add(left[i]);
            combinedList.add(right[i]);
        }
                
        if(right.size() > left.size()) {
            for(Integer i = 0 ; i < right.size() - left.size() ; i++) {
                combinedList.add(right[left.size() + i]);
            }
        }
        
        if(left.size() > right.size()) {
            for(Integer i = 0 ; i < left.size() - right.size() ; i++) {
                combinedList.add(left[right.size() + i]);
            }
        }
    
        return combinedList;
    }
}
