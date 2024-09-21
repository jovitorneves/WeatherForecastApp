//
//  Bindable.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 19/09/24.
//

import Foundation

class Bindable<T> {
    typealias Listener = (T) -> Void
    
    var value: T {
        didSet {
            listeners.forEach { $0(value) }
        }
    }
    
    var listeners: [Listener] = []
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ listener: @escaping (T) -> Void) {
        self.listeners.append(listener)
    }
    
    func unbindAll() {
        listeners.removeAll()
    }
}
