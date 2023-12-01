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

type Package record {
    string organization;
    string name;
    string 'version;
    string URL;
    string visibility;
    Module[] modules;
};

type Module record {
    string name;
    string apiDocURL;
    string packageURL;
};

type DocModule record {
    ModuleInfo[] modules;
};

type ModuleInfo record {
    string id;
    RelatedModule[] relatedModules;
    FunctionInfo[] functions;
    anydata[] records;
    anydata[] objectTypes;
    anydata[] listeners; 
    anydata[] types; 
    anydata[] enums; 
    anydata[] serviceTypes;
    anydata[] unionTypes;
};

type FunctionInfo record {
    string name;
};

type RelatedModule record {
    string id;
    string summary;
    string orgName;
    string 'version;
    boolean isDefaultModule;
};

type APIDocResponse record {
    DocModule docsData;
    SearchData searchData;
};

type SearchData record {
    Function[] functions;
};

type Function record {
    string description;
    string id;
    string moduleId;
    string moduleOrgName;
    string moduleVersion;
};
