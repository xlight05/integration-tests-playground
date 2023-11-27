import ballerina/http as _;

@display {label: "Test Connector2", iconPath: "icon.png"}
public isolated client class FirstClient {
    final string authToken;

    public isolated function init(map<string> testMapVal, string auth) returns error? {
        self.authToken = auth;
    }
    
    public isolated function testFunc1(string arg1, int arg2, float arg3) returns boolean {
        return true;
    }

    public isolated function testFunc2(string arg1, int arg2, float arg3) returns boolean {
        return true;
    }

    remote isolated function testFunc3(string arg1, int arg2, float arg3) returns boolean|error {
        return true;
    }
}
