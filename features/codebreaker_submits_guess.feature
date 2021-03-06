Feature: code-breaker submits guess

  As a code-breaker
  I want to submit a guess
  So that I can try to break the code

  Scenario Outline: submit guess
    Given the secret code is "<code>"
    When I guess "<guess>"
    Then the mark should be "<mark>"

  Examples: no matches 
    | code | guess | mark | 
    | 1234 | 5555  |      |

  Examples: 1 number correct 
    | code | guess | mark | 
    | 1234 | 1555  |  +   | 
    | 1234 | 2555  |  -   |

  Examples: 2 numbers correct 
    | code | guess | mark | 
    | 1234 | 5254  | ++   | 
    | 1234 | 5154  | +-   | 
    | 1234 | 2545  | --   |

  Examples: 3 numbers correct 
    | code | guess | mark | 
    | 1234 | 5234  | +++  | 
    | 1234 | 5134  | ++-  | 
    | 1234 | 5124  | +--  | 
    | 1234 | 5123  | ---  |

  Examples: all numbers correct 
    | code | guess | mark | 
    | 1234 | 1234  | ++++ | 
    | 1234 | 1243  | ++-- | 
    | 1234 | 1423  | +--- | 
    | 1234 | 4321  | ---- |