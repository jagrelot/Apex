public with sharing class IntermediateDate1 {

/*
    Tools and Resoureces Used:
    https://salesforce.stackexchange.com/questions/42331/how-to-calculate-the-time-between-two-datetimes
    https://www.timeanddate.com/date/durationresult.html
*/

    public static Integer hoursBetweenDateTimes(String dateStr1, String dateStr2) {

        if(dateStr1 == null || dateStr2 == null) {
            return 0;
        }
        
        DateTime dateStr1DateTime = convertDateTimeStringToNewDateTime(dateStr1);
        DateTime dateStr2DateTime = convertDateTimeStringToNewDateTime(dateStr2);

        Long milliseconds = Math.abs(dateStr1DateTime.getTime() - dateStr2DateTime.getTime());

        return Integer.valueOf(milliseconds / (1000 * 60 * 60));
    }

/*  
    DateTime input format : dd/mm/yy HH:MM:ss 
    These inputs were adjusted to achieve proper fromatting for new datetime
       Year  =  day
       Day   =  month
       Month =  year 
*/

    public static Datetime convertDateTimeStringToNewDateTime(String dateString) {

        dateString = dateString.replace('/', '-');
        Datetime dateStringDateTime = Datetime.valueOf(dateString);

        DateTime dateTimeNewInstance = DateTime.newInstance(dateStringDateTime.day() + 2000,dateStringDateTime.month(),dateStringDateTime.year(),dateStringDateTime.hour(),
        dateStringDateTime.minute(),dateStringDateTime.second());

        return dateTimeNewInstance;

    }
}
