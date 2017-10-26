Handle exceptions:
  based on: strictyaml
  description: |
    When raising exceptions, you can add a label that will replace
    <unicode string> with whatever you want.
  preconditions:
    setup: |
      from strictyaml import Map, Int, load, YAMLValidationError
    yaml_snippet: |
      a: 1
      b:
        - 1
        - 2
  scenario:
  - Run:
      code: |
        load(yaml_snippet, Map({"a": Int(), "b": Map({"x": Int(), "y": Int()})}), label="myfilename")
      raises:
        type: strictyaml.exceptions.YAMLValidationError
        message: |-
          when expecting a mapping
            in "myfilename", line 2, column 1:
              b:
              ^ (line: 2)
          found non-mapping
            in "myfilename", line 4, column 1:
              - '2'
              ^ (line: 4)
