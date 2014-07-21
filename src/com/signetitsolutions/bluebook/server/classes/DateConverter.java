/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.signetitsolutions.bluebook.server.classes;

/**
 *
 * @author mahder
 */
public class DateConverter {
    private static final int bce   = 5500;

    /**
     * Default constructor
     */
    public DateConverter() {
    }

     /**
      * This method is used to convert a given Gregorian Date to its equivalent
      * Ethiopic Date
      * @param date
      * @param month
      * @param year
      * @return Day
      */
     public static Day toEthiopian(int date, int month, int year) {     
     String[] saintName = {"Yohaniss", "Mathiwoss", "Markos", "Lukus"} ;

      
      Day dayObj = new Day() ;

      
      if (month == 0 || date == 0 || year == 0)
         return null ;

      
      if ( (month == 10) && (date >= 5) && (date <= 14) && (year == 1582))
         return null ;

      
      int[] gregorianMonths  = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31} ;

      
      int[] ethiopianMonths  = {0, 30, 30, 30, 30, 30, 30, 30, 30, 30, 5, 30, 30, 30, 30} ;

      
      if ( (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 )
         gregorianMonths[2] = 29 ;

      
      int ethiopianYear = year - 8 ;

      
      ethiopianMonths[10] = (ethiopianYear % 4 == 3 ? 6 : 5) ;

      
      int newYearDay = whenIsEthNewYearInGregSeptember(year - 8) ;

      
      int until = 0 ;
      for (int i=1; i < month; i++)
         until += gregorianMonths[i] ;
      until += date ;

      
      int tahissas = 25 + (ethiopianYear % 4 == 0 ? 1 : 0) ;

      
      if (year < 1582) {
         ethiopianMonths[1] = 0 ;
         ethiopianMonths[2] = tahissas ;
      } else if ( (until <= 277) && (year == 1582) ) {
         ethiopianMonths[1] = 0 ;
         ethiopianMonths[2] = tahissas ;
      } else {
         tahissas = newYearDay - 3 ;
         ethiopianMonths[1] = tahissas ;
      }

      
      int m = 0, d = 0 ;
      for (m=1; m < ethiopianMonths.length; m++) {
         // System.out.println(m + " ==>\t " + until + "  " + "[" + ethiopianMonths[m] + "]") ;
         if (until <= ethiopianMonths[m]) {
            dayObj.setDate((m == 1 || ethiopianMonths[m] == 0 ? until + (30 - tahissas) : until)) ;
            break ;
         } else {
            until -= ethiopianMonths[m]  ;
         }
      }

      
      int order[] = {0, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 1, 2, 3, 4};      
      dayObj.setYear((m > 10 ? ++ethiopianYear : ethiopianYear));
      dayObj.setMonth(order[m]) ;
      dayObj.setDay(getEthiopianDayIndex(dayObj.getMonth(), dayObj.getDate(), dayObj.getYear())) ;
      dayObj.setYearName(saintName[dayObj.getYear() % 4]) ;
      return dayObj ;
   }//end toEthiopian


   /**
    * This method is used to convert a given Ethiopic Day to its equivalent
    * Ethiopic Day
    * @param date
    * @param month
    * @param year
    * @return Day
    */
   public static Day toGregorian(int date, int month, int year) {
	   if(date > 30)
		   date = 23;
	   if(month > 12)
		   month = 7;
	  System.out.println("toGregorian(date,month,year): "+date+"-"+month+"-"+year);
      Day dayObj = new Day("", 0, month, date, year) ;      
      if (month == 0 || date == 0 || year == 0)
         return null ;
      
      int newYearDay = whenIsEthNewYearInGregSeptember(year) ;
      
      int gregorianYear = year + 7 ;
      
      int[] gregorianMonths  = {0, 30, 31, 30, 31, 31, 28, 31, 30, 31, 30, 31, 31, 30} ;

      
      int nextYear = gregorianYear + 1 ;
      if ( ((nextYear % 4 == 0) && (nextYear % 100 != 0)) || (nextYear % 400 == 0) )
         gregorianMonths[6] = 29 ;
      
      int until = ( (month-1) * 30) + date ;
      if (until <= 37 && year <= 1575) {   
         until += 28 ;
         gregorianMonths[0] = 31 ;
      } else {
         until += (newYearDay - 1) ;
      }
      
      until = (year-1 % 4 == 3 && month == 13 ? ++until : until) ;

      
      int m = 0, d = 0 ;
      for (int i=0; i < gregorianMonths.length; i++) {
         if (until <= gregorianMonths[i]) {
            m = i ;
            dayObj.setGregorianDate(until) ;
            break ;
         } else {
            m = i ;
            until -= gregorianMonths[i]  ;
         }
      }

      
      int order[] = {8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9} ;
      
      dayObj.setGregorianYear((m > 4 ? ++gregorianYear : gregorianYear)) ;
      dayObj.setGregorianMonth(order[m]) ;
      dayObj.setYearName("") ;
      
      dayObj.setDay(getEthiopianDayIndex(month, date, year)) ;

      return dayObj ;
   }

   /**
    * This method check the first Ethiopic Date and its equivalent Gregorian
    * Date
    * @param year
    * @return
    */
    public static int whenIsEthNewYearInGregSeptember(int year) {
      
      int newYearDate = ( (year / 100) - (year / 400) - 4) ;
      
      newYearDate = ( ((year-1) % 4) == 3 ? ++newYearDate : newYearDate ) ;
      return newYearDate ;
   }

    /**
     * This method is used to return the ethiopian day index
     * @param month
     * @param date
     * @param year
     * @return
     */
    public static int getEthiopianDayIndex(int month, int date, int year) {      
      int era = bce + year ;
      era -= 1 ;

      
      int tmp = 0 ;
      for (int i=0; i <= era; i++) {
          if (i % 4 == 3) tmp++ ;
      }
      
      int days = (era * 365) + tmp + ( (month - 1) * 30) + (date - 1) ;

      return (days % 7) ;
   }
}//end class
