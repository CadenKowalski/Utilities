//
//  IntentsHandler.swift
//  IntentsKit
//
//  Created by Caden Kowalski on 4/27/20.
//  Copyright © 2020 Caden Kowalski. All rights reserved.
//

import Foundation
import Intents

public class IntentsHandler: NSObject, SleepIntentHandling, TimeIntentHandling {
    
    public func handle(intent: SleepIntent, completion: @escaping(SleepIntentResponse) -> Void) {
        let hour = Calendar.current.component(.hour, from: Date())
        if hour > 20 || hour < 4 {
            completion(.success(action: "Sleeping"))
        } else if hour > 3 && hour < 12 {
            completion(.success(action: "Waking"))
        }
    }
    
    public func resolveStartTime(for intent: TimeIntent, with completion: @escaping(INDateComponentsResolutionResult) -> Void) {
        guard let timeSlept = intent.startTime else {
            completion(INDateComponentsResolutionResult.needsValue())
            return
        }
        
        completion(INDateComponentsResolutionResult.success(with: timeSlept))
    }
    
    public func handle(intent: TimeIntent, completion: @escaping(TimeIntentResponse) -> Void) {
        let calendar = Calendar.current
        let startTime = calendar.date(from: intent.startTime!)!
        let timeBetweenDates = calendar.dateComponents([.hour, .minute], from: startTime, to: Date())
        guard let hour = timeBetweenDates.hour else { return }
        guard let minute = timeBetweenDates.minute else { return }
        completion(.success(timeSleptString: "you slept for \(String(describing: hour)) hours and \(String(describing: minute)) minutes last night"))
    }
    
    public func handle(intent: WeatherIntent, completion: @escaping(WeatherIntentResponse) -> Void) {
        let calendar = Calendar.current
        let date = Date()
        let hour = calendar.dateComponents([.hour], from: date)
        let returnedHour = 18 - Int(String(describing: hour))!
        completion(.success(timeIndex: NSNumber(value: returnedHour)))
    }
}
