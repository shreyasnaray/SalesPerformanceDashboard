library(ggplot2)
library(tidyverse)
store_id <- c('S001', 'S002', 'S003', 'S004', 'S005', 
  'S001', 'S002', 'S003', 'S004', 'S005',
  'S001', 'S002', 'S003', 'S004', 'S005',
  'S001', 'S002', 'S003', 'S004', 'S005',
  'S001', 'S002', 'S003', 'S004', 'S005')
region <- c('West', 'West', 'East', 'East', 'South', 
        'West', 'West', 'East', 'East', 'South',
        'West', 'West', 'East', 'East', 'South',
        'West', 'West', 'East', 'East', 'South',
        'West', 'West', 'East', 'East', 'South')
week <- c(2024-01-01, 2024-01-01, 2024-01-01, 2024-01-01, 2024-01-01,
            2024-01-08, 2024-01-08, 2024-01-08, 2024-01-08, 2024-01-08,
            2024-01-15, 2024-01-15, 2024-01-15, 2024-01-15, 2024-01-15,
            2024-01-22, 2024-01-22, 2024-01-22, 2024-01-22, 2024-01-22,
            2024-01-29, 2024-01-29, 2024-01-29, 2024-01-29, 2024-01-29)
sales <- c(15230, 9800, 8700, 4500, 12000,
           16000, 10200, 8900, 4700, 12500,
           15800, 9500, 9100, 4300, 13000,
           16500, 9900, 8800, 4000, 13500,
           17000, 9700, 8600, 3900, 14000)
transactions <- c(210, 140, 130, 70, 180,
                  220, 150, 135, 75, 185,
                  215, 145, 140, 65, 190,
                  230, 150, 138, 60, 195,
                  240, 148, 132, 58, 200)
avg_order_value <- c(72.5, 70.0, 66.9, 64.3, 66.7,
                     72.7, 68.0, 65.9, 62.7, 67.6,
                     73.5, 65.5, 65.0, 66.2, 68.4,
                     71.7, 66.0, 63.8, 66.7, 69.2,
                     70.8, 65.5, 65.2, 67.2, 70.0)
foot_traffic <- c(950, 800, 780, 600, 900,
                  980, 820, 800, 610, 910,
                  970, 790, 820, 580, 920,
                  1000, 810, 790, 550, 940,
                  1020, 800, 780, 540, 960)
employees <- c(12, 10, 9, 8, 11,
               12, 10, 9, 8, 11,
               12, 10, 9, 8, 11,
               12, 10, 9, 8, 11,
               12, 10, 9, 8, 11)
prom_flag <- c(1, 0, 0, 0, 1,
               1, 0, 0, 0, 1,
               0, 0, 1, 0, 1,
               1, 0, 0, 0, 1,
               1, 0, 0, 0, 1)
inventory_in_stock_pct <- c(0.92, 0.88, 0.85, 0.60, 0.95,
                            0.94, 0.87, 0.83, 0.58, 0.96,
                            0.91, 0.82, 0.89, 0.55, 0.97,
                            0.93, 0.84, 0.80, 0.50, 0.98,
                            0.95, 0.83, 0.78, 0.48, 0.99)

df <- data.frame(store_id = store_id, region = region,
                   week = week, sales = sales, transactions = transactions,
                   avg_order_value = avg_order_value, foot_traffic = foot_traffic,
                   employees = employees, prom_flag = prom_flag, 
                   inventory_in_stock_pct = inventory_in_stock_pct)

df$conversion_rate <- df$transactions/df$foot_traffic
df$salesperemployee <- df$sales/df$employees
df$salespervisitor <- df$sales/df$foot_traffic
df
sum(is.na(df))
sum(duplicated(df))
df %>% filter(duplicated(.))
summary(df)
# Plot of the histogram of conversion rate
ggplot(df) +
  aes(x = conversion_rate) +
  geom_histogram(
    bins = round(sqrt(length(df$conversion_rate))),
    fill = 'blue', color = 'brown'
  ) + 
  theme_minimal()

ggplot(df) +
  aes(x = "", y = conversion_rate) +
  geom_boxplot(fill = 'blue') + 
  theme_minimal()


cr_outliers <- boxplot.stats(df$conversion_rate)$out
ind_outliers <- which(df$conversion_rate %in% c(cr_outliers))
ind_outliers


