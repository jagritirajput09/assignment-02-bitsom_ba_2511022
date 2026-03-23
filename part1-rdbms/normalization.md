## Anomaly Analysis

### Insert Anomaly
In the dataset, product details such as product_id and product_name appear only within order records (e.g., ORD1027, ORD1114).

If a new product (e.g., "Wireless Mouse") needs to be added but has not yet been ordered, it cannot be inserted without creating a dummy order record.

Thus, independent insertion of product data is not possible.
---

### Update Anomaly
Customer information is repeated across multiple rows.

For example:
Customer ID C006 appears in multiple orders:
ORD1153, ORD1118, ORD1083, ORD1162, ORD1061

If the customer's city changes from Delhi to Mumbai, all rows must be updated.

If only one row is updated to Mumbai it will result in inconsistent data
---

### Delete Anomaly
Customer information is stored along with order records.

For example:
Order ID ORD1027 contains details of customer C001.

If this order is deleted and it is the only order for that customer, all customer-related information (name, email, city) is also lost.