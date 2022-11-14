# COUNTRIES APP
## DESCRIPTION OF THE APP
The countries app is a mobile application that displays the list of countries provided by the API given for the task. The app contains two basic screens; the first one displays the list of countries and  when a user tap on a country, it takes the user to the details screen where the user csn see more information about a country. The app also has two modal bottom sheet that leads to where a user can filter the countries according to region(continents). All the screens in the app are scrollable and responsive with top notch features. The app also has a very good searchable feature whereby a user can use to search for countries easily and seamlessly. The app also supports mode switch(dark & light theme) so a user can choose select the theme of his/her choice.

## DESCRIPTION OF CODE BASE
The code base is structured to have a total of 6 folders which I used to structure my app in a very clean and orderly way. One of the folder is named "screens" which contains all the screens in the app. There is another folder which I named "widgets" that contains all the extracted widgets in my app. There is a model's folder which contains all the model classes used in the app. There is another folder called API which houses the file I used to handle my API calls. There is another folder called consts which houses all the constant values in the app. There is another folder called styles which contains all the styling used in the app.

## HOW TO USE THE APP
After launching the app the first screen that comes up is the screen that displays the list of countries and their capital. If a user should tap on a country, it takes the user to the details screen that displays more information about a country. The app has a search bar that a user can use to search for a country and it comes up immediately. The app also has a filter option from the main screen that when tapped will pop up a modal bottom sheet that leads a user to the filtering by region(continent) option. At this point the user should select the continents he/she wants to view and press show result and the app filters the list to those regions. The app is intuitive and user friendly and also has a dark mode option to suite different users preference.

## DESCRIPTION OF LIBRARIES USED
1. ### Provider
   I made use of the provider state management tool in the implementation of my dark/light mode.

2. ### shared_preferences
   Shared_preferences was part of what i needed for the implentation of the light/dark mode.
   
3. ### http
   I made use of the http package to enable me make network calls to the API.

4. ### card_swiper & page_transition
   I made use of card_swiper & page_transition to transit between different images in my details screen to switch between flags and coat of arms of each countery.
   
5. ### Internet connection checker & connectivity plus
   I made use of these package to check for network connection related problems on the app.   

## CHALLENGES FACED AND HOW I OVERCAME
   I had challenge with sorting data from the API but i used stackoverflow and google to get solutions that helped me solve the problem. I also discovered that the API    some mssing data like some continents have no data while others have.
   
## FEATURES I WOULD LOVE TO ADD IF I HAD MORE TIME
   Automatic language detector.   
   
## LINK TO THE APK UPLOADED ON GOOGLEDRIVE
   

## LINK TO THE APP ON APPETIZE.IO
