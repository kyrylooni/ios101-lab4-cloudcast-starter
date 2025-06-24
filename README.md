# 🌤️ Lab 4 – CloudCast Pt. 2

**Student:** Kyrylo Onishchenko   
**Date:** June 2025  


For this unit, we'll be continuing with our Cloudcast app by fetching and displaying real data from the internet! You will also learn a useful tool called Postman that allows you to create web requests and inspect network responses from remote servers. After this unit, you will have a basic app that shows real weather data from multiple locations to users!

## ✅ What’s Done

- Integrated the Open-Meteo API to fetch real-time weather data
- Created a `WeatherForecastService` class to handle network requests using `URLSession`
- Defined data models (`WeatherAPIResponse`, `CurrentWeatherForecast`, `WeatherCode`) using Swift’s `Decodable`
- Dynamically displayed:
  - City name
  - Temperature
  - Weather description
  - Wind speed and direction
  - Forecast image based on weather condition
  - Current date
- Enabled navigation between multiple predefined locations (San Jose, Manila, Italy)
- Applied gradient background styling with `CAGradientLayer`
- Used `DateFormatter` for date display
- Implemented IBOutlet connections to update the UI with live data

## ⚠️ Challenges Faced

- Debugging and fixing incorrect IBOutlet connections (e.g. `temperatureLable` typo)
- Resolving storyboard constraint conflicts caused by duplicate or mismatched layout rules
- Mapping API JSON keys to Swift properties using `CodingKeys`
- Handling thread safety to ensure UI updates happened on the main thread
- Structuring the API response model correctly to decode nested JSON

---