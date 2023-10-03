# TrendingMovies

## Overview
MovieProject is an iOS application designed to showcase trending movies using the TMDB API. The application follows the MVVM-C architectural pattern to ensure clear separation of concerns, readability, and maintainability.

## Features
Trending Movies: Fetches and displays the trending movies from the TMDB API.
Movie Details: Allows users to see detailed information about each movie including its poster, title, and description.

# Important Notes
### API Key in Source Code
For the purpose of simplicity and immediate operability of this sample project, the TMDB API key has been included in the source code. In a real-world scenario, embedding API keys within the source code is not recommended due to security reasons. It's advised to use secure environment variables or secure vault services for storing such sensitive information.

### Pods in Repo
Typically, it's a common practice to exclude the Pods/ directory from version control to reduce repository size and avoid version conflicts. However, in this project, the pods are included in the repository. This decision was made to simplify the setup process for anyone trying out or testing the application. This ensures that the exact versions of the libraries are available to everyone and eliminates potential inconsistencies.

# Future Improvements
UI Enhancements: While the current user interface serves its purpose, there's always room for improvement. Introducing advanced design elements and animations could elevate the user experience.

Search Feature: A search functionality would be a valuable addition, enabling users to find their favorite movies swiftly.

Advanced Sorting: Provide users with the ability to sort movies based on criteria like release date, ratings, etc.

# Getting Started
Clone the Repository: As usual, begin by cloning the repository to your local machine.

Install Dependencies: Since the Pods/ directory is tracked in this repo, you won't need to run pod install. However, if you encounter any issues, running the command might help.

Open in Xcode: Navigate into the project directory and open it using Xcode.

Run the Project: Build and run the project on the desired simulator.

