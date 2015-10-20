
Feature: memoria de cantidad de operaciones

  Scenario: no hice operaciones
    Given no hice operaciones
    Then la cantidad de operaciones es 0

  Scenario: cuando hago operaciones la cantidad de incrementa
    Given hago una suma
    And hago una resta
    Then la cantidad de operaciones es 2
  
  Scenario: cuando reseteo la cantidad de operaciones vuelve a cero
    Given hago una suma
    And hago una resta
    And reseteo la memoria
    Then la cantidad de operaciones es 0

  Scenario: cuando hago un promedio la cantidad se incrementa
    Given hago un promedio
    Then la cantidad de operaciones es 1
