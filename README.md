# Titanic-Data-Analysis SQL + Excel Case Study (No ML)
SQL cleaning and Excel pivot analysis of the Kaggle Titanic dataset. Includes PostgreSQL scripts for data preparation (schema design, null handling, formatting) and Excel/Google Sheets pivot tables with charts to explore survival patterns by class, gender, family size, and port of embarkation.

**Note:**  
For convenience, the final cleaned dataset (`cleaned_titanic.csv`) and my completed Excel workbook (with all pivot tables and charts) are included in the project folder. These can be reviewed directly without re-running the full SQL and cleaning process. I have done this so viewers can see my full work if they do not want to replicate the process entirely. Thank you.

**Goal:** Demonstrate end-to-end data work with SQL cleaning/prep and Excel pivot analysis on the classic Titanic dataset—no machine learning.

## Project Flow
1. Download data from Kaggle (see `data/README.md`).
2. Load into PostgreSQL (`sql/01_create_table.sql`, `sql/02_import_data.sql`).
3. Clean and prep in SQL (`sql/03_cleaning.sql`).
4. Export to CSV and analyze with Excel/Google Sheets (pivots + charts).
5. Summarize insights (below) and include visuals.

## Environment
- PostgreSQL 14+ (any recent is fine)
- psql or pgAdmin
- Excel / Google Sheets

## Key SQL Decisions
- **Age nulls:** imputed with overall mean, rounded to 1 decimal.
- **Port nulls:** 2 rows deleted (tiny proportion).
- Kept core columns only: PassengerId, Survived, Pclass, Name, Sex, Age, SibSp, Parch, Fare, Embarked.

  
## Reproduce SQL

1. **Setup**
   - Download and unzip the project folder.  
   - Inside, you’ll find all required files, including the already-cleaned `cleaned_titanic.csv` and the final Excel analysis.  
   - Move `train_titanic.csv` to an accessible location (recommended: `C:\CSV_DATA\`) since pgAdmin/Postgres may not allow access to Downloads or Desktop folders.  

2. **Initialize Database**
   - Launch PostgreSQL (pgAdmin4 or your preferred tool).  
   - Run `00_create_rawdata_table_titanic.sql` to create the raw data table.  
   - Run `0.5_import_rawdata_titanic.sql` to import the Kaggle Titanic dataset into that raw table.  

3. **Create and Populate Refined Table**
   - Run `01_create_table_titanic.sql` to define the refined (cleaned) table schema.  
   - Run `02_import_data_titanic.sql` to transfer selected fields from the raw table into the refined table.  

4. **Clean and Export**
   - Run `03_cleaning_data_titanic.sql` to handle null values, rounding, and dropping rows as necessary.  
   - Run `04_export_data_titanic.sql` to export the final cleaned dataset as a CSV.  
   - (This exported file matches the included `cleaned_titanic.csv`.)  


## Reproduce Excel Analysis

Follow these steps to recreate the pivot tables and charts from the cleaned dataset:

1. **Open Excel (or Google Sheets)**  
   - Import the cleaned Titanic CSV (`cleaned_titanic.csv`) that was exported from PostgreSQL.

2. **Insert Pivot Table**  
   - Select the entire dataset.  
   - Go to `Insert > PivotTable`.  
   - Place each pivot on its own worksheet for clarity.

---

### Pivot Table 1: Survival Rate by Class
- **Rows:** `pclass`  
- **Values:** `survived` → set to **Average**  
- **Format:** Display values as **Percentage**  
- **Chart:** Clustered column or line chart.

---

### Pivot Table 2: Survival Rate by Sex
- **Rows:** `sex`  
- **Values:** `survived` → **Average**  
- **Format:** Percentages  
- **Chart:** Simple bar chart (male vs female).

---

### Pivot Table 3: Survival Rate by Family Size
1. **Create a new column** in the dataset:  
   `family_size = sibsp + parch + 1`  
   (represents siblings/spouses + parents/children + self).  
2. Build pivot table:  
   - **Rows:** `family_size`  
   - **Values:** `survived` → **Average**  
   - **Format:** Percentages  
   - **Chart:** Line chart (to show trend of survival rate by family size).

---

### Pivot Table 4: Survival Rate by Class × Gender
- **Rows:** `pclass`  
- **Columns:** `sex`  
- **Values:** `survived` → **Average**  
- **Format:** Percentages  
- **Chart:** Clustered bar chart (compare men vs women survival within each class).

---

these 4 pivot tables will be of increasing difficulty, showing a range of ability and are the backbone of the project.


## Next Steps

While this project focused on cleaning the Titanic dataset in SQL and analyzing it through Excel pivot tables, there are several ways to expand the analysis:

1. **Deeper SQL Analysis**  
   - Write queries directly in PostgreSQL to calculate survival rates by class, gender, and family size without relying solely on Excel.  
   - Use aggregate functions (`COUNT`, `AVG`, `GROUP BY`) to replicate and verify the pivot table results.  
   - Explore joins and subqueries to analyze additional relationships (e.g., survival by fare ranges, or multi-factor combinations).  

2. **Data Validation**  
   - Compare SQL-based survival rates with the Excel pivot table outputs to ensure consistency.  
   - Use SQL window functions (e.g., `ROW_NUMBER`, `RANK`) to explore survival ranking across different groups.  

3. **Future Changes**
   - I plan to revisit this project to expand the SQL analysis, moving beyond data cleaning into more advanced queries and insights.  
   - As I gain experience with business-focused tools (e.g., Tableau, Power BI), I may integrate them into the workflow to enhance visual storytelling and improve the communication of results.

*Expanding the project with SQL analysis will demonstrate proficiency beyond data cleaning — showing strong querying skills, the ability to replicate business insights, and readiness for real-world data analytics workflows.*

