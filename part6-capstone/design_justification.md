## Storage Systems

The architecture uses multiple storage systems optimized for different workloads.

For transactional patient data, an OLTP database such as PostgreSQL is used. This ensures ACID compliance, which is critical in healthcare systems where data consistency and accuracy are essential.

A Data Lake is used to store raw and unstructured data such as doctor notes, PDFs, and ICU device logs. This allows flexibility in storing diverse data formats and supports future machine learning use cases.

For reporting and analytics, a Data Warehouse is used. It stores cleaned and structured data optimized for query performance. This enables efficient generation of monthly reports such as bed occupancy and department-wise costs.

A Vector Database is used to support natural language queries. Patient records and documents are converted into embeddings and stored here. This allows doctors to query patient history in plain English, retrieving semantically relevant results rather than relying on keyword matching.

For real-time ICU data, a streaming system feeds into the data lake and monitoring dashboards, ensuring low-latency data availability.

---

## OLTP vs OLAP Boundary

The OLTP system consists of the hospital’s transactional database, where real-time patient data such as admissions, treatments, and billing are recorded. This system prioritizes fast inserts and updates.

The OLAP system begins once data is extracted from the OLTP database via ETL pipelines and loaded into the Data Warehouse. Here, data is transformed and aggregated for analytical purposes such as reporting and trend analysis.

Thus, the boundary lies at the ETL layer, where operational data transitions into analytical data. This separation ensures that reporting workloads do not impact transactional performance.

---

## Trade-offs

One significant trade-off in this design is increased system complexity due to multiple storage systems. Managing a Data Lake, Data Warehouse, Vector Database, and streaming pipeline requires higher operational effort and expertise.

However, this trade-off is mitigated by using integrated platforms such as Data Lakehouse architectures or managed cloud services. These reduce operational overhead while maintaining scalability and flexibility.

Additionally, proper data governance and orchestration tools can be implemented to manage data flow and ensure consistency across systems.