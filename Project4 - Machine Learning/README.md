# Machine Learning Project
# 🏦 Bank Branch Clustering using K-Means  
*An unsupervised learning project for pattern discovery in banking operations*

---

## 🧩 Overview  
This notebook — **Machine Learning.ipynb** — demonstrates how to apply **K-Means clustering** to group bank branches based on their operational features.  
Using data such as demand drafts, withdrawals, deposits, and customer walk-ins, this project identifies meaningful clusters to help in performance benchmarking and strategic decision-making.

---

## 🎯 Objectives  
- Preprocess banking data and handle missing values.  
- Scale features for accurate clustering results.  
- Determine the optimal number of clusters using the **Elbow Method**.  
- Apply **K-Means clustering** to segment bank branches.  
- Visualize and interpret the clustering results effectively.  

---

## 🗂️ Notebook Structure  
| Section | Description |
|----------|-------------|
| **1️⃣ Data Loading** | Import and inspect the bank dataset (`bank.csv`). |
| **2️⃣ Data Preprocessing** | Handle missing values and scale data using `StandardScaler`. |
| **3️⃣ Feature Selection** | Drop irrelevant features (e.g., branch IDs). |
| **4️⃣ Elbow Method** | Determine the optimal number of clusters via WCSS plot. |
| **5️⃣ K-Means Model** | Apply K-Means and assign clusters to branches. |
| **6️⃣ Visualization** | Plot the Elbow curve and analyze cluster separation. |
| **7️⃣ Insights & Discussion** | Interpret findings and suggest business implications. |

---

## ⚙️ Requirements  

Make sure the following packages are installed before running the notebook:

```bash
python >= 3.8
pandas
scikit-learn
matplotlib
seaborn
jupyter
````

To install all dependencies:

```bash
pip install pandas scikit-learn matplotlib seaborn jupyter
```

---

## 🚀 Getting Started

1. **Clone this repository**

   ```bash
   git clone https://github.com/Hari-Krishnan-Krius/AI-Project.git
   cd "AI-Project/Project4 - Machine Learning/Code"
   ```

2. **Open the notebook**

   ```bash
   jupyter notebook "Machine Learning.ipynb"
   ```

3. **Run all cells sequentially** to reproduce results and plots.

---

## 📊 Dataset Description

The dataset (`bank.csv`) includes:

| Feature                    | Description                       |
| -------------------------- | --------------------------------- |
| **Bank**                   | Unique identifier for each branch |
| **DD (Demand Drafts)**     | Number of demand drafts issued    |
| **Withdrawals**            | Total number of withdrawals       |
| **Deposits**               | Total number of deposits          |
| **Branch Area (sq. ft.)**  | Physical area of the branch       |
| **Average Daily Walk-ins** | Average number of daily customers |

---

## 🧠 Learning Outcomes

By completing this notebook, you will learn to:

* Apply **unsupervised learning** using K-Means.
* Use **data scaling** and **feature engineering** effectively.
* Implement the **Elbow Method** for model optimization.
* Interpret clustering results for actionable insights.

---

## 💡 Highlights

* 🧩 Step-by-step guide to applying K-Means in Python.
* 📊 Visual demonstration of the Elbow Method.
* ⚙️ Hands-on preprocessing and feature selection.
* 🧠 Real-world use case for clustering in the banking domain.

---

## 🪪 License

This project is released for educational purposes.

---