summary_stats <- df %>% 
  group_by(region, store_id) %>%
  summarise(
    avg_sales = mean(sales, na.rm = TRUE),
    total_sales = sum(sales, na.rm = TRUE),
    avg_conversion_rate = mean(conversion_rate, na.rm = TRUE),
    avg_foot_traffic = mean(foot_traffic, na.rm = TRUE),
    avg_transactions = mean(transactions, na.rm = TRUE),
    weeks_observed = n()
  ) %>%
  ungroup()
summary_stats <- summary_stats %>%
  mutate(
    sales_per_visitor = avg_sales / avg_foot_traffic,
    conversion_efficiency = avg_conversion_rate * avg_sales
  )
summary_stats <- summary_stats %>% 
  arrange(avg_sales) %>%
  head(5)
print(summary_stats, width = Inf)
bottom_stores <- summary_stats %>%
  arrange(avg_sales) %>%
  slice_head(n = 5)
bottom_stores

top_stores <- summary_stats %>%
  arrange(desc(avg_sales)) %>%
  slice_head(n = 5)

top_stores






df %>%
  group_by(region) %>%
  summarise(
    avg_sales = mean(sales),
    avg_conversion = mean(transactions/foot_traffic),
    avg_traffic = mean(foot_traffic)
  )

cor_matrix <- df %>%
  select(sales, foot_traffic, conversion_rate, avg_order_value,
         inventory_in_stock_pct) %>% 
  cor(use = 'complete.obs')
cor_matrix

ggplot(df, aes(x = foot_traffic, y = sales)) +
  geom_point() + 
  geom_smooth(method = 'lm')

ggplot(df, aes(x = conversion_rate, y = sales)) + 
  geom_point() +
  geom_smooth(method = 'lm')
ggplot(df, aes(x = avg_order_value, y = sales)) + 
  geom_point() +
  geom_smooth(method = 'lm')
ggplot(df, aes(x = inventory_in_stock_pct, y = sales)) +
  geom_point() +
  geom_smooth(method = 'lm')

# Core visualizations
# How does sales look like for each of the stores separated by color for the weeks?
ggplot(df, aes(x = as.Date(week), y = sales, color = store_id)) +
  geom_line() +
  theme_minimal() +
  stat_summary(fun = mean, geom = 'line', size = 2)

# Identify top vs bottom stores by average sales
df %>%
  group_by(store_id) %>%
  summarise(avg_sales = mean(sales)) %>%
  ggplot(aes(x = reorder(store_id, avg_sales),
             y = avg_sales)) +
  geom_col() + 
  coord_flip()

# Compare variability across regions
ggplot(df, aes(x = region, y = sales)) +
  geom_boxplot()

# Compare staffing 
ggplot(df, aes(x = employees, y = sales)) +
  geom_point() +
  geom_smooth(method = 'lm')

df_summary <- df %>% 
  group_by(region) %>%
  summarise(
    avg_sales = mean(sales),
    avg_traffic = mean(foot_traffic)
  )
df_summary %>%
  pivot_longer(-region) %>%
  ggplot(aes(x = region, y = value, fill = name)) +
  geom_col(position = 'dodge')
  
df_summary2 <- df %>%
  group_by(region) %>%
  summarise(
    avg_conversion = mean(transactions/foot_traffic)
  )
ggplot(df_summary2, aes(x = region, y = avg_conversion)) + 
  geom_col()

# Average Sales by Store
summary_stats %>%
  ggplot(aes(x = reorder(store_id, avg_sales), y = avg_sales, fill = region)) +
  geom_col() +
  coord_flip() +
  theme_minimal() +
  labs(title = 'Average Sales by Store', x = 'Store', y = 'Average Sales')

# Foot Traffic vs Sales
ggplot(df, aes(x = foot_traffic, y = sales, color = store_id)) +
  geom_point(size = 3) +
  geom_smooth(method = 'lm', se = FALSE) +
  theme_minimal() +
  labs(title = 'Sales vs Foot Traffic', x = 'Foot Traffic', y = 'Sales')

# Inventory vs Sales
ggplot(df, aes(x = inventory_in_stock_pct, y = sales, color = store_id)) +
  geom_point(size = 3) +
  geom_smooth(method = 'lm', se = FALSE) + 
  theme_minimal() +
  labs(title = 'Sales vs Inventory Availability', x = 'Inventory Availability', 
       y = 'Sales')

summary_stats %>%
  ggplot(aes(x = reorder(store_id, avg_conversion_rate), 
         y = avg_conversion_rate, fill = region)) +
  geom_col() +
  coord_flip() +
  theme_minimal() +
  labs(title = 'Average Conversion Rate by Store', x = 'Store', y = "Average Conversion Rate")






