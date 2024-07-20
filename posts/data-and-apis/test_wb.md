---
draft: true
---

# Using WBGAPI: A Step-By-Step Guide to Access World Bank Data

WBGAPI is an extraordinary tool to gather data directly from the World Bank's vast databases. In this article, we will cover how to harness this tool and use it to study the evolution of various economic indicators. To demonstrate its utility, we will focus on two specific use cases:

1. Comparing the evolution of Gross Domestic Product (GDP) in Emerging Markets and Developed Markets.
2. Analysing the evolution of GDP per capita for several key countries: USA, France, Germany, Japan, China, and India.

These examples will provide a flavour of the insights one can derive from World Bank data using WBGAPI.

## Installation

To start, ensure that you have the WBGAPI library installed. If not, you can do so using pip:

```python
pip install wbgapi
```

## Setting the Stage

Firstly, we need to import the necessary libraries. WBGAPI will be used to gather data, pandas for data manipulation, and matplotlib for visualisation.

```python
import wbgapi as wb
import pandas as pd
import matplotlib.pyplot as plt
```

## Use Case 1: GDP Evolution of Emerging vs Developed Markets

Gross Domestic Product (GDP) serves as a broad measure for a country's overall economic activity. It represents the monetary value of all finished goods and services produced within a country's borders in a specific time period.

Here is how we can fetch the data:

```python
# Get income level codes for "High income" (developed markets) and "Lower middle income" and "Upper middle income" (emerging markets)
income_levels = wb.income.list().set_index('id')['name']
developed = [code for code, name in income_levels.items() if 'High income' in name]
emerging = [code for code, name in income_levels.items() if 'middle income' in name]

# Fetch GDP data (NY.GDP.MKTP.CD) for the last 30 years
years = list(range(1994, 2024))
gdp_developed = wb.data.DataFrame('NY.GDP.MKTP.CD', country=developed, time=years).mean(axis=1)
gdp_emerging = wb.data.DataFrame('NY.GDP.MKTP.CD', country=emerging, time=years).mean(axis=1)

# Create a DataFrame
df_gdp = pd.DataFrame({'Developed Markets': gdp_developed, 'Emerging Markets': gdp_emerging})
```

We can now visualise the data:

```python
df_gdp.plot(kind='line')
plt.title('GDP Evolution: Developed vs Emerging Markets (1994-2024)')
plt.xlabel('Year')
plt.ylabel('GDP (Current US$)')
plt.show()
```

## Use Case 2: GDP per Capita Evolution for Selected Countries

GDP per capita is a measure of the total output of a country that takes the GDP and divides it by the number of people in that country. The countries we will focus on are the USA, France, Germany, Japan, China, and India.

Fetching the data is straightforward:

```python
# Specify countries and fetch data for GDP per capita (NY.GDP.PCAP.CD)
countries = ['USA', 'FRA', 'DEU', 'JPN', 'CHN', 'IND']
df_gdp_pc = wb.data.DataFrame('NY.GDP.PCAP.CD', country=countries, time=years)
```

And let's visualise this:

```python
df_gdp_pc.plot(kind='line')
plt.title('GDP per Capita

 Evolution: USA, France, Germany, Japan, China, India (1994-2024)')
plt.xlabel('Year')
plt.ylabel('GDP per Capita (Current US$)')
plt.show()
```

## Conclusion

World Bank data provides invaluable insight into the world's economic trends, and the WBGAPI library is an incredibly useful tool for extracting this data in an easy and efficient manner. It enables researchers, analysts, and policymakers to gauge economic performance, identify trends, and make evidence-based decisions.

Whether you are a student, economist, or data enthusiast, the potential of such data is boundless. By coupling World Bank data with Python's analytical and visualisation capabilities, you can make economic trends come alive, allowing for more profound, insightful analysis and decision-making.