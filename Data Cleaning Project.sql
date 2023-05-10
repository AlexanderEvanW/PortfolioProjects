/*

Data Cleaning in SQL

*/

SELECT *
FROM nashville_housing
LIMIT 1000

-- Standardize Date Format

SELECT SaleDate, DATE_FORMAT(STR_TO_DATE(SaleDate, '%d-%b-%y'), '%Y/%m/%d') 
FROM nashville_housing  

UPDATE nashville_housing
SET SaleDate = DATE_FORMAT(STR_TO_DATE(SaleDate, '%d-%b-%y'), '%Y/%m/%d')

-- Populate Property Address Data **

SELECT *
FROM nashville_housing
WHERE PropertyAddress = ''

SELECT *
FROM nashville_housing
ORDER BY ParcelID

SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, IF(a.PropertyAddress = '', b.PropertyAddress, a.PropertyAddress)
FROM nashville_housing a
JOIN nashville_housing b
    ON a.ParcelID = b.ParcelID
    AND a.UniqueID != b.UniqueID
WHERE a.PropertyAddress = ''

UPDATE a
SET PropertyAddress = IF(a.PropertyAddress = '', b.PropertyAddress, a.PropertyAddress)
FROM nashville_housing a
JOIN nashville_housing b
    ON a.ParcelID = b.ParcelID
    AND a.UniqueID != b.UniqueID
WHERE a.PropertyAddress = ''

-- Breaking Out Address Into Individual Columns (Address, City, State)

SELECT PropertyAddress
FROM nashville_housing

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

SELECT *
FROM nashville_housing


SELECT OwnerAddress
FROM nashville_housing

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

SELECT *
FROM nashville_housing

-- Change Y and N  to Yes and No in "Sold As Vacant" field

SELECT DISTINCT SoldAsVacant, COUNT(SoldAsVacant)
FROM nashville_housing
GROUP BY SoldAsVacant
ORDER BY 2

SELECT SoldAsVacant,
CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
     WHEN SoldAsVacant = 'N' THEN 'No'
     ELSE SoldAsVacant
     END
FROM nashville_housing

UPDATE nashville_housing
SET SoldAsVacant = CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
     WHEN SoldAsVacant = 'N' THEN 'No'
     ELSE SoldAsVacant
     END

-- Remove Duplicates

WITH RowNumCTE AS(
SELECT *,
    ROW_NUMBER() OVER(
    PARTITION BY ParcelID,
                 PropertyAddress,
                 SalePrice,
                 SaleDate,
                 LegalReference
                 ORDER BY UniqueID
    ) AS Row_Num
FROM nashville_housing
)

SELECT *
FROM RowNumCTE
WHERE Row_Num > 1
ORDER BY PropertyAddress

-- Delete Duplicates

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

-- Delete Unused Columns

SELECT *
FROM nashville_housing

ALTER TABLE nashville_housing
    DROP COLUMN OwnerAddress, 
    DROP COLUMN TaxDistrict, 
    DROP COLUMN PropertyAddress