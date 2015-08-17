// The MIT License (MIT)
//
// Copyright (c) 2015 Hatena Co., Ltd.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import XCTest

class GitHubSearchUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSearch() {
        let app = XCUIApplication()
        app.tables["Empty list"].searchFields["Search"].tap()

        let searchSearchField = app.searchFields["Search"]

        searchSearchField.tap()
        let nextKeyboardButton = app.buttons["Next keyboard"]
        nextKeyboardButton.pressForDuration(1.0);
        app.staticTexts["English (US)"].tap()

        searchSearchField.typeText("Hatena")
        app.typeText("\n")

        let tablesQuery = app.tables
        tablesQuery.cells.staticTexts["hatena/Hatena-Textbook"].tap()
        app.buttons["https://github.com/hatena/Hatena-Textbook"].tap()
        app.buttons["Done"].tap()
        app.navigationBars["Hatena-Textbook"].buttons["GitHub Search"].tap()
    }

}
