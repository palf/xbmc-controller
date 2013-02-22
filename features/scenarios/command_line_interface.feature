Feature: Command-Line Interface

  Some examples of what the CLI should return and how it should operate.

  Scenario: Initial launch shows help information
    Given I run `xbmc controller` interactively
    Then I should see the following:

      | This is the interactive menu for XBMC                            |
      | It populates itself with data from the JSONRPC Introspect call   |
      | Your contents may vary based on the version of XBMC targeted     |

      | Positive comments and suggestions can be sent via Twitter        |
      | #jackpalf                                                        |

      | Negative feedback is best publised via Trello (then I'll fix it) |

