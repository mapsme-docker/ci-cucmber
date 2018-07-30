Feature: Index localads page
  Lets check default localads page

  Background:
    Given I navigate to main localads page

  Scenario: 1. Header
    Then Page has header
    And I can see cookie message
    And Page has logo
    And Logo is not clickable
    And "Get started" button is link to "cabinet/dashboard"
    And Language "English" exist on page
    And Language "Русский" exist on page
    And Language "Deutsch" exist on page
    And Language "Español" exist on page
    And Language "Français" exist on page
    And Language "Italiano" exist on page
    And Language "Nederlands" exist on page
    And Language "Polski" exist on page
    And Language "Türkçe" exist on page
    And Language column count is 2
    #And "Sign in" button is link to "cabinet/dashboard"

  Scenario: 2. LocalAds Advertisment
    Then Advertisement features exist
    And I can see image "money.svg"
    And I can see image "map_with_lock.png"
    And "Get instant access" button is link to "cabinet/dashboard"
    And Link "Log in" is direct to "cabinet/dashboard"

  Scenario: 3. Advertisers
    Then Advertisers block is exist
    And I have following advertisers:
        | uber    |
        | viator  |
        | disney  |
        | booking |

  Scenario: 4. About
    Then About MapsMe block exist
    And App Store button exist
    And Google play button exist

  Scenario: 5. Steps to create new campaign
    Then Block with steps exist
    And Step with text "Find your business" exist
    # There nbsp after 'in'
    And Step with text "Set up in" exist
    And Step with text "Meet new clients" exist

  Scenario: 6. Tariff
    Then Block with tariff exist
    And Slider exist
    And Phone with slider exist

  Scenario: 7. Calculator
    Then Block with tariff exist
    And Slider exist

  Scenario: 8. Click to action
    Then Block click to action exist
    And First "Instant access" button exist

  Scenario: 9. Case studies
    Then Block case studies exist
    And Mini review count is 3

  Scenario: 10. FAQ
    Then Block FAQ exist
    And Questions count is 3

  Scenario: 11. Contact Us
    Then Block contact us exist
    And Page contains link "mailto:business@maps.me"
    And Page contains link "https://www.facebook.com/MapsWithMe/"
    And Page contains link "https://vk.com/mapsme"
    And I can't see footer
