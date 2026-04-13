# MySQL-MongoDB-Comparison

This repository contains the code for a comparison of execution speed between MongoDB and SQL in regards to running aggregate functions. This is a project for a senior research class at my university.

All data comes from <a href="https://www.kaggle.com/datasets/maharshipandya/-spotify-tracks-dataset">Kaggle</a>. A dataset with Spotify song information was used to test the following queries 20 times each for an average run time in milliseconds:
<ul>
  <li>Minimum</li>
  <li>Maximum</li>
  <li>Average</li>
  <li>Sum</li>
  <li>A count of how many songs are underneath 200,000 ms</li>
  <li>A count of how many songs are in each genre</li>
  <li>A search for the artist with the most songs in the dataset</li>
</ul>

**MongoDB_Queries** is a .txt file containing the queries used for MongoDB.

**SQLQueries** is a file containing the queries used for SQL. 

**ExecutionTimeResults.R** contains the data of the 20 runs for all functions across SQL and MongoDB. It calculates the averages and plots them.
