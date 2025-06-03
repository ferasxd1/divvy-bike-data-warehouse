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
- **Fact Table**: `fact_trip`
- **Dimension Tables**: `dim_rider`, `dim_station`, `dim_payment`

Relationships are based on rider ID, station ID, and payment ID to enable analytic queries across time, usage, and demographics.

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

## 👨‍💻 Author

**Feras Zamil Khairallah**  
AI Graduate | Data Engineer | Azure Enthusiast  
📍 University of Jeddah  
🛠️ Projects in ML, DL, Data Warehousing

---

## 🔗 License

This project is for educational purposes as part of a data engineering course.
