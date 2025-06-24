//
//  WeatherForecastService.swift
//  CloudCast
//
//  Created by Kyrylo Onishchenko on 6/21/25.
//

import Foundation

class WeatherForecastService {
    static func fetchForecast(latitude: Double,
                              longitude: Double,
                              completion: ((CurrentWeatherForecast) -> Void)? = nil) {
        let parameters = "latitude=\(latitude)&longitude=\(longitude)&current_weather=true&temperature_unit=fahrenheit&timezone=auto&windspeed_unit=mph"
        let url = URL(string: "https://api.open-meteo.com/v1/forecast?\(parameters)")!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                assertionFailure("Error: \(error!.localizedDescription)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                assertionFailure("Invalid response")
                return
            }
            guard let data = data, httpResponse.statusCode == 200 else {
                assertionFailure("Invalid response status code: \(httpResponse.statusCode)")
                return
            }

            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(WeatherAPIResponse.self, from: data)
                DispatchQueue.main.async {
                    completion?(response.currentWeather)
                }
            } catch {
                assertionFailure("Failed to decode weather data: \(error)")
            }
        }

        task.resume()
    }
}
