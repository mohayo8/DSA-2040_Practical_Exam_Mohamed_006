# DSA-2040_Practical_Exam_Mohamed_006
### *Repository Overview*

This repository is a complete showcase of practical data science and analytics workflows for the DSA2040 course. It is organized into several Jupyter notebooks, each demonstrating a different aspect of the data pipeline and machine learning process. Below is a detailed breakdown of the contents of this repo:

---
### **Data Warehouse Schema Overview**

This SQL file defines the schema for a star-structured data warehouse supporting retail analytics. It includes three dimension tables—CustomerDim, ProductDim, and TimeDim—each capturing descriptive attributes about customers, products, and time periods. The central fact table, SalesFact, records individual sales transactions, referencing the dimension tables via foreign keys. This design enables efficient querying for business intelligence, such as analyzing sales by customer, product, or time, and supports roll-up and drill-down operations for deeper insights.

---
### **Star schema design image**
the image shows the design and diagram of the star schema that follows the design below:

| Table Name   | Column Name      | Description / Type                   |
|--------------|------------------|--------------------------------------|
| **SalesFact**| SaleID (PK)      | Primary Key (auto-increment)         |
|              | TotalSales       | Measure: Total sales amount          |
|              | Quantity         | Measure: Quantity sold               |
|              | CustomerID (FK)  | Foreign Key to CustomerDim           |
|              | ProductID (FK)   | Foreign Key to ProductDim            |
|              | TimeID (FK)      | Foreign Key to TimeDim               |
| **CustomerDim** | CustomerID(PK) | Primary Key                         |
|              | CustomerName     | Customer name                        |
|              | Location         | City/Country                         |
|              | Gender           | Optional demographic                 |
| **ProductDim** | ProductID (PK)   | Primary Key                        |
|              | ProductName      | Product name                         |
|              | Category         | Electronics, Clothing, etc.          |
|              | UnitPrice        | Price per unit                       |
| **TimeDim**  | TimeID (PK)      | Primary Key                          |
|              | Date             | Date                                 |
|              | Month            | Month (integer)                      |
|              | Quarter          | Quarter (integer)                    |
|              | Year             | Year (integer)                       |


#### **ETL and Data Warehousing**
- **Configuration and Setup:** Imports essential libraries (pandas, sqlite3, datetime) and sets up file paths and date constants for reproducible ETL operations.
- **Extraction:** Loads raw data from Excel, checks for missing values, and ensures correct data types (especially for dates).
- **Transformation:** Cleans the data by filtering invalid rows, calculates new features (e.g., total sales), and creates dimension tables for customers and time. Each step is explained with markdown cells.
- **Load:** Saves the transformed fact and dimension tables into a SQLite database, enabling efficient querying and reporting.
- **ETL Summary:** Prints row counts for each table to verify successful extraction, transformation, and loading.
- **Year and Month Extraction:** Adds time-based columns to support time-series analysis.
- **Roll-Up and Drill-Down:** Aggregates sales by country and by country/month, supporting both high-level and detailed analysis.
- **Data Slicing:** Filters for specific countries (e.g., United Kingdom) to enable focused business insights.
- **Visualization:** Plots sales by country to visually highlight top markets.

---

#### **Preprocessing and Exploration (Iris Dataset)**
- **Imports and Setup:** Loads libraries, sets random seeds, and prepares folders for saving outputs.
- **Data Loading:** Loads the Iris dataset, renames columns, and adds readable species names.
- **Missing Value Check and Feature Preparation:** Checks for missing data, scales features, and encodes labels for modeling.
- **Summary Statistics:** Computes and saves descriptive statistics for all features.
- **Pairplot Visualization:** Visualizes feature relationships and class separability.
- **Correlation Heatmap:** Shows feature correlations to inform feature selection.
- **Boxplot Visualization:** Highlights feature distributions and potential outliers.
- **Train/Test Split:** Splits the data for robust model evaluation.

---

#### **Clustering and Classification**
- **K-Means Clustering:** Applies K-Means with different k values, evaluates cluster quality using Adjusted Rand Index, and visualizes clusters.
- **Elbow Method:** Plots WCSS to help select the optimal number of clusters.
- **Cluster Visualization:** Shows how clusters align with actual species.
- **Save Clustered Dataset:** Stores results for further analysis.
- **Decision Tree and KNN Classification:** Trains and evaluates both models, prints performance metrics, and visualizes decision boundaries and confusion matrices.
- **Model Comparison:** Compares classifiers and explains results.

---

#### **Association Rule Mining**
- **Synthetic Data Generation:** Creates realistic basket data with injected co-occurrence patterns.
- **One-Hot Encoding:** Prepares data for the Apriori algorithm.
- **Apriori and Rule Extraction:** Finds frequent itemsets and strong association rules.
- **Rule Sorting and Display:** Highlights the most significant associations.
- **Save Data:** Exports synthetic data for reproducibility.

---

#### **Documentation and Analysis**
- Every notebook is richly annotated with markdown cells that explain the purpose, logic, and results of each code cell. Summary reports discuss insights (such as top-selling countries, cluster quality, and model performance), real-world applications (like customer segmentation and market basket analysis), and the impact of using synthetic data.

