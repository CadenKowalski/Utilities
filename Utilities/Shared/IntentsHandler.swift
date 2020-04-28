//
//  IntentsHandler.swift
//  IntentsKit
//
//  Created by Caden Kowalski on 4/27/20.
//  Copyright © 2020 Caden Kowalski. All rights reserved.
//

import Foundation
import CloudKit

public class IntentsHandler: NSObject, SleepIntentHandling {
        
    public func handle(intent: SleepIntent, completion: @escaping (SleepIntentResponse) -> Void) {
        let hour = Calendar.current.component(.hour, from: Date())
        if hour > 19 || hour < 4 {
            goingToBed() { error in
                if error == nil {
                    completion(.success(successMessage: "Good Night"))
                } else {
                    completion(.failure(failureMessage: "\(error!)"))
                }
            }
        } else {
            wakingUp() { error in
                if error == nil {
                    completion(.success(successMessage: "Good morning Caden, you slept for ..."))
                } else {
                    completion(.failure(failureMessage: "\(error!)"))
                }
            }
        }
    }
    
    func goingToBed(completion: @escaping(String?) -> Void) {
        completion(nil)
    }
    
    func wakingUp(completion: @escaping(String?) -> Void) {
        
    }
}
