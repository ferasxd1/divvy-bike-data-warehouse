# 🚴 Building an Azure Data Warehouse for Bike Share Data Analytics

This project simulates a production analytics pipeline for bike share data using Azure services. It extracts data from PostgreSQL, stages it in Azure Blob Storage, and loads it into an external data warehouse (Synapse Analytics) using a star schema model.

---

## 🧩 Project ERD: Relational Entity-Relationship Diagram

The following Entity-Relationship Diagram (ERD) represents the original schema for the Divvy bikeshare dataset. It includes entities such as `Rider`, `Account`, `Trip`, `Payment`, and `Station`, which serve as the basis for designing the star schema used in this data warehouse project.

<img width="389" alt="Image" src="https://github.com/user-attachments/assets/709f0484-8135-4040-ba4c-1d7eefac94c1" />


---

## 🛠️ Tools & Technologies

- **PostgreSQL** (Azure Database for PostgreSQL)
- **Azure Blob Storage**
- **Azure Synapse Analytics**
- **SQL (Serverless SQL Pool)**
- **Python** (for initial data push)
- **GitHub** (for version control)

---

## 🔄 ETL Pipeline Summary

1. **Extract:**  
   Data was initially loaded into a PostgreSQL database using a Python script (`ProjectDataToPostgres.py`).

2. **Load:**  
   Using Azure Synapse’s Ingest Wizard, the data was copied from PostgreSQL to Azure Blob Storage.

3. **External Staging Tables:**  
   External tables were created in Synapse referencing the CSVs in Blob Storage (4 tables total: `rider`, `payment`, `station`, `trip`).

4. **Transform to Star Schema:**  
   Final star schema tables were created using `CREATE EXTERNAL TABLE AS SELECT (CETAS)` from the staging tables.

---

## ⭐ Star Schema Design

The schema includes:
- **Fact Tables**: `fact_trip`, `fact_payment`
- **Dimension Tables**: `dim_rider`, `dim_station`, `dim_date`

Relationships are based on `rider_id`, `station_id`, and `time_id` to enable analytic queries across time, usage, and demographics.
![Image](https://github.com/user-attachments/assets/b4b9d910-5b0d-4aba-90f4-5f1c9c900c34)

---

## 📊 Sample Analysis (Optional)

If included, the `DataAnalysis.sql` file provides example queries for:
- Total trips per month
- Average payment per user
- Most popular stations

---

## 📦 Submission Checklist

- ✅ Star Schema PDF
- ✅ Blob Storage screenshot (Proof of Extract)
- ✅ External Table Scripts (Proof of Load)
- ✅ CETAS Scripts (Star Schema)
- ✅ DataAnalysis.sql (Optional)

---

## 🖼️ Project Execution Screenshots

The following screenshots demonstrate key steps I personally completed during the development of this Azure-based data warehouse project:

### ✅ 1. PostgreSQL to Blob Copy Wizard
Proof of successful copy from Azure Database for PostgreSQL to Azure Blob Storage using Azure Synapse Ingest Wizard.
<img width="959" alt="Image" src="https://github.com/user-attachments/assets/3950a2bd-4dd0-49d6-b0b8-7162d5a244aa" />

---

### ✅ 2. Azure Synapse Studio Interface
A snapshot of the Synapse workspace showing workspace, linked services, and data pipeline execution.
<img width="949" alt="Image" src="https://github.com/user-attachments/assets/5be7257a-cc2e-4e69-aa1b-0c77dae4004c" />

---

### ✅ 3. External Tables Load
Illustrates the creation of external tables referencing files from Blob Storage.
<img width="950" alt="Image" src="https://github.com/user-attachments/assets/c1c598f7-8a59-414e-bed1-beacac597e8c" />

---

### ✅ 4. Blob Storage – Extract Proof
This screenshot confirms that the source CSV files (rider, trip, payment, station) were successfully exported from PostgreSQL and uploaded into Azure Blob Storage.
<img width="952" alt="Image" src="https://github.com/user-attachments/assets/59d73830-5aed-40a2-bcbf-694fa09106e8" />

---

## 👨‍💻 Author

**Feras Zamil Khairallah**  
AI Graduate | Data Engineer | Azure Enthusiast  
📍 University of Jeddah  
🛠️ Projects in ML, DL, Data Warehousing

---

## 🔗 License

This project is for educational purposes as part of a data engineering course.
