import ballerina/http as _;

@display {label: "Test Connector2", iconPath: "icon.png"}
public isolated client class SecondClient {
    final string url;

    public isolated function init(string url) returns error? {
        self.url = url;
    }

    public isolated function testFunc1(string arg1, int arg2, float arg3) returns boolean {
        return true;
    }

    public isolated function testFunc2(string arg1, int arg2, float arg3) returns boolean {
        return true;
    }

}
