# Con Cung's entrance test

This is the repository of the entrance test for Flutter Developer title at Con Cung

- The project use MVVM Architectural Design Pattern
- State management: Provider with StateNotifier
- Local database: SQLite3 using Flutter Drift
- Author: Le Minh Dang (fullname in Vietnamese)

## How to login?

- Firstly: Press Sign Up button (to add the info of user to database)
- Secondly: Sign In with provided account:
  - email: concung@gmail.com
  - password: concung123

## Architecture MVVM

![Folder hierarchy](https://lh4.googleusercontent.com/ZgXMeZooiIzVGTM9ZNeJyCbiw4dlBWRtcEVPkgK_ENzc4cWXjFfKxDASQ7wGSGgPshA=w2400 "Folder hierarchy")

- **data** which is known as Data layer, contains everything about data from both local storage and online sources
- **model** is the folder contains models of all API response.
- **utils** contains some helpers function/procedures.
- **view** which contains screens and reusable components.
- **view_model** contains all the business logics of the application.

## Data folder

![Data Folder](https://lh5.googleusercontent.com/WTm-eeRho92BTZ1QnqP2SVw3KV4Z4XN-sk8whDLZR0dHaYQQisOU0VWyuqmyPKz0mMc=w2400 "Data folder")

- **database** configurations for local database using sqlite3 (Flutter Drift).
- **local_source** The implementations of fetching data from local database.
- **remote_source** The implementations of fetching data from online sources.
- **repository** A design pattern that help us doing some works with data form both below sources for an example: caching technique.

## Model folder

Only contains .dart files for model of data from both local storage and online sources

## View folder

![View folder](https://lh3.googleusercontent.com/pvD_g7b4WGS47mGcG6z0-nH9gXzU0dMoAVhyYRBM9kncx5O8gqXfM15jUWj1Sabht1g=w2400 "View folder")

- **components** contains reuseable widgets
- **routes** contains Flutter routes management configurations
- **screens** contains all the routes of this project
- **style** contains the font style and colors of the project

## View_model folder

Contains all the business logics of features in this application.

## Utils folder

Contains all helper functions/procedures, for an example: wrapper of dio, custom exception...
