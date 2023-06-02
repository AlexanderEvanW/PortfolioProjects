# 📺 Exploratory Data Analysis Using Youtube Video Data

In this project, we will perform Exploratory Data Analysis using YouTube video data from the Manchester United Channel.

The complete project can be viewed at [Link](https://github.com/AlexanderEvanW/PortfolioProjects/blob/main/EDA%20Using%20YouTube%20Video%20Data/EDA%20YouTube%20Video%20Data.ipynb).

## Objective
Within this project, I would like to explore the following:
- Getting to know Youtube API and how to obtain channel video data
- Doing Exploratory Data Analysis to answer question such as:
  - What does the distribution of views look like?
  - Does the number of likes and comments matter for a video to get more views?
  - Does the duration of a video matter for it to receive more views?
  - Is there any terms in video title that potentially impact video views?

## Tools
Python for Exploratory Data Analysis and Collecting Data from YouTube API.

## Dataset
I created my own dataset using the Google Youtube Data API version 3.0. First, I created a project on the Google Developers Console and requested an authorization credential (API key). After that, I enabled the YouTube API for my application, allowing me to send API requests to YouTube API services. Then, I visited YouTube and retrieved the channel ID that I wanted to include. Then, I created the functions for getting the channel statistics via the API.

## Conclusions
- The view distribution of the Manchester United YouTube channel shows that a few videos have more than 10 million views, while the majority of the videos fall within the range of 0 to 2 million views.
- The number of views strongly correlates with the number of comments and likes. Potentially, it's because of the YouTube algorithm. The more likes and comments a video receives, the higher the likelihood that YouTube will recommend it to other people.
- Videos with longer durations are likely to have fewer views than videos with shorter durations. People tend to watch shorter videos rather than longer ones on YouTube.
- There are terms in the video title that clearly impact the number of views, for example:
  - Highlights: People enjoy watching match highlights as they provide a summary of the entire match in a shorter duration.
  - Premier League: Currently, the Premier League is considered the best league in the world. Therefore, it is not surprising that videos with this keyword receive more views.
  - Win: People tend to watch their team winning instead of losing. Therefore, it is not surprising.
  - Cristiano Ronaldo: Ronaldo is the most famous footballer in the world, so it's no surprise that his name attracts more video views.
  - Liverpool: Liverpool is Manchester United's biggest rival, so their matches will always attract more video views.



