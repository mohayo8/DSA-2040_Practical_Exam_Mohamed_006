-- Dimension: Customer
CREATE TABLE CustomerDim (
    CustomerID INTEGER PRIMARY KEY,
    CustomerName TEXT,
    Location TEXT,
    Gender TEXT
);

-- Dimension: Product
CREATE TABLE ProductDim (
    ProductID INTEGER PRIMARY KEY,
    ProductName TEXT,
    Category TEXT,
    UnitPrice REAL
);

-- Dimension: Time
CREATE TABLE TimeDim (
    TimeID INTEGER PRIMARY KEY,
    Date TEXT,
    Month INTEGER,
    Quarter INTEGER,
    Year INTEGER
);

-- Fact Table: Sales
CREATE TABLE SalesFact (
    SaleID INTEGER PRIMARY KEY AUTOINCREMENT,
    CustomerID INTEGER,
    ProductID INTEGER,
    TimeID INTEGER,
    Quantity INTEGER,
    TotalSales REAL,
    FOREIGN KEY (CustomerID) REFERENCES CustomerDim(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES ProductDim(ProductID),
    FOREIGN KEY (TimeID) REFERENCES TimeDim(TimeID)
);
