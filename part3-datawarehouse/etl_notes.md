## ETL Decisions

ETL stands for Extract, Transform, Load—it's the process of pulling data from sources, cleaning it up, and putting it into the warehouse. Here are some key decisions we made during the transform step to make sure our data is clean and useful.

### Decision 1 — Date Standardization

Problem: Our data came from different places, so dates were all over the place. Some were like "12/25/2023", others "25-Dec-2023", and a few in "2023-12-25". This inconsistency makes it hard to sort, filter, or compare dates properly.

Why it matters: In a data warehouse, dates are key for reporting—like monthly sales or trends over time. If dates aren't uniform, queries could give wrong results or miss data.

Resolution: We wrote a script to convert everything to a standard format: YYYY-MM-DD. For example, "12/25/2023" became "2023-12-25". This way, all dates follow the same pattern, making analysis easier and avoiding confusion.

### Decision 2 — Null Handling

Problem: Lots of missing values in the data. Some rows had empty fields for things like customer names or sales amounts. This could be because of incomplete records or errors during collection.

Why it matters: Nulls (missing values) can mess up calculations. For instance, averaging sales with nulls might give inaccurate numbers, or reports might skip important data. We needed to handle them so the warehouse has reliable info.

Resolution: For critical fields like sales revenue, we replaced nulls with a default value, like 0, assuming no sale. For less important ones, like optional notes, we just removed the rows if they were mostly empty. This kept the data clean without losing too much useful info.

### Decision 3 — Category Cleaning

Problem: Product categories were entered inconsistently—some in uppercase like "ELECTRONICS", others in lowercase "electronics", or mixed "Electronics". This made grouping and filtering tricky.

Why it matters: Categories help in summarizing data, like total sales by product type. If "Electronics" and "electronics" are treated as different, reports would split the same category, leading to fragmented insights.

Resolution: We standardized everything to uppercase. So "electronics" or "Electronics" all became "ELECTRONICS". This ensures consistent grouping and makes queries simpler. We could have chosen lowercase, but uppercase felt standard for our setup.