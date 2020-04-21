/*********************************************
 *
 * Mentz 'Hello, World!' solution class
 *
 *
 *********************************************/
public with sharing class HelloWorld 
{
    String greeting = 'Hello, World!';

    public HelloWorld(String greeting) 
    {
        this.greeting = greeting;
    }

    public String sayHelloWorld()
    {
        // change this method to return Hello, World!
        return greeting;
    }

    public String sayHelloWorldAndMore(String more)
    {
        // change this method to combine Hello, World! 
        // and the more parameter and return the result
        return sayHelloWorld() + more;
    }
}
