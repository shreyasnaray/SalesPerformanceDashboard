README: Retail Store Performance Analysis

Diagnosing Store Performance: Sales, Traffic, Conversion, Inventory, and Staffing Analysis

Business Case
A retail analytics team wants to understand why some stores are outperforming others and why some stores are underperforming. The company has weekly store-level data across five stores and three regions. The goal is to identify what is driving sales performance: foot traffic, conversion rate, average order value, inventory availability, promotions, staffing, or regional differences.

Which stores are performing well, which stores are struggling, and what operational levers should the business use to improve sales?

This analysis uses store-level weekly data to calculate key retail metrics such as conversion rate, sales per employee, sales per visitor, average sales, traffic, transactions, and inventory availability.

Dataset Structure

Each row represents a: store × week observation. The dataset contains 25 rows: 5 stores, 5 weeks, 3 regions and weekly sales and operating metrics.

Method
Core Retail Metrics
Conversion Rate is Percent of visitors who bought something, Sales per employee is Labor productivity, and Sales per visitor is Revenue generated per visitor. These metrics are powerful because they explain why sales are high or low.

In retail, conversion-rate outliers are important.

A very low conversion rate may suggest:
Poor merchandising, Bad staffing coverage, Long checkout lines, Weak product availability, Poor store layout, and Low-quality traffic.

A very high conversion rate may suggest:
Strong store execution, Very targeted customer traffic, Better merchandising, and Strong product-market fit.

Key Store-Level Findings
Finding 1: S001 is the strongest sales store - 
S001 is the clear top performer.
S001 is the best benchmark store. The business should study what S001 is doing well and see what can be copied elsewhere.

Finding 2: S004 is the weakest store
S004 has the lowest average weekly sales: S004 average sales = $4,280
It also has the lowest average traffic and weak inventory availability.

Finding 3: S005 is a strong growth story
S005 also has the highest inventory availability, rising from 95% to 99%. S005 is not the highest-sales store overall, but it has the cleanest upward trend. This is a strong “momentum store.”

Finding 4: S001 has high sales, but conversion rate is not dramatically better
Approximate average conversion rates: S001 performs well because it combines: High traffic, Strong transaction count, Strong sales, and Good inventory availability. S001 wins because multiple drivers are healthy at the same time.

Finding 5: The East region is split between decent and weak performance
This matters because looking only at region-level averages can hide the true issue. The East region may look weak overall, but the real problem is concentrated in S004. Do not blame the whole East region. Diagnose S004 specifically.

Regional Findings
The South region performs strongly because S005 is strong. The West performs strongly because S001 is excellent and S002 is stable. The East is weakest because S004 pulls down the regional average. The East region’s performance problem is mostly a store-level issue, not necessarily a whole-region demand issue.

Surprising Insights
Insight 1: The lowest-sales store also has the worst inventory availability S004 is the weakest store by sales and has the lowest in-stock percentage.
That is not a small difference. S004’s average inventory availability is around 54%, while S005 is around 97%.
Surprising takeaway: S004 may not be a demand problem. Customers may be coming in but not finding what they want.

Insight 2: S005 is quietly becoming a star store S001 has the highest average sales, so it gets the most attention. But S005 shows consistent week-over-week growth from $12,000 to $14,000.
Surprising takeaway: S005 may be the best “growth model” store, even though S001 is the top sales store.

Insight 3: The East region looks weak, but the real issue is S004 At a region level, East has the lowest average sales.
But the East region includes both S003 and S004. S003 is moderate. S004 is the true drag.
Surprising takeaway: Regional averages can hide store-specific problems. This is important because the wrong business response would be:
Fix the East region. Diagnose and fix S004.

Insight 4: Sales per visitor gives a cleaner view than sales alone Sales alone favors stores with lots of traffic. Sales per visitor helps show how efficiently each store turns visitor traffic into revenue. 

Insight 5: Promotions appear concentrated in already stronger stores
Promotion flags are more common for S001 and S005. S004 has no promotional support in the dataset.
Surprising takeaway: The stores with stronger performance may also be receiving more promotional help, while the weakest store may not be getting the support it needs. This does not prove promotions caused the sales gap, but it raises a good business question.

Metric Story
Main Metric: Sales
What changed?
Sales changed differently by store over the five weeks. S005 had the largest improvement. S004 had the clearest decline.

What should we do?
For S005: Protect the momentum.
Actions: Maintain high inventory availability. Keep staffing aligned with traffic growth. Continue testing promotions. Study S005’s operating model and apply lessons elsewhere.

For S004: Fix the basics first.
Actions: Investigate inventory replenishment immediately. Identify why in-stock percentage fell below 50%. Review store layout and product availability.
Check whether staffing is sufficient during peak traffic. Consider a targeted promotion only after inventory is fixed.

Business Impact
Revenue Impact: The difference between S001 and S004 is large. Over a full year, even a modest improvement could add meaningful revenue.

Regional Impact: The East region appears weak, but the store-level view shows that S004 is the biggest issue. Store-level diagnosis prevents the company from making broad regional assumptions. Instead of blaming the whole East region, the business can focus on the actual weak store.

Recommendations
Recommendation 1: Fix S004 inventory immediately S004 has the lowest sales and the worst inventory availability.

Priority action: Conduct an inventory root-cause review for S004. S004 should not receive aggressive promotions until inventory is fixed. Promoting an out-of-stock store wastes demand.

Recommendation 2: Use S001 as the benchmark store
S001 is the highest-sales store. Identify which S001 practices can be copied into S002, S003, and S004.

Recommendation 3: Protect S005 momentum
S005 is the best growth story.
Sales increased from $12,000 to $14,000.
Recommended actions: Keep inventory above 95%. Maintain promotion support. Ensure staffing keeps up with growing traffic. Monitor whether growth is profitable, not just high revenue.

Recommendation 4: Improve conversion in S002 and S003
S002 and S003 are not failing, but they are not top performers. They need targeted optimization.
Recommended actions: Improve merchandising. Test local promotions. Improve checkout speed. Monitor traffic-to-transaction conversion. Improve inventory consistency.

Executive Summary:
This project analyzes weekly retail store performance across five stores and three regions. The analysis calculates conversion rate, sales per employee, sales per visitor, average sales, average traffic, average transactions, and inventory availability.

The key finding is that store performance differs sharply. S001 is the strongest store by average sales, while S005 is the strongest growth story. S004 is the weakest store and appears to have a serious inventory availability problem, with in-stock percentage falling below 50% by the final week.

Final Recommendation:
The business should prioritize store actions in this order:
Fix S004 inventory availability immediately. Use S001 as the benchmark for high-performing store operations. Protect and study S005’s growth momentum.
Improve conversion in S002 and S003. Build a weekly dashboard to monitor sales, traffic, conversion, inventory, and labor productivity.


















































