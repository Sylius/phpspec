Feature: Developer generates a class
  As a Developer
  I want the tests to automatically rerun after code generation events
  In order to avoid repetitive tasks and interruptions in development flow

  Scenario: Rerun after class generation
    Given I have started describing the "CodeGeneration/RerunExample1/Markdown" class
    When I run phpspec and answer "y" when asked if I want to generate the code
    Then the tests should be rerun

  Scenario: Rerun after method generation
    Given the spec file "spec/CodeGeneration/RerunExample2/MarkdownSpec.php" contains:
      """
      <?php

      namespace spec\CodeGeneration\RerunExample2;

      use PhpSpec\ObjectBehavior;
      use Prophecy\Argument;

      class MarkdownSpec extends ObjectBehavior
      {
          function it_converts_plain_text_to_html_paragraphs()
          {
              $this->toHtml('Hi, there')->shouldReturn('<p>Hi, there</p>');
          }
      }

      """
    And the class file "src/CodeGeneration/RerunExample2/Markdown.php" contains:
      """
      <?php

      namespace CodeGeneration\RerunExample2;

      class Markdown
      {
      }

      """
    When I run phpspec and answer "y" when asked if I want to generate the code
    Then the tests should be rerun