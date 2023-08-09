# 📺 YouTube Data EDA

In this project, we will perform Exploratory Data Analysis using YouTube video data from the Manchester United Channel.

The complete project can be viewed at [Link](https://github.com/AlexanderEvanW/PortfolioProjects/blob/main/EDA%20Using%20YouTube%20Video%20Data/EDA%20YouTube%20Video%20Data.ipynb).

## 🔎 Objective
This project aims to analyze a specific YouTube channel to derive insightful observations. During the course of this project, I intend to explore the following areas:
- **Understanding YouTube API and Obtaining Channel Video Data:** Familiarize myself with the YouTube API and its usage to retrieve video data associated with the channel.
- **Exploring Impactful Terms in Video Titles Using NLP Techniques:** Utilize Natural Language Processing (NLP) techniques to identify terms within video titles that potentially influence video view counts.
- **Conducting Exploratory Data Analysis (EDA):** Perform EDA to address the following inquiries:
  - What does the distribution of views look like?
  - Do the numbers of likes and comments influence a video's view count?
  - Does video duration play a role in garnering more views?
  - Are there specific terms in video titles that impact video views?

## 🔨 Tools
Python for Exploratory Data Analysis and data collection from the YouTube API

## 🔢 Dataset
I created my own dataset using the Google Youtube Data API version 3.0. First, I created a project on the Google Developers Console and requested an authorization credential (API key). After that, I enabled the YouTube API for my application, allowing me to send API requests to YouTube API services. Then, I visited YouTube and retrieved the channel ID that I wanted to include. Then, I created the functions for getting the channel statistics via the API.

## 🎯 Insights
- The view distribution of the Manchester United YouTube channel shows that a few videos have more than 10 million views, while the majority of the videos fall within the range of 0 to 2 million views.
- The number of views strongly correlates with the number of comments and likes. This correlation may be attributed to the YouTube algorithm. Videos with higher likes and comments are more likely to be recommended to a broader audience, enhancing their visibility.
- Videos with longer durations are likely to have fewer views than videos with shorter durations. People tend to watch shorter videos rather than longer ones on YouTube.
- There are terms in the video title that clearly impact the number of views, for example:
  - Highlights: People enjoy watching match highlights as they provide a summary of the entire match in a shorter duration.
  - Premier League: Currently, the Premier League is considered the best league in the world. Therefore, it is not surprising that videos with this keyword receive more views.
  - Win: Naturally, people are drawn to videos depicting their team's victories, resulting in elevated view counts.
  - Cristiano Ronaldo: Ronaldo is the most famous footballer in the world, so it's no surprise that his name attracts more video views.
  - Liverpool: Liverpool is Manchester United's biggest rival, so their matches will always attract more video views.
