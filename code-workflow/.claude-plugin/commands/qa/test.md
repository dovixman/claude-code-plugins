---
argument-hint: [file_to_test][existing_test_reference]
description: "Create or update tests for a given file"
---

# Task
- Given a test file by the user on the $ARGUMENTS, check for the changes made to the file and create or update the related tests using the structure and style of the existing tests on the same project or folder.
- If the user gives an argument for existing_test_reference on the $ARGUMENTS, use that specific tests as reference for structure and style.
- Once you modify the tests, execute them to verify that the tests pass correctly, if not, fix them until they all pass correctly.
- Always check if there is existing test configuration to be reused. For example, if the tests are being created for a Python file, check if the conftest.py exists, and any of the fixtures can be reused. Do the same with the relevant files for each language.
