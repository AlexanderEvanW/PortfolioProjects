# 🧽 Data Cleaning

Looking at the `nashville_housing` table below, we can see several problems.

### Standardize Date Format

Changing the `SaleDate` to make it easier to read.

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/19821f92-dff8-4e8a-a481-33fbdb776019)

```sql
UPDATE nashville_housing
SET SaleDate = DATE_FORMAT(STR_TO_DATE(SaleDate, '%d-%b-%y'), '%Y/%m/%d')
```
### Populate `PropertyAddress` Data

When we checked the `PropertyAddress` data, we found a few null values.

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/22604e7b-1a7b-4958-b8f5-0cad1b49935e)

When we examined the data, we discovered that every `ParcelID` has the same `PropertyAddress`

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/3f8a5c66-d9dc-4441-8a2b-a343b7855271)

To fill in the null values, we can write a query that essentially says, "if a `ParcelID` already has a `PropertyAddress`, and another `ParcelID` does not have a `PropertyAddress`, then fill the empty `PropertyAddress` with the already-filled `PropertyAddress`".

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

When we examine the `PropertyAddress` data, we notice that the address and city are separated by a comma. Therefore, we will split them into separate columns so that the data is easier to use.

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/3cce8555-05ea-4cdc-a4c5-7ceabe5cc9e2)

```sql
SELECT substring_index(PropertyAddress,',',1) as Address,
substring_index(PropertyAddress,',',-1)
FROM nashville_housing

ALTER TABLE nashville_housing
Add PropertySplitAddress Nvarchar(255)

UPDATE nashville_housing
SET PropertySplitAddress = substring_index(PropertyAddress,',',1)

ALTER TABLE nashville_housing
Add PropertySplitCity Nvarchar(255)

UPDATE nashville_housing
SET PropertySplitCity = substring_index(PropertyAddress,',',-1)
```

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/94e41e29-bee8-49c3-9d0e-f36e0ab79b40)

We will follow the same process for `OwnerAddress`, which consists of an address, city, and state separated by commas.

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/cd49ca62-5987-4739-8e17-065e811f7cf3)

```sql
SELECT substring_index(OwnerAddress,',',1),
substring_index(substring_index(OwnerAddress,',',2), ',', -1),
substring_index(OwnerAddress,',',-1)
FROM nashville_housing

ALTER TABLE nashville_housing
ADD OwnerSplitAddress Nvarchar(255)

UPDATE nashville_housing
SET OwnerSplitAddress = substring_index(OwnerAddress,',',1)

ALTER TABLE nashville_housing
ADD OwnerSplitCity Nvarchar(255)

UPDATE nashville_housing
SET OwnerSplitCity = substring_index(substring_index(OwnerAddress,',',2), ',', -1)

ALTER TABLE nashville_housing
ADD OwnerSplitState Nvarchar(255)

UPDATE nashville_housing
SET OwnerSplitState = substring_index(OwnerAddress,',',-1)
```

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/c538c176-cf32-48af-8a81-1ef86be8bd2c)

### Change Y and N  to Yes and No in `SoldAsVacant` column

When examining the `SoldAsVacant` data, we notice inconsistent text where 'Y' represents 'Yes' and 'N' represents 'No'. To achieve better consistency, we should change them to 'Yes' and 'No' respectively.

```sql
SELECT DISTINCT SoldAsVacant, COUNT(SoldAsVacant)
FROM nashville_housing
GROUP BY SoldAsVacant
ORDER BY 2
```

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/27878363-b7f1-45f4-a002-c66a4afe0b3e)

```sql
UPDATE nashville_housing
SET SoldAsVacant = CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
     WHEN SoldAsVacant = 'N' THEN 'No'
     ELSE SoldAsVacant
     END
```

### Remove Duplicates

While examining the `nashville_housing` table, we discovered duplicates that have identical data in every column, which need to be removed.

```sql
SELECT ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference,
    ROW_NUMBER() OVER(
    PARTITION BY ParcelID,
                 PropertyAddress,
                 SalePrice,
                 SaleDate,
                 LegalReference
                 ORDER BY UniqueID
    ) AS Row_Num
FROM nashville_housing
```

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/250075aa-a797-463c-9f0a-2eb18df87b3f)

After identifying the duplicates, we proceed to remove them.

```sql
WITH RowNumCTE AS (
SELECT 
    UniqueID,
    ROW_NUMBER() OVER(
    PARTITION BY ParcelID, 
                 PropertyAddress,
                 SalePrice,
                 SaleDate,
                 LegalReference  
                 ORDER BY UniqueID
    ) AS Row_Num
from nashville_housing
)
DELETE nh
FROM nashville_housing nh INNER JOIN RowNumCTE r ON nh.UniqueID = r.UniqueID
WHERE Row_Num>1
```

### Delete Unused Columns

We will delete columns that we know we will not use. Since we have new `OwnerAddress` and `PropertyAddress` columns, we will delete the old columns.

```sql
ALTER TABLE nashville_housing
    DROP COLUMN OwnerAddress, 
    DROP COLUMN TaxDistrict, 
    DROP COLUMN PropertyAddress
```
