//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Ozgun Efe on 15/07/2024.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack{
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing: 15) {
                            Image(systemName: "cloud.sun")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDoube() + "°")
                            .font(.system(size: 90))
                            . fontWeight(.bold)
                    }
                    .padding(.bottom, -5)
                    .padding(.top, 15)
                    .padding(.horizontal, 5)
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather Now")
                        .bold()
                        .padding(.bottom)
                    
                    HStack{
                        VStack{
                            WeatherRow(logo: "thermometer", name: "Min temperature", value: (weather.main.tempMin.roundDoube() + "°"))

                            WeatherRow(logo: "thermometer", name: "Max temperature", value: (weather.main.tempMax.roundDoube() + "°"))
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading){
                            WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDoube() + " m/s"))

                            WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDoube() + "%"))
                        }
                    }
                    .padding(.bottom, 10)

                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.65, saturation: 0.78, brightness: 0.355))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.65, saturation: 0.78, brightness: 0.355))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
