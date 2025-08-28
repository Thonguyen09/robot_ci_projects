*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common_keywords.robot

*** Test Cases ***
Verify Google Homepage Load
    [Setup]    Open Google    https://google.com
    [Teardown]    Close Browser Session
    Verify Title    Google


Verify Search Functionality
    [Setup]    Open Google    https://google.com
    [Teardown]    Close Browser Session
    Search With Wait    Robot Framework


Verify Search Using Gherkin Style
    Given Browser is open to Bing
    When User searches for "Gherkin"
    Then Page Should Contain "Gherkin"