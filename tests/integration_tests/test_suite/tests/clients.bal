// Copyright (c) 2023, WSO2 Inc. (http://www.wso2.com) All Rights Reserved.
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

import ballerina/os;
import ballerina/http;

configurable string apiUrl = os:getEnv("API_URL");
configurable string docsUrl = os:getEnv("DOCS_URL");

http:Client centralApiClient = check new (apiUrl + "/2.0/");
http:Client apiDocsClient = check new (docsUrl, {
    timeout: 20
});
