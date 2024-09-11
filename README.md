# Project Purpose

This project showcases a basic Data Engineering Pipeline built using Azure to process real-world data. The goal is to demonstrate how to build a scalable and automated data pipeline, transforming Tokyo 2021 Olympics data into actionable insights. By leveraging Azure services the project delivers a practical implementation of data engineering concepts such as data ingestion, transformation, and analysis.

This project focuses on pipeline implementation rather than heavy data transformation, as the data was already relatively clean, but it serves to highlight how these services integrate.

Original dataset link: [2021 Olympics in Tokyo](https://www.kaggle.com/datasets/arjunprasadsarkhel/2021-olympics-in-tokyo)

# Resources 

### Dataset Used

**Dataset Name:** [Tokyo 2021 Olympics Dataset](https://www.kaggle.com/datasets/arjunprasadsarkhel/2021-olympics-in-tokyo)  
**Location:** Kaggle  
**Purpose:**  
This dataset contains information about athletes, events, medals, and participating countries from the Tokyo 2021 Olympics. The dataset was used as the source data for the entire pipeline. The raw data was ingested from this dataset into Azure Data Lake Storage via Azure Data Factory. It was then transformed using Databricks and Apache Spark, and finally analyzed using SQL queries in Azure Synapse Analytics.

The dataset includes:
- **Athletes**: Information on each athlete, including their name, nationality, and discipline.
- **Coaches**: Details on coaches for different teams.
- **Medals**: A breakdown of the medals won by various countries in different events.
- **Gender Entries**: Data on gender distribution across different disciplines.
- **Teams**: Team information, including the countries and events they participated in.


### Databricks Python Notebook
  **File Name:** [Tokyo Olympics Transformation.ipynb](https://github.com/Reporiff/Tokyo-Olympics-DE/blob/main/Tokyo%20Olympics%20Transformation.ipynb)  
  **Location:** Used in Azure Databricks  
  **Purpose:** This Python notebook contains the Apache Spark code used for transforming the Tokyo 2021 Olympics dataset. The notebook was executed in the Databricks environment, where Spark was used for distributed data processing.

### Synapse SQL Script
**File Name:** [SQL Analytics Script.sql](https://github.com/Reporiff/Tokyo-Olympics-DE/blob/main/SQL%20Analytics%20Script.sql)  
**Location:** Used in Azure Synapse Analytics  
**Purpose:** This SQL script was executed in Azure Synapse Analytics to run queries on the transformed data. The queries included aggregating medal counts by country, analyzing athlete performances by discipline, and generating insights on gender distribution across different sports. The script was designed to leverage the scale of Synapse for handling large datasets efficiently.


# Technologies Used

Azure Data Factory: For ingesting data from external APIs and GitHub repositories.

Azure Data Lake Storage: Storing raw and transformed data.

Azure Databricks (Apache Spark): Data cleaning, transformation, and processing (used to showcase integration).

Azure Synapse Analytics: For querying and analyzing transformed data.

Tableau: For visualization.

# Architecture Diagram

![Architecture Diagram](https://github.com/Reporiff/Tokyo-Olympics-DE/blob/main/Architecture%20Overview.png)

# Process Overview

### 1. Data Extraction (Azure Data Factory)
- Ingestion: Data was pulled from a GitHub repository containing CSV files using Azure Data Factory.
- Linked Services: The connection was established between Data Factory and Azure Data Lake Storage for seamless data movement.
- Raw Data Storage: The ingested data was saved in Azure Data Lake under the raw directory.
  
### 2. Data Storage (Azure Data Lake Storage)
- Raw Data: Data from the external source was stored in its raw form in Azure Data Lake.
- Transformed Data: After minor transformations in Databricks, the processed data was saved back to Azure Data Lake in the transformed directory.
  
### 3. Data Transformation (Azure Databricks)
- Although most of the transformation could have been handled in Azure Synapse Analytics, Azure Databricks was incorporated to demonstrate the integration of Apache Spark within the project pipeline.
- Data Cleaning:
  - Type Conversions: Ensured correct data types (e.g., converting string columns to integers for medal counts).
  - Duplicate Removal: Ensured no duplicate records were present.
  - Column Renaming: Enhanced readability and clarity of column names.
- Output: Cleaned data was written back to Azure Data Lake.
  
### 4. Data Analysis (Azure Synapse Analytics)
- SQL Queries: Queries were run to find insights, such as:
  - Top countries with the most gold medals.
  - Athlete performance breakdowns by discipline.
  - Gender Distribution by Sport.  
- Scalability: Azure Synapse enabled scaling queries for larger datasets.
  
### 5. Data Visualization
Tools Used: Insights can be visualized using Tableau.

# Challenges Faced

### 1. Authentication and Role Management:
- Encountered permission and authentication issues while connecting different Azure services (e.g., Data Factory to Databricks). This required configuring IAM roles and understanding Azure’s role-based access control.
- Note: Keys and authentication credentials were removed from this repository due to privacy concerns.
  
### 2. Cluster Quota Exceeded:
- The cluster quota was exceeded while working with Azure Databricks because I attempted to use the wrong cluster type for what was allowed in my region. This challenge required adjusting the cluster type and managing quotas to ensure sufficient compute resources were available for the project.

### 3. Schema Mismatches:

- Columns with inconsistent data types (e.g., medals as strings) required data type conversions before analysis.

### 4. Data Partitioning:

- Spark’s default behavior of partitioning the data into multiple files needed careful management to avoid scattered data outputs during the transformation process.

# Achievements

- End-to-End Pipeline: Built and executed a fully functional data pipeline that extracts, transforms, and loads data using Azure’s ecosystem.
- Data Cleaning and Transformation: Applied Apache Spark transformations to clean and process raw data, ensuring accuracy in analysis.
- Scalable Analytics: Used Azure Synapse Analytics to query and generate insights from the transformed data, allowing for efficient analysis at scale.

# Conclusion

This project serves as a comprehensive demonstration of building a robust data engineering pipeline using Azure Cloud services. It highlights the flexibility and integration capabilities of Azure's services, even though most transformations could have been performed in Azure Synapse Analytics alone. Using Azure Databricks shows how complex integrations can be achieved in a real-world project scenario.

# License

This project is licensed under the MIT License.





