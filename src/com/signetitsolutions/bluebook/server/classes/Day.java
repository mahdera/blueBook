/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.signetitsolutions.bluebook.server.classes;

import java.util.Arrays;

/**
 *
 * @author mahder
 */

public class Day {   
   private String yearName  = "" ;

   private int day     = 0 ;
   private int date    = 0 ;
   private int month   = 0 ;
   private int year    = 0 ;   
   
   private String holidayName         = "" ;
   private String holidayType         = "" ;

   /* Ethiopian week days starting from Sunday in integer form */
   int[] weekDays = {5, 6, 0, 1, 2, 3, 4} ;

   
   private String gregorianDay = "" ;
   private int gregorianDate   = 0 ;
   private int gregorianMonth  = 0 ;
   private int gregorianYear   = 0 ;

   /**
    * Default constructor
    */
   public Day() {}

   /**
    * Parameterized constructor
    * @param String yearName
    * @param int day
    * @param int month
    * @param int date
    * @param int year
    */
   public Day(String yearName, int day, int month, int date, int year) {
      this.yearName  = yearName ;
      this.day   = day ;
      this.date  = date ;
      this.month = month ;
      this.year  = year ;
   }

   /**
    * Parameterized constructor
    * @param String yearName
    * @param int day
    * @param int month
    * @param int date
    * @param int year
    * @param String gregorianDay
    * @param int gregorianMonth
    * @param int gregorianDate
    * @param int gregorianYear
    */
   public Day(String yearName, int day, int month, int date, int year,
       String gregorianDay, int gregorianMonth, int gregorianDate,
                                                int gregorianYear) {
      this.yearName  = yearName ;
      this.day   = day ;
      this.date  = date ;
      this.month = month ;
      this.year  = year ;
      this.gregorianDay   = gregorianDay ;
      this.gregorianDate  = gregorianDate ;
      this.gregorianMonth = gregorianMonth ;
      this.gregorianYear  = gregorianYear ;
   }

   /**
    * This method returns an array of week days
    * @return int[]
    */
   public int[] getWeekDays() {
      return weekDays ;
   }

   /**
    * This method sets the current year with the parameter year
    * @param yearName
    */
   public void setYearName(String yearName) {
      this.yearName  = yearName ;
   }

   /**
    * This method returns the current year
    * @return
    */
   public String getYearName() { return yearName ; }

   /**
    * This method sets the day data member with the parameter value
    * @param day
    */
   public void setDay(int day) {
      this.day   = day ;
   }

   /**
    * Returns the day data member
    * @return Day
    */
   public int getDay()  { return day ; }
   
   public void setMonth(int month) {
      this.month = month ;
   }
   
   public int getMonth() {
      return month ;
   }
   
   public void setDate(int date) {
      this.date  = date ;
   }
   
   public int getDate() {
      return date ;
   }
   
   public void setYear(int year) {
      this.year  = year ;
   }
   
   public int getYear()    {
      return year ;
   }
   
   public void setHolidayName(String holidayName) {
      this.holidayName = holidayName ;
   }
   
   public String getHolidayName()  {
      return holidayName ;
   }
   
   public void setHolidayType(String holidayType) {
      this.holidayType = holidayType ;
   }
   
   public String getHolidayType()  {
      return holidayType ;
   }
   
   public void setGregorianDay(String gregorianDay)  {
      this.gregorianDay = gregorianDay ;
   }
   
   public String getGregorianDay() {
      return gregorianDay ;
   }
   
   public void setGregorianMonth(int gregorianMonth)  {
      this.gregorianMonth = gregorianMonth ;
   }
   
   public int getGregorianMonth() {
      return gregorianMonth ;
   }
   
   public void setGregorianDate(int gregorianDate) {
      this.gregorianDate  = gregorianDate ;
   }
   
   public int getGregorianDate() {
      return gregorianDate ;
   }
   
   public void setGregorianYear(int gregorianYear) {
      this.gregorianYear  = gregorianYear ;
   }
   
   public int getGregorianYear() {
      return gregorianYear ; 
   }

/* (non-Javadoc)
 * @see java.lang.Object#toString()
 */
@Override
public String toString() {
	return "Day [yearName=" + yearName + ", day=" + day + ", date=" + date
			+ ", month=" + month + ", year=" + year + ", holidayName="
			+ holidayName + ", holidayType=" + holidayType + ", weekDays="
			+ Arrays.toString(weekDays) + ", gregorianDay=" + gregorianDay
			+ ", gregorianDate=" + gregorianDate + ", gregorianMonth="
			+ gregorianMonth + ", gregorianYear=" + gregorianYear + "]";
}
   
   

}//end class
