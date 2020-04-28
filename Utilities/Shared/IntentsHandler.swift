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
    
    public func handle(intent: SleepIntent, completion: @escaping (SleepIntentResponse) -> Void) {
        let hour = Calendar.current.component(.hour, from: Date())
        if hour > 19 || hour < 4 {
            completion(.success(timeOfDay: "Going to bed"))
        } else {
            completion(.success(timeOfDay: "Waking up"))
        }
    }
    
    public func resolveStartTime(for intent: TimeIntent, with completion: @escaping (INDateComponentsResolutionResult) -> Void) {
        guard let timeSlept = intent.startTime else {
            completion(INDateComponentsResolutionResult.needsValue())
            return
        }
        
        completion(INDateComponentsResolutionResult.success(with: timeSlept))
    }
    
    public func handle(intent: TimeIntent, completion: @escaping (TimeIntentResponse) -> Void) {
        let calendar = Calendar.current
        let timeBetweenDates = calendar.dateComponents([.hour, .minute], from: calendar.date(from: intent.startTime!)!, to: Date())
        completion(.success(timeSleptString: "Good morning Caden, you slept for \(String(describing: timeBetweenDates.hour)) hours and \(String(describing: timeBetweenDates.minute)) minutes last night"))
    }
}
