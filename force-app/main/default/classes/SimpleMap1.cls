public with sharing class SimpleMap1 {

    /** 
        Creates a map of a String list with the index value as the key and the string as the value. Indexing begins
        at 1 NOT 0.
        @param List of Strings
        @return Map<Integer, String> 
    */
    public Map<Integer, String> addLabelsToMap(List<String> labels) {
       
        Map<Integer,String> indexTolabelsMap = new Map<Integer,String>();

        if(!labels.isEmpty()) {
            for(Integer i = 1 ; i < labels.size() + 1 ; i++) {
                indexTolabelsMap.put(i,labels[i -1]);
            }
        }

        return indexTolabelsMap;
    }

    /** 
        Evaluates a map argument and only adds new elements if the key does not exist in the map. 
        @param Map<Integer,String> inMap
        @param Integer key :  validated against exisiting map
        @param String value : value of to add to map if no key found
        @return void
    */
    public void addIfNotPresent(Map<Integer, String> inMap, Integer key, String value) {

        if(inMap != null && !inMap.isEmpty()) {
            if(!inMap.containsKey(key)) {
                inMap.put(key, value);
            }
        }
    }    
    
    /**
     *  Evaluates a map to see if all elements of the list are present
     *  @param Map<Integer, String> inMap
     *  @param List<Integer>
     *  @return Boolean : true if the supplied 'inMap' contains entries for all elements 
     *  in the supplied list 'keys' 
     */
    public Boolean containsKeys(Map<Integer, String> inMap, List<Integer> keys) {
  
        Boolean mapContainsAllKeys = false;
        Integer keyCount = 0;

        for(Integer key : keys) {
            if(inMap.containsKey(key)) {
                keyCount++;
            }
        }

        if(keyCount == keys.size()) {
            mapContainsAllKeys = true;
        }

        return mapContainsAllKeys;
    }    
    
    /**
     *  Combines both maps given into a single map.
     *  @param Map<Integer, String>
     *  @param Map<Integer, String>
     *  @return Map<Integer, String>: combined map
     */
    public Map<Integer, String> combineMaps(Map<Integer, String> map1, Map<Integer, String> map2) {
     
        Map<Integer, String> combinedMap = new Map<Integer, String>();
        map2.putAll(map1);
        combinedMap = map2.clone();

        return combinedMap;
    }

   /**
    *  Gets number of key/value pairs.
    *  @param Map<String, String>
    *  @return Integer: size of map
    */
    public Integer getSize(Map<String, String> inMap) {
        
        Integer size = 0;

        if(inMap.size() > 0) {
            size = inMap.size();
        }

        return size;
    }

  /**
    *  Gets max value stored in map parameter.
    *  @param Map<String, Integer>
    *  @return Integer: max value
    */
    public Integer getMaxValue(Map<String, Integer> inMap) {
        
        List<Integer> integersInMap = new List<Integer>();

        for(Integer num : inMap.values()) {
            integersInMap.add(num);
        }

        integersInMap.sort();

        return integersInMap[integersInMap.size() - 1];
    }

    /** Get the sum total of the key values rom the supplied map
     *  @param Map<Integer, String>
     *  @return Integer: the sum total of the key values
     */
    public Integer getKeyTotal(Map<Integer, String> inMap) {
  
        Integer total = 0; 

        for(Integer intInKey : inMap.keySet()) {
            total += intInKey;
        }

        return total;
    }

    /**
     *  Removes the entry keyed by the supplied  Integer'key' from the supplied'inMap'
     *  ONLY if it is currently mapped to the supplied value.
     *  @param Map<Integer, String>
     *  @param Integer : key of element in map
     *  @param String  : value of element in map
     */
    public void removeIfValueMatches(Map<Integer, String> inMap, Integer key, String value) {

        for(Integer intInKey : inMap.keySet()) {
            if(inMap.containsKey(intInKey) && inMap.get(intInKey).equals(value)) {
                inMap.remove(intInKey);
            }
        }
    }
}
