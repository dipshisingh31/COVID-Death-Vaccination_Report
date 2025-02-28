# COVID Death Vaccination - SQL Report

## 📚 Overview:

This Project provides SQL queries for analysing CovidDeaths.csv and CovidVaccinations.csv Dataset from 01-01-2020 to 04-30-2021 focusing on trends and insights for the different Countries, Continents.
It is a SQL Data Exploration Project where I used data cleaning and filteration to get the desired datasets and then wrote SQL queries to draw insights from the dataset.

Here is a quick snapshot of the two datasets for COVID Deaths and Vaccinations used:

### COVID Deaths Dataset Snapshot:
![Data Screenshot](https://github.com/dipshisingh31/COVID-Death-Vaccination_SQLReport/blob/main/COVID_Deaths.jpg)

### COVID Vaccinations Dataset Snapshot:
![Data Screenshot](https://github.com/dipshisingh31/COVID-Death-Vaccination_SQLReport/blob/main/COVID_Vaccinations.jpg)



## ✏️ Data cleaning:

- Changed Data types for columns that were incorrectly added in the dataset
- eg. Changed decimal values to Float where it was INT, VARCHAR(1) to VARACHAR(20) if it needed more characters
- Arranged the columns by ordering other columns according to use
- Hid columns not required for the dataset for faster access of columns that were required
- Changed names of columns to a better name so it was accurate to understand
  


## This COVID SQL report covers differet scenarios like:
- Finding Total COVID cases, deaths 'continent'/'country' wise
- Comapring Total Deaths, Total cases, Death percentage for Population
- Highest Infection Rate per Country/Continent for Population
- People fully Vaccinated RATE acc. to Population Country/Region wise
- Highest Number of Cases, Deaths, Vaccinations each Continent Month-wise for a Year
- Using ROW_NUMBER(), CTE, Showing the Country details grouped by highest number of Death cases



## 📊 Technical - SQL Queries & Scenarios:

1. Knowing the Date-Range mentioned in the COVID Dataset:
        ![Data Screenshot](https://github.com/dipshisingh31/COVID-Death-Vaccination_SQLReport/blob/main/SQL1.jpg)

2. Finding Total cases, total deaths 'continent' wise and arranging them from highest to lowest:
        ![Data Screenshot](https://github.com/dipshisingh31/COVID-Death-Vaccination_SQLReport/blob/main/SQL2.jpg)

3. Finding Total cases, total deaths 'country' wise and arranging them from highest to lowest:
        ![Data Screenshot](https://github.com/dipshisingh31/COVID-Death-Vaccination_SQLReport/blob/main/SQL3.jpg)

4. Total Deaths vs. Total cases , Death percentage :
        ![Data Screenshot](https://github.com/dipshisingh31/COVID-Death-Vaccination_SQLReport/blob/main/SQL4.jpg)

5. Total Deaths vs. Total cases , Death percentage each Country:
        ![Data Screenshot](https://github.com/dipshisingh31/COVID-Death-Vaccination_SQLReport/blob/main/SQL5.jpg)

6. Total Deaths vs. Total cases , Death %age for a specific Continent/Country/Location:
        ![Data Screenshot](https://github.com/dipshisingh31/COVID-Death-Vaccination_SQLReport/blob/main/SQL6.jpg)

7. Calculating Highest Infection Rate per Country acc. to Population:
        ![Data Screenshot](https://github.com/dipshisingh31/COVID-Death-Vaccination_SQLReport/blob/main/SQL7.jpg)

8. Top 10 Countries with  Highest Infection Rate:
        ![Data Screenshot](https://github.com/dipshisingh31/COVID-Death-Vaccination_SQLReport/blob/main/SQL8.jpg)

9. Infection Rate per Continent acc. to Population:
        ![Data Screenshot](https://github.com/dipshisingh31/COVID-Death-Vaccination_SQLReport/blob/main/SQL9.jpg)

10. Countries with  Highest Death Rate acc. to Population:
        ![Data Screenshot](https://github.com/dipshisingh31/COVID-Death-Vaccination_SQLReport/blob/main/SQL10.jpg)

11. Death Rate - Continent wise acc. to Population:
        ![Data Screenshot](https://github.com/dipshisingh31/COVID-Death-Vaccination_SQLReport/blob/main/SQL11.jpg)

12. COVID Deaths & Vaccinations Dataset:
       ![Data Screenshot](https://github.com/dipshisingh31/COVID-Death-Vaccination_SQLReport/blob/main/SQL12.jpg)

13. People fully vaccinated RATE acc. to Population for each Country/Region:
        ![Data Screenshot](https://github.com/dipshisingh31/COVID-Death-Vaccination_SQLReport/blob/main/SQL13.jpg)

14. People fully vaccinated RATE acc. to Population for each Continent:
        ![Data Screenshot](https://github.com/dipshisingh31/COVID-Death-Vaccination_SQLReport/blob/main/SQL14.jpg)

15. Highest Number of Cases, Deaths, Vaccinations for Year - 2020 for each Continent every Month:
        ![Data Screenshot](https://github.com/dipshisingh31/COVID-Death-Vaccination_SQLReport/blob/main/SQL15.jpg)

16. Using ROW_NUM(), CTE, Showing the Country details with 2nd Highest, 3rd Highest number of Death cases
        ![Data Screenshot](https://github.com/dipshisingh31/COVID-Death-Vaccination_SQLReport/blob/main/SQL16.jpg)


## 💡 Conclusion

This is a SQL Exploratory Anasysis for analysing countries or continents to know more about their population, deaths due to COVID, vaccinations people got for COVID in each region. It gives insights into the COVID virus happenings for the year 2020, 2021. By writing SQL queries, we can know the insights and get a report of all the different scenarios and conditions for COVID.

### SQL CODE: [Link](https://github.com/dipshisingh31/COVID-Death-Vaccination_SQLReport/blob/main/Covid_Death_VaccinationSQLProject.sql)


