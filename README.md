# Automated-Restaurant-Data-Reporting-System-ARDS-
Automates restaurant data reporting with SQL Server &amp; Power BI. CSV files are automatically imported and transformed daily, generating fresh reports for data-driven insights. Sample data &amp; code for stored procedure &amp; view included.

# Reporting Automation Project

## Overview
This repository showcases a robust reporting automation project designed to streamline the analysis of restaurant data using SQL Server, SSMS, T-SQL, and PowerBI. The project revolves around processing and visualizing key metrics extracted from CSV files containing restaurant information.

### Data Description
The raw data includes a comprehensive set of restaurant details such as reservation IDs, restaurant names, geographical information (subzone and zone), key account manager (KAM), primary cuisine, delivery ratings, order values (OV), discount information, and user activity across different meal times.

### Project Significance
This initiative aims to automate the import and analysis of restaurant data, providing stakeholders with a centralized and up-to-date view of crucial performance indicators. The PowerBI dashboard serves as a dynamic and interactive tool for gaining insights into various aspects of restaurant operations.

### How the Dashboard Helps
- **Performance Monitoring:** Track overall order values, discounts, and user activity to assess the restaurant's performance.
- **Segment Analysis:** Leverage the 'SegmentWiseData' view to delve deeper into specific segments, aiding in targeted decision-making.
- **Time-of-Day Insights:** Analyze user activity and order values across different meal times, enabling strategic planning for promotions or optimizations.

### Use Case Scenarios
- **Marketing Strategy:** Tailor marketing efforts based on user behavior, preferences, and peak order times.
- **Operational Efficiency:** Identify trends to enhance operational efficiency during specific meal periods.
- **Financial Decision-Making:** Make informed decisions on discounts and promotions by understanding overall and segment-specific performance.


## Project Components

### 1. Data Import
- Raw restaurant data is stored in CSV files within a designated folder. The files follow a naming convention with increasing indexing (e.g., oct_funnel 1, oct_funnel 2).
- The T-SQL code includes a stored procedure named `DataImport` which utilizes the `BULK INSERT` method to loop through all files in the folder, importing data into a table created in the SQL Server database.
- The `DataImport` procedure is scheduled to run daily as a SQL Server job, ensuring that new files are automatically imported into the database.

### 2. PowerBI Dashboard
- The imported data is visualized through a PowerBI dashboard, providing a user-friendly interface for data analysis.
- The dashboard includes card visuals with conditional formatting, stacked column charts, table visuals, slicer, and a refresh filter button for enhanced interactivity.

### 3. View Creation
- A SQL Server view named `SegmentWiseData` is created using the imported data. This view is then imported into PowerBI for additional insights.

### Repository Contents
1. **CSV Files:**
    - `oct_funnel_sample.csv`: Example raw data file for reference.
    - `stored_procedures_and_views.sql`: SQL script file with codes to create stored procedures and views.

2. **Screenshots:**

   - PowerBI Dashboard: ![WhatsApp Image 2024-01-13 at 1 44 59 AM](https://github.com/AritraRick/Automated-Restaurant-Data-Reporting-System-ARDS-/assets/156344506/81150394-f419-4aed-bf3a-1006a3e92fe8)
   - Folder Path: ![WhatsApp Image 2024-01-13 at 1 56 39 AM (1)](https://github.com/AritraRick/Automated-Restaurant-Data-Reporting-System-ARDS-/assets/156344506/44a16f26-ce79-4ad3-be66-4ed95c417080)

## Getting Started
1. Clone the repository to your local machine.
2. Execute the SQL script in `stored_procedures_and_views.sql` to create necessary stored procedures and views.
3. Configure the SQL Server job to run the `DataImport` procedure on a daily schedule.

Feel free to explore the PowerBI dashboard for interactive data analysis.


**Note:** Ensure proper setup and connection to SQL Server before running the scripts.

Happy analyzing!
