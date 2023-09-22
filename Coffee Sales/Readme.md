# ☕ Coffee Sales Excel Project

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/3ae0f193-91f7-4a69-b4cf-0995432197ca)

## 🔎 Objective
In this project, we will process, explore, and analyze the coffee sales dataset to extract valuable information. Then, we will create a dashboard to display important information and assist stakeholders in better understanding the business.

## 🔨 Tools
Microsoft Excel and Microsoft Power BI is used in this project. Microsoft Excel is used to process, explore, and analyze the coffee sales dataset using Excel features and formulas like VBA Macros, XLOOKUP, IF, SUMIFS, and SUMPRODUCT. Power BI is used to create an interactive Power BI dashboard to highlight key performance indicators, sales trends, top-selling products, and top customers.

## 🔢 Dataset
The dataset is available on [link](https://github.com/AlexanderEvanW/PortfolioProjects/tree/main/Coffee%20Sales/Dataset). The dataset consists of three different Excel files: customer data, orders data, and product data. We will automate and merge these files into one document using VBA Macros.

```
Sub MergeExcelFiles()
    Dim SourceBook As Workbook
    Dim TargetBook As Workbook
    Dim ws As Worksheet
    Dim MyPath As String
    Dim MyFile As String

    ' Excel files folder path
    MyPath = "C:\Users\ALEX\Desktop\Project\Excel\Coffee Sales\Dataset\Multiple Dataset\"

    ' Initialize the target workbook (the one where you want to combine the files)
    Set TargetBook = ThisWorkbook ' Change to the desired target workbook

    ' Loop through each file in the folder
    MyFile = Dir(MyPath & "*.xlsx")
    Do While MyFile <> ""
        ' Open the source workbook
        Set SourceBook = Workbooks.Open(MyPath & MyFile)

        ' Copy each sheet from the source workbook to the target workbook
        For Each ws In SourceBook.Sheets
            ws.Copy After:=TargetBook.Sheets(TargetBook.Sheets.Count)
        Next ws

        ' Close the source workbook without saving changes
        SourceBook.Close SaveChanges:=False

        ' Get the next file in the folder
        MyFile = Dir
    Loop
End Sub
```

This VBA code combines multiple Excel files into one workbook with each file becoming a separate sheet. It begins by declaring variables and setting the path to the folder containing the Excel files. It then loops through each file in the folder, opening it as a source workbook, copying each sheet within it to the target workbook, and subsequently closing the source workbook without saving changes. The loop continues until all files in the folder have been processed, resulting in a single Excel workbook with each original file represented as a separate sheet in the target workbook.

## 💡 Insights
These are the insights that we have gained through the analysis of the coffee sales data from January 2019 to August 2022:
- The total coffee sales is $45134
- The total profit is $4520
- The total quantity of coffee sold is 3551
- The total distinct order count is 957
- The coffee product has a 10% profit margin
- The average order value is $47, the higher the average order value, the more customers spend on our product
- In 2020, the sales growth rate was -1%, indicating a slightly worse performance compared to the previous year
- In 2021, the sales growth rate was 14%, indicating a better performance compared to the previous year
- In 2022, the sales growth rate was -49% due to incomplete data, therefore, we cannot draw conclusions at this time
- The quantity sold per order is 3.71, indicating upselling or cross-selling success
- The country that has the highest coffee sales is the **United States**
- The city that has the highest coffee sales is **Washington**
- The coffee type that has the highest coffee sales is **Excelsa**
- The roast that has the highest coffee sales is **Light**
- The coffee size that has the highest sales is **2.5 kg**
- **2021** was the year that had the highest coffee sales
- **Allis Wilmore** has generated the highest sales of our product, therefore, we need to prioritize the customers who have the highest spending
- Customers without loyalty cards have higher average spending than customers with loyalty cards. Therefore, we need to review, adjust, and monitor the impact of changes made to the loyalty cards

## 📊 Dashboard

The purpose of this dashboard is to display important information and assist stakeholders in better understanding the business. This dashboard highlights key performance indicators, sales trends, top-selling products, and top customers. It is a dynamic dashboard, so the values can change when users select various available filters.

![Coffee Sales Dashboard](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/4ebb8b63-315b-4289-90d1-792281e96111)

## 📌 Recommendation

**Loyalty Cards**

Customers without loyalty cards have higher average spending than customers with loyalty cards. Therefore, we need to review, adjust, and monitor the impact of changes made to the loyalty cards.

Review Loyalty Program:

Evaluate the effectiveness of the current loyalty program. Ask questions like:
- Are the benefits of the loyalty program attractive enough?
- Are the rewards relevant to the customer base?
- Is the enrollment process easy and accessible?
- Do customers understand and appreciate the program's value?

Adjust Loyalty Program:

Depending on the customer feedback and analysis, consider making adjustments to your loyalty program to make it more appealing. This might include:

- Enhancing rewards
- Streamlining the enrollment process
- Offering personalized offers based on individual shopping habits
- Providing exclusive discounts or promotions to loyal customers

Monitor and Measure:

Continuously monitor the impact of changes made to your loyalty program. Track spending trends, customer feedback, and enrollment rates to assess the effectiveness of your strategies.
