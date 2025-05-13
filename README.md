# news_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.




"So I recently worked on a News App using Flutter and integrated it with the NewsAPI.org API. The goal was to create a clean and informative news experience for users.

To start with, I built an onboarding screen to introduce users to the app, just to give a nice first-time experience.

Then I structured the main page into three sections:

Hottest News – This section shows top headlines in a horizontal scroll view, so users can easily swipe through the latest and most important news.

Explore Section – This is like a category-wise filter, where users can explore news by topics like Business, Entertainment, Science, Sports, and Technology.

Trending Section – This section focuses on articles that are currently popular or frequently viewed.

I created a separate function to call the News API and fetch articles dynamically. For opening the full article, I also integrated a WebView screen, so users can read the complete story right within the app.

Of course, during development, I faced a few errors — especially related to the API response structure, CORS issues while testing on emulator, and sometimes data rendering errors when the API didn’t return expected values. I had to handle null safety properly and also manage state during API calls to make sure the UI updates smoothly. But solving those errors taught me a lot about working with real-time APIs and debugging asynchronous data in Flutter.

Overall, it was a great learning experience and helped me understand how to build a functional app from scratch, manage API data, handle navigation, and give users a smooth experience."

Let me know if you'd like to add a GitHub link or if you're preparing this for a resume or mock interview.



1. Q: Why did you choose NewsAPI.org for this project?
A:
I chose NewsAPI.org because it offers a free and easy-to-use REST API with real-time news from multiple sources. It has categorized endpoints like top headlines, everything, and sources, which made it easier for me to filter and display news by category. Also, it’s beginner-friendly and well-documented, which helped speed up development.

2. Q: How did you handle errors when the API didn’t return data properly?
A:
I used proper error handling using try-catch blocks around the API calls. If there’s a failed request or empty data, I display a fallback message like "No articles available" or a loading/error widget to improve user experience. I also checked for null values in the API response to avoid runtime errors due to null safety in Dart.

3. Q: How did you manage the state in your app while calling the API?
A:
In this project, I used basic setState for managing UI updates after fetching the data. For more scalable projects, I would use state management solutions like Provider, Riverpod, or Bloc, but since this was a small-scale app, setState worked well for controlling the loading state and updating UI based on fetched data.

4. Q: What challenges did you face while integrating WebView, and how did you solve them?
A:
Initially, I faced issues where some URLs didn’t load properly or caused navigation errors. I resolved this by using the webview_flutter package and ensuring permissions were set correctly for Android and iOS. I also handled navigation controls within the WebView to prevent unexpected redirects and crashes.

5. Q: How did you structure your code for API calling?
A:
I created a separate file for the API service. Inside that, I wrote a function that uses http.get() to call the News API. The function is asynchronous and returns a list of news articles after decoding the JSON. I also created a custom model class to parse the data into Dart objects, making it easier to work with in the UI.

6. Q: How did you design the horizontal scroll for the 'Hottest News' section?
A:
I used ListView.builder with scrollDirection: Axis.horizontal to create the horizontal scroll view. Each item in the list was designed using a custom widget card that displays the image, title, and short description. It made the UI interactive and user-friendly.

7. Q: If you were to improve this app further, what would you add?
A:
I’d definitely add features like bookmarking articles, search functionality, and dark mode. I’d also implement offline caching so users can access previously loaded articles without internet. And for better scalability, I’d use Provider or Riverpod for state management and store user preferences locally using SharedPreferences.





