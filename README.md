#  Robot Testcase - Twitch
------------
Page Object Model (POM) | Design Pattern

Terminal to execute:
 robot -d {results_path} tests\Twitch.robot

### Test Cases  With GherkinTest Cases  With Gherkin
	Given the user use phone to open the browser
	Given the user go to twitch home page
	When the user type "Monster Hunter World" from the search bar
	And press the search button
	And check My Target Creator or scroll three list And go to movie
	Then go to select movie and play
------------

**Environmental Requirements:**
- Browser: Chrome, Chromedriver
- python: 3.8
- Robot Framework: 3.2.2
- Seleniumlibrary: 4.5

------------

