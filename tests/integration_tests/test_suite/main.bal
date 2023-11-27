// Copyright (c) 2022, WSO2 Inc. (http://www.wso2.com) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

// Use packages pushed in previously pushed packages and implement something.
import bcentralintegration1/normal_package;
import bcentralintegration1/sample_connector;
import bcentralintegration1/sample_connector.module1;
import bcentralintegration1/sample_connector.module2;
import bcentralintegration1/sample_trigger;

public function greetAnimal() returns string {
    return "Hello " + normal_package:greet();
}

public function connectorMain() returns boolean {
    return sample_connector:testFuncMain("a",1,2);
}

public function connectorClientOne() returns boolean|error {
    module1:FirstClient firstClient = check new module1:FirstClient({}, "test");
    return firstClient.testFunc1("a",1,2);
}

public function connectorClientTwo() returns boolean|error {
    module2:SecondClient firstClient = check new module2:SecondClient("test");
    return firstClient.testFunc1("a",1,2);
}

boolean webhookRegistrationNotified = false;
string webhookHookType = "";

boolean issueCreationNotified = false;
string issueTitle = "";

boolean issueLabeledNotified = false;
string issueLabels = "";

boolean issueAssignedNotified = false;
string issueAssignee = "";

boolean issueEditedNotified = false;
sample_trigger:Changes? issueChanges = ();

int createdIssueNumber = -1;

configurable string githubSecret = "q234";

configurable sample_trigger:ListenerConfig userInput = {
    webhookSecret: githubSecret
};

listener sample_trigger:Listener githubListener = new (userInput, 8090);

service sample_trigger:IssuesService on githubListener {
    
    remote function onAssigned(sample_trigger:IssuesEvent payload) returns error? {
       issueAssignedNotified = true;
       sample_trigger:User assignee = <sample_trigger:User> payload.issue.assignee;
       issueAssignee = <@untainted> assignee.login;
    }

    remote function onClosed(sample_trigger:IssuesEvent payload) returns error? {
        return;
    } 

    remote function onLabeled(sample_trigger:IssuesEvent payload) returns error? {
        issueLabeledNotified = true;
        string receivedIssueLabels = "";
        foreach sample_trigger:Label label in payload.issue.labels {
            receivedIssueLabels += label.name;
        }
        issueLabels = <@untainted> receivedIssueLabels;
    }

    remote function onOpened(sample_trigger:IssuesEvent payload) returns error? {
        issueCreationNotified = true;
        issueTitle = <@untainted> payload.issue.title;
    }

    remote function onReopened(sample_trigger:IssuesEvent payload) returns error? {
        return;
    }

    remote function onUnassigned(sample_trigger:IssuesEvent payload) returns error? {
        return;
    }

    remote function onUnlabeled(sample_trigger:IssuesEvent payload) returns error? {
        return;
    }
}
