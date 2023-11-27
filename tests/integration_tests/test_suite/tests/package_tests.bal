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

import ballerina/test;
import ballerina/http;

@test:Config { }
function testPackageUse() {
    string greetingResponse = greetAnimal();
    test:assertEquals(greetingResponse, "Hello Woof!");
}

@test:Config { }
function testNormalPackage() returns error? {

    //UI Page
    http:Response resp = check centralClient -> get("bcentralintegration1/normal_package");
    test:assertEquals(resp.statusCode, 200);

    //API
    Package packageResp = check centralApiClient -> get("registry/packages/bcentralintegration1/normal_package/0.1.0");
    test:assertEquals(packageResp.organization, "bcentralintegration1");
    test:assertEquals(packageResp.name, "normal_package");
    test:assertEquals(packageResp.'version, "0.1.0");
    test:assertEquals(packageResp.URL, "/bcentralintegration1/normal_package/0.1.0");
    test:assertEquals(packageResp.visibility, "public");
}

@test:Config { }
function testNormalPackageApiDocs() returns error? {
    http:Response resp = check apiDocsClient -> get("bcentralintegration1/normal_package/0.1.0");
    test:assertEquals(resp.statusCode, 200);

    string[] versions = check centralApiClient -> get("registry/packages/bcentralintegration1/normal_package?include-prereleases=true");
    test:assertEquals(versions[0], "0.1.0");

    APIDocResponse apiDocsResp = check centralApiClient -> get("docs/bcentralintegration1/normal_package/0.1.0");
    test:assertEquals(apiDocsResp.searchData.functions[0].id, "greet");
}
