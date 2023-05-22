# 🎬 Movies Gross Correlation

The complete project can be viewed at [Link](https://github.com/AlexanderEvanW/PortfolioProjects/blob/main/Movies%20Gross%20Correlation/Movies%20Gross%20Correlation.ipynb).

## Objective
The objective of this project is to determine the factors that influence movies gross by investigating their correlation.

## Tools
Python for data cleaning, data transformation, data visualisation and data analysis.

## Dataset
The dataset is publicly available on [Kaggle](https://www.kaggle.com/datasets/danielgrijalvas/movies).

## Correlation

This visualization is made using Seaborn, a Python library. This visualization confirms that `gross` and `budget` are positively correlated, as indicated by the upward trend shown by the line.

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/8e862104-1867-4d48-816f-c9e31da62a3a)

We can use Python to calculate the correlation between `gross` and `budget`.
```python
correlation = df[['gross', 'budget']].corr()
print(correlation)
```

A correlation coefficient of 0.74 between `gross` and `budget` indicates a strong positive correlation between these two variables. This means that as the budget of a movie increases, there is a tendency for the gross (revenue) of the movie to increase as well.

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/6aced238-c081-4cde-bc1a-a021770386db)

We will investigate further to determine if there are any other variables that are correlated with `gross`. This will involve constructing a correlation matrix for analysis. To create the visualization, we will use Matplotlib and Seaborn libraries from Python.

Turns out that `votes` and `gross` has a correlation coefficient of 0.61, indicates a moderate positive correlation between these two variables. This means that as the number of IMDb votes (popularity) for a movie increases, there is a tendency for the gross revenue of the movie to increase as well.

![image](https://github.com/AlexanderEvanW/PortfolioProjects/assets/124351667/8dba047e-c8a1-4e90-8267-be9c3b23ed1e)

