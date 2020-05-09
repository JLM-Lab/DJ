//
//  XDDateFormatter.swift
//  xyyd
//
//  Created by JLM on 2020/2/13.
//  Copyright © 2020 ccw. All rights reserved.
//

import Foundation

class XDDateFormatter: DateFormatter {
    static let shared = XDDateFormatter()
    private override init() {
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func format(_ str: String) -> XDDateFormatter {
        self.dateFormat = str
        return self
    }
}

