// For all methods in this class:
//   punctuation equals the following characters - ,.!?
//   the parameter will never be null
//   the strings will only contain uppercase, lowercase and punctuation characters

public with sharing class IntermediateStrings 
{
    /*  Finds the longest word in the supplied sentence, excluding 
        punctuation. If multiple words are the longest, returns the
        first encountered
    */    
    public static String findLongestWord(String sentence) {

        sentence = sentence.replaceAll('[-!,.?]', '');

        List<String> wordList =  sentence.split(' ');
        String longestWord = wordList[0];
        Integer longestWordLength = wordList[0].length();
        
        for(Integer i = 1 ; i < wordList.size(); i++) {
        
            if(longestWordLength <  wordList[i].length()) {
        
                longestWord = wordList[i];
                longestWordLength = wordList[i].length();
         
            }
        }
        return longestWord;
    }

    /**
        Returns true if the brackets in the supplied sentence are balanced,
        false otherwise. Brackets includesparentheses '(' and braces '{' 
        but NOT square brackets '['

        How to get characters by idnex with APEX? :
        https://developer.salesforce.com/forums/?id=906F0000000B0IQIA0

     */

    public static String breakWords(String sentence) {
        
        String revisedSentence = '';

        for(Integer i = 0 ; i < sentence.length() - 1 ; i++) {

            String current = sentence.substring(i, i + 1);
            String next    = sentence.substring(i + 1, i + 2);
            
            revisedSentence += current;

            if(current.isAllLowerCase() && next.isAllUpperCase()){

                revisedSentence +=  + ' ';
            }
        }

        return revisedSentence + sentence.right(1);
    }

    /*  Returns true if the brackets in the supplied sentence are balanced,
        false otherwise. Brackets includesparentheses '(' and braces '{' 
        but NOT square brackets '['

        Stack Data Structure implementation for APEX
        http://tech-nugget.blogspot.com/2013/10/implementing-stack-in-apex.html
        
        Basis for solution
        https://www.geeksforgeeks.org/check-for-balanced-parentheses-in-an-expression/
    */
    public static Boolean areBracketsBalanced(String expresssion) {

        expresssion = expresssion.remove('[').remove(']');
        List<String> charArray = expresssion.split('');
        Stack braketStack = new Stack();
        
        for(Integer i = 0 ; i < charArray.size() ; i++) {

            if(charArray[i].equals('(') ||
                charArray[i].equals('{')) {

                    braketStack.push(charArray[i]);
            }

            if(charArray[i].equals(')') ||
                charArray[i].equals('}')) {

                    if(braketStack.isEmpty()) {
                        return false;
                    }else if(!isMatchingPair(braketStack.pop(), charArray[i])) { 
                        return false;
                    }
            }
        }

        return braketStack.isEmpty();
    }

    /*  Given a string, figures out the average word length, ignoring
        punctuation.
    */
    
    public static double findAverageWordLength(String sentence){
        
    sentence = sentence.replaceAll('[^a-zA-Z-z0-9]', ' ');
    List<String> wordArray = sentence.split(' ');
    Decimal total = 0;
    Decimal averageWordLength = 0.0;

        for(Integer i= 0 ; i < wordArray.size() ; i++) {
            if(wordArray[i].length() == 0){
                wordArray.remove(i);
            }
            total += wordArray[i].length();
        }
        return averageWordLength = (total / wordArray.size()).setScale(1);
    }

     /*  
        Stack Data Structure for Apex
    */
        class Stack {
            
        private List<Object> items {get; set;}
        
        public Stack() {
            this.items = new List<Object>();
        }
        
        public Integer size() {
            return this.items.size();
        }

        public Boolean isEmpty() {
            return size() == 0;
        }
            
        public void push(Object itemToPush) {
            this.items.add(itemToPush);
        }
        
        public Object pop() {
            return this.items.remove(size() - 1);
        }
    
        public Object peek() {
    
            return this.items.get(size() - 1);
        } 

    }

    /*  
        Finds if characters are the same type of bracket.
    */
    static boolean isMatchingPair(Object bracket1, String bracket2) { 

        if(String.valueOf(bracket1).equals('(') && 
                bracket2.equals(')')) { 

                return true; 

            }else if(String.valueOf(bracket1).equals('{') && 
                bracket2.equals('}')) {

                return true; 
            }

        else {

            return false;
            } 

        }   
    }