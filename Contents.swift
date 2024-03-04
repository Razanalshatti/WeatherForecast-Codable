import UIKit

struct Weather: Codable{
    var city: String
    var temperature: Int
    var condition: String
    var forecast: [Forecast]
}

struct Forecast: Codable{
    var day: String
    var high: Int
    var low: Int
    var condition: String
}

let jsonData = """
{
    "city": "Kuwait",
    "temperature": 25,
    "condition": "Sunny",
    "forecast": [
        {
            "day": "Monday",
            "high": 29,
            "low": 17,
            "condition": "Partly Cloudy"
        },
        {
            "day": "Tuesday",
            "high": 18,
            "low": 13,
            "condition": "Rain"
        }
    ]
}
""".data(using: .utf8)!

do{
    let weathers = try JSONDecoder().decode(Weather.self, from: jsonData)
    print("in \(weathers.city) : weather is \(weathers.temperature)")
    
    for forecast in weathers.forecast {
            print("\(forecast.day): High \(forecast.high), Low \(forecast.low), \(forecast.condition)")
       
    }
}
catch{
    print(error)
}


