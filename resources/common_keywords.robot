*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Google
    [Arguments]    ${url}
    Open Browser    ${url}    chrome
    Maximize Browser Window

Verify Title
    [Arguments]    ${expected_title}
    ${title}=    Get Title
    Should Contain    ${title}    ${expected_title}

Close Browser Session
    Close Browser


Search With Wait
    [Documentation]    Opens a browser, searches for "Robot Framework" on the given URL, and verifies the page title contains the expected text.
    [Arguments]    ${expected_title}

    Wait Until Element Is Visible    name=q    timeout=10s
    Input Text    name=q    Robot Framework
    Press Keys    name=q    RETURN

    Wait Until Page Contains    Robot Framework    timeout=10s
    ${title}=    Get Title
    Should Contain    ${title}    ${expected_title}

    Close Browser


Browser is open to Bing
    Open Browser    https://bing.com    chrome
    Maximize Browser Window


User searches for "${term}"
    Input Text    name=q    ${term}
    Press Keys    name=q    RETURN


Page Should Contain "${term}"
    Page Should Contain     ${term}   