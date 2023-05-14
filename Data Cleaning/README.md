# 🧽 Data Cleaning

Looking at the `nashville_housing` table below, we can see several problems.

### Standardize Date Format

Changing the `SaleDate` to make it easier to read.

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/19821f92-dff8-4e8a-a481-33fbdb776019)

```sql
UPDATE nashville_housing
SET SaleDate = DATE_FORMAT(STR_TO_DATE(SaleDate, '%d-%b-%y'), '%Y/%m/%d')
```
### Populate Property Address Data

When we checked the `PropertyAddress` data, we found a few null values.

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/22604e7b-1a7b-4958-b8f5-0cad1b49935e)

When we examined the data, we discovered that every `ParcelID` has the same `PropertyAddress`

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/3f8a5c66-d9dc-4441-8a2b-a343b7855271)

To fill in the null values, we can write a query that essentially says, 'if a `ParcelID` already has a `PropertyAddress`, and another `ParcelID` does not have a `PropertyAddress`, then fill the empty `PropertyAddress` with the already-filled `PropertyAddress`.

```sql
SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, IF(a.PropertyAddress = '', b.PropertyAddress, a.PropertyAddress)
FROM nashville_housing a
JOIN nashville_housing b
    ON a.ParcelID = b.ParcelID
    AND a.UniqueID != b.UniqueID
WHERE a.PropertyAddress = ''
```

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/6a63b4e5-fa7c-4214-a723-23e6df0c7c73)

```sql
UPDATE a
SET PropertyAddress = IF(a.PropertyAddress = '', b.PropertyAddress, a.PropertyAddress)
FROM nashville_housing a
JOIN nashville_housing b
    ON a.ParcelID = b.ParcelID
    AND a.UniqueID != b.UniqueID
WHERE a.PropertyAddress = ''
```

### Breaking Out Address Into Individual Columns (Address, City, State)