---
#### **Saved Images and Visualizations**
- Throughout the notebooks, key plots and visualizations—such as pairplots, boxplots, heatmaps, confusion matrices, and sales bar charts—are generated and saved in the `images` folder. These images provide visual summaries of data distributions, feature relationships, clustering results, classification performance, and sales trends. Saving these figures ensures results are documented for reporting, presentations, and further analysis, supporting clear communication of insights and findings.

---

### How to Run the Contents of This Repository

To use and explore the notebooks and scripts in this repository, follow these steps:

1. **Clone or Download the Repository**
   - Download the repository as a ZIP file and extract it, or clone it using:
     ```
     git clone <repository-url>
     ```

2. **Set Up Your Environment**
   - Ensure you have Python 3.x installed.
   - Install required packages using pip:
     ```
     pip install pandas numpy matplotlib seaborn scikit-learn mlxtend jupyter
     ```
   - For database operations, SQLite is included with Python, but you may need to install `sqlite3` if using a minimal environment.

3. **Open Jupyter Notebook**
   - Launch Jupyter Notebook in the repository folder:
     ```
     jupyter notebook
     ```
   - Open the desired notebook (e.g., `etl_retail.ipynb`, `preprocessing_iris.ipynb`, etc.).

4. **Run Each Notebook**
   - Step through each cell in order, reading the markdown explanations and executing the code cells.
   - For ETL notebooks, ensure the required data files (e.g., `Online Retail.xlsx`) are present in the correct location.
   - For association rule mining, synthetic data is generated automatically.
   - Visualizations and outputs will be saved in the `images` folder as you run the notebooks.

5. **Explore Outputs**
   - Review saved images and results in the `images` folder.
   - Check the SQLite database file (`retail_dw.db`) for loaded tables.
   - Use the markdown summaries and analysis cells for interpretation and reporting.

6. **Modify and Experiment**
   - You can edit code cells to try different parameters, algorithms, or visualizations.
   - Use the structure and explanations as a template for your own data science projects.


---
### **Below are the imports and function necessary to run the codes**
---
### Imports and Functions Used in This Repository

#### **Imports**
Across the notebooks in this repository, the following Python libraries are commonly imported:

- **pandas:** For data loading, cleaning, manipulation, and analysis.
- **numpy:** For numerical operations and array handling.
- **matplotlib & seaborn:** For creating visualizations such as bar charts, pairplots, boxplots, heatmaps, and confusion matrices.
- **scikit-learn:** For machine learning tasks including clustering (KMeans), classification (Decision Tree, KNN), train/test splitting, scaling, and evaluation metrics (accuracy, precision, recall, F1-score, Adjusted Rand Index).
- **mlxtend.frequent_patterns:** For association rule mining using the Apriori algorithm.
- **sqlite3:** For interacting with SQLite databases during the ETL and data warehousing process.
- **random:** For generating synthetic data in association rule mining tasks.
- **os:** For file and directory management, such as saving images and outputs.

#### **Functions**
The repository features several custom functions, each serving a specific purpose in the data pipeline:

- **extract_data(file_path):** Loads raw data from Excel, handles missing values, and ensures correct data types.
- **transform_data(df):** Cleans and transforms the dataset, calculates new features, and creates dimension tables for data warehousing.
- **load_to_sqlite(df_fact, df_customer, df_time, db_file):** Loads fact and dimension tables into a SQLite database for efficient querying.
- **run_full_etl(df_raw):** Executes the full ETL workflow and prints summary statistics for verification.
- **train_test_split(X, y):** Splits data into training and test sets, preserving class balance.
- **train_decision_tree(X_train, y_train):** Trains a Decision Tree classifier.
- **train_knn(X_train, y_train):** Trains a K-Nearest Neighbors classifier.
- **evaluate_model(model, X_test, y_test):** Computes and prints performance metrics for classification models.
- **plot_confusion_matrix(y_true, y_pred):** Visualizes confusion matrices for model evaluation.
- **generate_synthetic_basket_data():** Creates synthetic transaction data for association rule mining.
- **apply_apriori(df):** Applies the Apriori algorithm to find frequent itemsets and association rules.

These imports and functions work together to support the full data science workflow, from data extraction and cleaning to advanced analytics, modeling, and visualization.

### Datasets Used in This Repository

This repository utilizes several datasets to demonstrate data science workflows and machine learning techniques:

- **Online Retail Dataset:**  
  Used in the ETL and data warehousing notebooks, this dataset contains transactional sales data from an online retailer. It includes information such as invoice numbers, product details, quantities, unit prices, customer IDs, and invoice dates. The dataset is used to build a star schema data warehouse and perform business intelligence analyses.

- **Iris Dataset:**  
  A classic dataset in machine learning, the Iris dataset contains measurements of sepal length, sepal width, petal length, and petal width for three species of iris flowers. It is used for preprocessing, exploratory data analysis, clustering, and classification tasks.

- **Synthetic Basket Data:**  
  For association rule mining, synthetic transaction data is generated to simulate market basket analysis. This data consists of randomly created shopping baskets with injected co-occurrence patterns to mimic real-world purchasing behavior.

