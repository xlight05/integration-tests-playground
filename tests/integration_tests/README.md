### Ballerina Central Integration tests
These Integration tests will be invoked from `run_integration_tests.yml`. 


### Test Packages
`test_packages` will be automatically built and push to central from the workflow.Test package could be any ballerina package that needs to be tested. However, there are few restrictions in the folder structure and `Ballerina.toml`
1. The package folder name should be same as package.name in Ballerina.toml
2. The package.org should be "bctestorg"
3. The package.version should be "0.1.0"

### Test Suite

`bal test` command will be executed on the `test_suite` directory during the integration test. When you are writing a test case, you should import the package and write the test case to cover the scenario.
