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

import ballerina/test;
import ballerina/http;
import ballerina/lang.runtime;

string createdIssueTitle = "This is a test issue";
string updatedIssueTitle = "Updated Issue Title";
string[] createdIssueLabelArray = ["bug", "critical"];

http:Client clientEndpoint = check new ("http://localhost:8090");
@test:Config {
    enable: true
}
function testWebhookNotificationOnIssueCreation() {
    json eventPayload = {
        "action": "opened",
        "issue": {
            "url": "https://api.github.com/repos/ABCUser/samplestest/issues/14",
            "repository_url": "https://api.github.com/repos/ABCUser/samplestest",
            "labels_url": "https://api.github.com/repos/ABCUser/samplestest/issues/14/labels{/name}",
            "comments_url": "https://api.github.com/repos/ABCUser/samplestest/issues/14/comments",
            "events_url": "https://api.github.com/repos/ABCUser/samplestest/issues/14/events",
            "html_url": "https://github.com/ABCUser/samplestest/issues/14",
            "id": 1177868299,
            "node_id": "I_kwDOFfuAD85GNNgL",
            "number": 14,
            "title": "This is a test issue",
            "user": {
            "login": "ABCUser",
            "id": 3378323,
            "node_id": "MDQ6VXNlcjMzNzgzMjM=",
            "avatar_url": "https://avatars.githubusercontent.com/u/3378323?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ABCUser",
            "html_url": "https://github.com/ABCUser",
            "followers_url": "https://api.github.com/users/ABCUser/followers",
            "following_url": "https://api.github.com/users/ABCUser/following{/other_user}",
            "gists_url": "https://api.github.com/users/ABCUser/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ABCUser/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ABCUser/subscriptions",
            "organizations_url": "https://api.github.com/users/ABCUser/orgs",
            "repos_url": "https://api.github.com/users/ABCUser/repos",
            "events_url": "https://api.github.com/users/ABCUser/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ABCUser/received_events",
            "type": "User",
            "site_admin": false
            },
            "labels": [

            ],
            "state": "open",
            "locked": false,
            "assignee": null,
            "assignees": [

            ],
            "milestone": null,
            "comments": 0,
            "created_at": "2022-03-23T09:46:18Z",
            "updated_at": "2022-03-23T09:46:18Z",
            "closed_at": null,
            "author_association": "OWNER",
            "active_lock_reason": null,
            "body": null,
            "reactions": {
            "url": "https://api.github.com/repos/ABCUser/samplestest/issues/14/reactions",
            "total_count": 0,
            "+1": 0,
            "-1": 0,
            "laugh": 0,
            "hooray": 0,
            "confused": 0,
            "heart": 0,
            "rocket": 0,
            "eyes": 0
            },
            "timeline_url": "https://api.github.com/repos/ABCUser/samplestest/issues/14/timeline",
            "performed_via_github_app": null
        },
        "repository": {
            "id": 368803855,
            "node_id": "MDEwOlJlcG9zaXRvcnkzNjg4MDM4NTU=",
            "name": "samplestest",
            "full_name": "ABCUser/samplestest",
            "private": false,
            "owner": {
            "login": "ABCUser",
            "id": 3378323,
            "node_id": "MDQ6VXNlcjMzNzgzMjM=",
            "avatar_url": "https://avatars.githubusercontent.com/u/3378323?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ABCUser",
            "html_url": "https://github.com/ABCUser",
            "followers_url": "https://api.github.com/users/ABCUser/followers",
            "following_url": "https://api.github.com/users/ABCUser/following{/other_user}",
            "gists_url": "https://api.github.com/users/ABCUser/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ABCUser/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ABCUser/subscriptions",
            "organizations_url": "https://api.github.com/users/ABCUser/orgs",
            "repos_url": "https://api.github.com/users/ABCUser/repos",
            "events_url": "https://api.github.com/users/ABCUser/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ABCUser/received_events",
            "type": "User",
            "site_admin": false
            },
            "html_url": "https://github.com/ABCUser/samplestest",
            "description": null,
            "fork": false,
            "url": "https://api.github.com/repos/ABCUser/samplestest",
            "forks_url": "https://api.github.com/repos/ABCUser/samplestest/forks",
            "keys_url": "https://api.github.com/repos/ABCUser/samplestest/keys{/key_id}",
            "collaborators_url": "https://api.github.com/repos/ABCUser/samplestest/collaborators{/collaborator}",
            "teams_url": "https://api.github.com/repos/ABCUser/samplestest/teams",
            "hooks_url": "https://api.github.com/repos/ABCUser/samplestest/hooks",
            "issue_events_url": "https://api.github.com/repos/ABCUser/samplestest/issues/events{/number}",
            "events_url": "https://api.github.com/repos/ABCUser/samplestest/events",
            "assignees_url": "https://api.github.com/repos/ABCUser/samplestest/assignees{/user}",
            "branches_url": "https://api.github.com/repos/ABCUser/samplestest/branches{/branch}",
            "tags_url": "https://api.github.com/repos/ABCUser/samplestest/tags",
            "blobs_url": "https://api.github.com/repos/ABCUser/samplestest/git/blobs{/sha}",
            "git_tags_url": "https://api.github.com/repos/ABCUser/samplestest/git/tags{/sha}",
            "git_refs_url": "https://api.github.com/repos/ABCUser/samplestest/git/refs{/sha}",
            "trees_url": "https://api.github.com/repos/ABCUser/samplestest/git/trees{/sha}",
            "statuses_url": "https://api.github.com/repos/ABCUser/samplestest/statuses/{sha}",
            "languages_url": "https://api.github.com/repos/ABCUser/samplestest/languages",
            "stargazers_url": "https://api.github.com/repos/ABCUser/samplestest/stargazers",
            "contributors_url": "https://api.github.com/repos/ABCUser/samplestest/contributors",
            "subscribers_url": "https://api.github.com/repos/ABCUser/samplestest/subscribers",
            "subscription_url": "https://api.github.com/repos/ABCUser/samplestest/subscription",
            "commits_url": "https://api.github.com/repos/ABCUser/samplestest/commits{/sha}",
            "git_commits_url": "https://api.github.com/repos/ABCUser/samplestest/git/commits{/sha}",
            "comments_url": "https://api.github.com/repos/ABCUser/samplestest/comments{/number}",
            "issue_comment_url": "https://api.github.com/repos/ABCUser/samplestest/issues/comments{/number}",
            "contents_url": "https://api.github.com/repos/ABCUser/samplestest/contents/{+path}",
            "compare_url": "https://api.github.com/repos/ABCUser/samplestest/compare/{base}...{head}",
            "merges_url": "https://api.github.com/repos/ABCUser/samplestest/merges",
            "archive_url": "https://api.github.com/repos/ABCUser/samplestest/{archive_format}{/ref}",
            "downloads_url": "https://api.github.com/repos/ABCUser/samplestest/downloads",
            "issues_url": "https://api.github.com/repos/ABCUser/samplestest/issues{/number}",
            "pulls_url": "https://api.github.com/repos/ABCUser/samplestest/pulls{/number}",
            "milestones_url": "https://api.github.com/repos/ABCUser/samplestest/milestones{/number}",
            "notifications_url": "https://api.github.com/repos/ABCUser/samplestest/notifications{?since,all,participating}",
            "labels_url": "https://api.github.com/repos/ABCUser/samplestest/labels{/name}",
            "releases_url": "https://api.github.com/repos/ABCUser/samplestest/releases{/id}",
            "deployments_url": "https://api.github.com/repos/ABCUser/samplestest/deployments",
            "created_at": "2021-05-19T08:52:12Z",
            "updated_at": "2021-05-19T08:55:58Z",
            "pushed_at": "2021-05-19T08:55:56Z",
            "git_url": "git://github.com/ABCUser/samplestest.git",
            "ssh_url": "git@github.com:ABCUser/samplestest.git",
            "clone_url": "https://github.com/ABCUser/samplestest.git",
            "svn_url": "https://github.com/ABCUser/samplestest",
            "homepage": null,
            "size": 0,
            "stargazers_count": 0,
            "watchers_count": 0,
            "language": null,
            "has_issues": true,
            "has_projects": true,
            "has_downloads": true,
            "has_wiki": true,
            "has_pages": false,
            "forks_count": 0,
            "mirror_url": null,
            "archived": false,
            "disabled": false,
            "open_issues_count": 13,
            "license": null,
            "allow_forking": true,
            "is_template": false,
            "topics": [

            ],
            "visibility": "public",
            "forks": 0,
            "open_issues": 13,
            "watchers": 0,
            "default_branch": "main"
        },
        "sender": {
            "login": "ABCUser",
            "id": 3378323,
            "node_id": "MDQ6VXNlcjMzNzgzMjM=",
            "avatar_url": "https://avatars.githubusercontent.com/u/3378323?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ABCUser",
            "html_url": "https://github.com/ABCUser",
            "followers_url": "https://api.github.com/users/ABCUser/followers",
            "following_url": "https://api.github.com/users/ABCUser/following{/other_user}",
            "gists_url": "https://api.github.com/users/ABCUser/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ABCUser/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ABCUser/subscriptions",
            "organizations_url": "https://api.github.com/users/ABCUser/orgs",
            "repos_url": "https://api.github.com/users/ABCUser/repos",
            "events_url": "https://api.github.com/users/ABCUser/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ABCUser/received_events",
            "type": "User",
            "site_admin": false
        }
    };

    http:Request req = new;
    req.setPayload(eventPayload.toJsonString());
    req.setHeader("X-GitHub-Event", "issues");
    http:Response|error issueCreationPayload =  clientEndpoint->post("/", req);

    if (issueCreationPayload is error) {
        test:assertFail(msg = "Issue creation failed: " + issueCreationPayload.message());
    } else {
        test:assertTrue(issueCreationPayload.statusCode === 200, msg = "expected a 200 status code. Found " + issueCreationPayload.statusCode.toBalString());
        test:assertEquals(issueCreationPayload.getTextPayload(), "Event acknoledged successfully", msg = "");
    }

    int counter = 10;
    while (!issueCreationNotified && counter >= 0) {
        runtime:sleep(1);
        counter -= 1;
    }
    test:assertTrue(issueCreationNotified, msg = "expected an issue creation notification");
    test:assertEquals(issueTitle, createdIssueTitle, msg = "invalid issue title");
}

@test:Config {
    dependsOn: [testWebhookNotificationOnIssueCreation],
    enable: true
}
function testWebhookNotificationOnIssueLabeling() {
    json eventPayload =  {
        "action": "labeled",
        "issue": {
            "url": "https://api.github.com/repos/ABCUser/samplestest/issues/22",
            "repository_url": "https://api.github.com/repos/ABCUser/samplestest",
            "labels_url": "https://api.github.com/repos/ABCUser/samplestest/issues/22/labels{/name}",
            "comments_url": "https://api.github.com/repos/ABCUser/samplestest/issues/22/comments",
            "events_url": "https://api.github.com/repos/ABCUser/samplestest/issues/22/events",
            "html_url": "https://github.com/ABCUser/samplestest/issues/22",
            "id": 1227419315,
            "node_id": "I_kwDOFfuAD85JKO6z",
            "number": 22,
            "title": "UserTestIssue",
            "user": {
            "login": "ABCUser",
            "id": 3378323,
            "node_id": "MDQ6VXNlcjMzNzgzMjM=",
            "avatar_url": "https://avatars.githubusercontent.com/u/3378323?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ABCUser",
            "html_url": "https://github.com/ABCUser",
            "followers_url": "https://api.github.com/users/ABCUser/followers",
            "following_url": "https://api.github.com/users/ABCUser/following{/other_user}",
            "gists_url": "https://api.github.com/users/ABCUser/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ABCUser/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ABCUser/subscriptions",
            "organizations_url": "https://api.github.com/users/ABCUser/orgs",
            "repos_url": "https://api.github.com/users/ABCUser/repos",
            "events_url": "https://api.github.com/users/ABCUser/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ABCUser/received_events",
            "type": "User",
            "site_admin": false
            },
            "labels": [
            {
                "id": 3012706683,
                "node_id": "MDU6TGFiZWwzMDEyNzA2Njgz",
                "url": "https://api.github.com/repos/ABCUser/samplestest/labels/bug",
                "name": "bug",
                "color": "d73a4a",
                "default": true,
                "description": "Something isn't working"
            },
            {
                "id": 3012706685,
                "node_id": "MDU6TGFiZWwzMDEyNzA2Njg1",
                "url": "https://api.github.com/repos/ABCUser/samplestest/labels/documentation",
                "name": "documentation",
                "color": "0075ca",
                "default": true,
                "description": "Improvements or additions to documentation"
            }
            ],
            "state": "open",
            "locked": false,
            "assignee": {
            "login": "ABCUser",
            "id": 3378323,
            "node_id": "MDQ6VXNlcjMzNzgzMjM=",
            "avatar_url": "https://avatars.githubusercontent.com/u/3378323?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ABCUser",
            "html_url": "https://github.com/ABCUser",
            "followers_url": "https://api.github.com/users/ABCUser/followers",
            "following_url": "https://api.github.com/users/ABCUser/following{/other_user}",
            "gists_url": "https://api.github.com/users/ABCUser/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ABCUser/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ABCUser/subscriptions",
            "organizations_url": "https://api.github.com/users/ABCUser/orgs",
            "repos_url": "https://api.github.com/users/ABCUser/repos",
            "events_url": "https://api.github.com/users/ABCUser/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ABCUser/received_events",
            "type": "User",
            "site_admin": false
            },
            "assignees": [
            {
                "login": "ABCUser",
                "id": 3378323,
                "node_id": "MDQ6VXNlcjMzNzgzMjM=",
                "avatar_url": "https://avatars.githubusercontent.com/u/3378323?v=4",
                "gravatar_id": "",
                "url": "https://api.github.com/users/ABCUser",
                "html_url": "https://github.com/ABCUser",
                "followers_url": "https://api.github.com/users/ABCUser/followers",
                "following_url": "https://api.github.com/users/ABCUser/following{/other_user}",
                "gists_url": "https://api.github.com/users/ABCUser/gists{/gist_id}",
                "starred_url": "https://api.github.com/users/ABCUser/starred{/owner}{/repo}",
                "subscriptions_url": "https://api.github.com/users/ABCUser/subscriptions",
                "organizations_url": "https://api.github.com/users/ABCUser/orgs",
                "repos_url": "https://api.github.com/users/ABCUser/repos",
                "events_url": "https://api.github.com/users/ABCUser/events{/privacy}",
                "received_events_url": "https://api.github.com/users/ABCUser/received_events",
                "type": "User",
                "site_admin": false
            }
            ],
            "milestone": null,
            "comments": 0,
            "created_at": "2022-05-06T04:56:16Z",
            "updated_at": "2022-05-06T04:56:26Z",
            "closed_at": null,
            "author_association": "OWNER",
            "active_lock_reason": null,
            "body": "asdas",
            "reactions": {
            "url": "https://api.github.com/repos/ABCUser/samplestest/issues/22/reactions",
            "total_count": 0,
            "+1": 0,
            "-1": 0,
            "laugh": 0,
            "hooray": 0,
            "confused": 0,
            "heart": 0,
            "rocket": 0,
            "eyes": 0
            },
            "timeline_url": "https://api.github.com/repos/ABCUser/samplestest/issues/22/timeline",
            "performed_via_github_app": null
        },
        "label": {
            "id": 3012706683,
            "node_id": "MDU6TGFiZWwzMDEyNzA2Njgz",
            "url": "https://api.github.com/repos/ABCUser/samplestest/labels/bug",
            "name": "bug",
            "color": "d73a4a",
            "default": true,
            "description": "Something isn't working"
        },
        "repository": {
            "id": 368803855,
            "node_id": "MDEwOlJlcG9zaXRvcnkzNjg4MDM4NTU=",
            "name": "samplestest",
            "full_name": "ABCUser/samplestest",
            "private": false,
            "owner": {
            "login": "ABCUser",
            "id": 3378323,
            "node_id": "MDQ6VXNlcjMzNzgzMjM=",
            "avatar_url": "https://avatars.githubusercontent.com/u/3378323?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ABCUser",
            "html_url": "https://github.com/ABCUser",
            "followers_url": "https://api.github.com/users/ABCUser/followers",
            "following_url": "https://api.github.com/users/ABCUser/following{/other_user}",
            "gists_url": "https://api.github.com/users/ABCUser/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ABCUser/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ABCUser/subscriptions",
            "organizations_url": "https://api.github.com/users/ABCUser/orgs",
            "repos_url": "https://api.github.com/users/ABCUser/repos",
            "events_url": "https://api.github.com/users/ABCUser/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ABCUser/received_events",
            "type": "User",
            "site_admin": false
            },
            "html_url": "https://github.com/ABCUser/samplestest",
            "description": null,
            "fork": false,
            "url": "https://api.github.com/repos/ABCUser/samplestest",
            "forks_url": "https://api.github.com/repos/ABCUser/samplestest/forks",
            "keys_url": "https://api.github.com/repos/ABCUser/samplestest/keys{/key_id}",
            "collaborators_url": "https://api.github.com/repos/ABCUser/samplestest/collaborators{/collaborator}",
            "teams_url": "https://api.github.com/repos/ABCUser/samplestest/teams",
            "hooks_url": "https://api.github.com/repos/ABCUser/samplestest/hooks",
            "issue_events_url": "https://api.github.com/repos/ABCUser/samplestest/issues/events{/number}",
            "events_url": "https://api.github.com/repos/ABCUser/samplestest/events",
            "assignees_url": "https://api.github.com/repos/ABCUser/samplestest/assignees{/user}",
            "branches_url": "https://api.github.com/repos/ABCUser/samplestest/branches{/branch}",
            "tags_url": "https://api.github.com/repos/ABCUser/samplestest/tags",
            "blobs_url": "https://api.github.com/repos/ABCUser/samplestest/git/blobs{/sha}",
            "git_tags_url": "https://api.github.com/repos/ABCUser/samplestest/git/tags{/sha}",
            "git_refs_url": "https://api.github.com/repos/ABCUser/samplestest/git/refs{/sha}",
            "trees_url": "https://api.github.com/repos/ABCUser/samplestest/git/trees{/sha}",
            "statuses_url": "https://api.github.com/repos/ABCUser/samplestest/statuses/{sha}",
            "languages_url": "https://api.github.com/repos/ABCUser/samplestest/languages",
            "stargazers_url": "https://api.github.com/repos/ABCUser/samplestest/stargazers",
            "contributors_url": "https://api.github.com/repos/ABCUser/samplestest/contributors",
            "subscribers_url": "https://api.github.com/repos/ABCUser/samplestest/subscribers",
            "subscription_url": "https://api.github.com/repos/ABCUser/samplestest/subscription",
            "commits_url": "https://api.github.com/repos/ABCUser/samplestest/commits{/sha}",
            "git_commits_url": "https://api.github.com/repos/ABCUser/samplestest/git/commits{/sha}",
            "comments_url": "https://api.github.com/repos/ABCUser/samplestest/comments{/number}",
            "issue_comment_url": "https://api.github.com/repos/ABCUser/samplestest/issues/comments{/number}",
            "contents_url": "https://api.github.com/repos/ABCUser/samplestest/contents/{+path}",
            "compare_url": "https://api.github.com/repos/ABCUser/samplestest/compare/{base}...{head}",
            "merges_url": "https://api.github.com/repos/ABCUser/samplestest/merges",
            "archive_url": "https://api.github.com/repos/ABCUser/samplestest/{archive_format}{/ref}",
            "downloads_url": "https://api.github.com/repos/ABCUser/samplestest/downloads",
            "issues_url": "https://api.github.com/repos/ABCUser/samplestest/issues{/number}",
            "pulls_url": "https://api.github.com/repos/ABCUser/samplestest/pulls{/number}",
            "milestones_url": "https://api.github.com/repos/ABCUser/samplestest/milestones{/number}",
            "notifications_url": "https://api.github.com/repos/ABCUser/samplestest/notifications{?since,all,participating}",
            "labels_url": "https://api.github.com/repos/ABCUser/samplestest/labels{/name}",
            "releases_url": "https://api.github.com/repos/ABCUser/samplestest/releases{/id}",
            "deployments_url": "https://api.github.com/repos/ABCUser/samplestest/deployments",
            "created_at": "2021-05-19T08:52:12Z",
            "updated_at": "2021-05-19T08:55:58Z",
            "pushed_at": "2021-05-19T08:55:56Z",
            "git_url": "git://github.com/ABCUser/samplestest.git",
            "ssh_url": "git@github.com:ABCUser/samplestest.git",
            "clone_url": "https://github.com/ABCUser/samplestest.git",
            "svn_url": "https://github.com/ABCUser/samplestest",
            "homepage": null,
            "size": 0,
            "stargazers_count": 0,
            "watchers_count": 0,
            "language": null,
            "has_issues": true,
            "has_projects": true,
            "has_downloads": true,
            "has_wiki": true,
            "has_pages": false,
            "forks_count": 0,
            "mirror_url": null,
            "archived": false,
            "disabled": false,
            "open_issues_count": 8,
            "license": null,
            "allow_forking": true,
            "is_template": false,
            "topics": [

            ],
            "visibility": "public",
            "forks": 0,
            "open_issues": 8,
            "watchers": 0,
            "default_branch": "main"
        },
        "sender": {
            "login": "ABCUser",
            "id": 3378323,
            "node_id": "MDQ6VXNlcjMzNzgzMjM=",
            "avatar_url": "https://avatars.githubusercontent.com/u/3378323?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ABCUser",
            "html_url": "https://github.com/ABCUser",
            "followers_url": "https://api.github.com/users/ABCUser/followers",
            "following_url": "https://api.github.com/users/ABCUser/following{/other_user}",
            "gists_url": "https://api.github.com/users/ABCUser/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ABCUser/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ABCUser/subscriptions",
            "organizations_url": "https://api.github.com/users/ABCUser/orgs",
            "repos_url": "https://api.github.com/users/ABCUser/repos",
            "events_url": "https://api.github.com/users/ABCUser/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ABCUser/received_events",
            "type": "User",
            "site_admin": false
        }
    };
    http:Request req = new;
    req.setPayload(eventPayload.toJsonString());
    req.setHeader("X-GitHub-Event", "issues");
    http:Response|error issueLabelledPayload =  clientEndpoint->post("/", req);

    if (issueLabelledPayload is error) {
        test:assertFail(msg = "Issue creation failed: " + issueLabelledPayload.message());
    } else {
        test:assertTrue(issueLabelledPayload.statusCode === 200, msg = "expected a 200 status code. Found " + issueLabelledPayload.statusCode.toBalString());
        test:assertEquals(issueLabelledPayload.getTextPayload(), "Event acknoledged successfully", msg = "");
    }

    int counter = 10;
    while (!issueLabeledNotified && counter >= 0) {
        runtime:sleep(1);
        counter -= 1;
    }
    test:assertTrue(issueLabeledNotified, msg = "expected an issue label notification");
    test:assertEquals(issueTitle, createdIssueTitle, msg = "invalid issue title");
}

@test:Config {
    dependsOn: [testWebhookNotificationOnIssueLabeling],
    enable: true
}
function testWebhookNotificationOnIssueAssignment() {

   json eventPayload =  {
        "action": "assigned",
        "issue": {
            "url": "https://api.github.com/repos/ABCUser/samplestest/issues/22",
            "repository_url": "https://api.github.com/repos/ABCUser/samplestest",
            "labels_url": "https://api.github.com/repos/ABCUser/samplestest/issues/22/labels{/name}",
            "comments_url": "https://api.github.com/repos/ABCUser/samplestest/issues/22/comments",
            "events_url": "https://api.github.com/repos/ABCUser/samplestest/issues/22/events",
            "html_url": "https://github.com/ABCUser/samplestest/issues/22",
            "id": 1227419315,
            "node_id": "I_kwDOFfuAD85JKO6z",
            "number": 22,
            "title": "UserTestIssue",
            "user": {
            "login": "ABCUser",
            "id": 3378323,
            "node_id": "MDQ6VXNlcjMzNzgzMjM=",
            "avatar_url": "https://avatars.githubusercontent.com/u/3378323?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ABCUser",
            "html_url": "https://github.com/ABCUser",
            "followers_url": "https://api.github.com/users/ABCUser/followers",
            "following_url": "https://api.github.com/users/ABCUser/following{/other_user}",
            "gists_url": "https://api.github.com/users/ABCUser/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ABCUser/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ABCUser/subscriptions",
            "organizations_url": "https://api.github.com/users/ABCUser/orgs",
            "repos_url": "https://api.github.com/users/ABCUser/repos",
            "events_url": "https://api.github.com/users/ABCUser/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ABCUser/received_events",
            "type": "User",
            "site_admin": false
            },
            "labels": [

            ],
            "state": "open",
            "locked": false,
            "assignee": {
            "login": "ABCUser",
            "id": 3378323,
            "node_id": "MDQ6VXNlcjMzNzgzMjM=",
            "avatar_url": "https://avatars.githubusercontent.com/u/3378323?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ABCUser",
            "html_url": "https://github.com/ABCUser",
            "followers_url": "https://api.github.com/users/ABCUser/followers",
            "following_url": "https://api.github.com/users/ABCUser/following{/other_user}",
            "gists_url": "https://api.github.com/users/ABCUser/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ABCUser/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ABCUser/subscriptions",
            "organizations_url": "https://api.github.com/users/ABCUser/orgs",
            "repos_url": "https://api.github.com/users/ABCUser/repos",
            "events_url": "https://api.github.com/users/ABCUser/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ABCUser/received_events",
            "type": "User",
            "site_admin": false
            },
            "assignees": [
            {
                "login": "ABCUser",
                "id": 3378323,
                "node_id": "MDQ6VXNlcjMzNzgzMjM=",
                "avatar_url": "https://avatars.githubusercontent.com/u/3378323?v=4",
                "gravatar_id": "",
                "url": "https://api.github.com/users/ABCUser",
                "html_url": "https://github.com/ABCUser",
                "followers_url": "https://api.github.com/users/ABCUser/followers",
                "following_url": "https://api.github.com/users/ABCUser/following{/other_user}",
                "gists_url": "https://api.github.com/users/ABCUser/gists{/gist_id}",
                "starred_url": "https://api.github.com/users/ABCUser/starred{/owner}{/repo}",
                "subscriptions_url": "https://api.github.com/users/ABCUser/subscriptions",
                "organizations_url": "https://api.github.com/users/ABCUser/orgs",
                "repos_url": "https://api.github.com/users/ABCUser/repos",
                "events_url": "https://api.github.com/users/ABCUser/events{/privacy}",
                "received_events_url": "https://api.github.com/users/ABCUser/received_events",
                "type": "User",
                "site_admin": false
            }
            ],
            "milestone": null,
            "comments": 0,
            "created_at": "2022-05-06T04:56:16Z",
            "updated_at": "2022-05-06T04:56:23Z",
            "closed_at": null,
            "author_association": "OWNER",
            "active_lock_reason": null,
            "body": "asdas",
            "reactions": {
            "url": "https://api.github.com/repos/ABCUser/samplestest/issues/22/reactions",
            "total_count": 0,
            "+1": 0,
            "-1": 0,
            "laugh": 0,
            "hooray": 0,
            "confused": 0,
            "heart": 0,
            "rocket": 0,
            "eyes": 0
            },
            "timeline_url": "https://api.github.com/repos/ABCUser/samplestest/issues/22/timeline",
            "performed_via_github_app": null
        },
        "assignee": {
            "login": "ABCUser",
            "id": 3378323,
            "node_id": "MDQ6VXNlcjMzNzgzMjM=",
            "avatar_url": "https://avatars.githubusercontent.com/u/3378323?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ABCUser",
            "html_url": "https://github.com/ABCUser",
            "followers_url": "https://api.github.com/users/ABCUser/followers",
            "following_url": "https://api.github.com/users/ABCUser/following{/other_user}",
            "gists_url": "https://api.github.com/users/ABCUser/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ABCUser/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ABCUser/subscriptions",
            "organizations_url": "https://api.github.com/users/ABCUser/orgs",
            "repos_url": "https://api.github.com/users/ABCUser/repos",
            "events_url": "https://api.github.com/users/ABCUser/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ABCUser/received_events",
            "type": "User",
            "site_admin": false
        },
        "repository": {
            "id": 368803855,
            "node_id": "MDEwOlJlcG9zaXRvcnkzNjg4MDM4NTU=",
            "name": "samplestest",
            "full_name": "ABCUser/samplestest",
            "private": false,
            "owner": {
            "login": "ABCUser",
            "id": 3378323,
            "node_id": "MDQ6VXNlcjMzNzgzMjM=",
            "avatar_url": "https://avatars.githubusercontent.com/u/3378323?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ABCUser",
            "html_url": "https://github.com/ABCUser",
            "followers_url": "https://api.github.com/users/ABCUser/followers",
            "following_url": "https://api.github.com/users/ABCUser/following{/other_user}",
            "gists_url": "https://api.github.com/users/ABCUser/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ABCUser/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ABCUser/subscriptions",
            "organizations_url": "https://api.github.com/users/ABCUser/orgs",
            "repos_url": "https://api.github.com/users/ABCUser/repos",
            "events_url": "https://api.github.com/users/ABCUser/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ABCUser/received_events",
            "type": "User",
            "site_admin": false
            },
            "html_url": "https://github.com/ABCUser/samplestest",
            "description": null,
            "fork": false,
            "url": "https://api.github.com/repos/ABCUser/samplestest",
            "forks_url": "https://api.github.com/repos/ABCUser/samplestest/forks",
            "keys_url": "https://api.github.com/repos/ABCUser/samplestest/keys{/key_id}",
            "collaborators_url": "https://api.github.com/repos/ABCUser/samplestest/collaborators{/collaborator}",
            "teams_url": "https://api.github.com/repos/ABCUser/samplestest/teams",
            "hooks_url": "https://api.github.com/repos/ABCUser/samplestest/hooks",
            "issue_events_url": "https://api.github.com/repos/ABCUser/samplestest/issues/events{/number}",
            "events_url": "https://api.github.com/repos/ABCUser/samplestest/events",
            "assignees_url": "https://api.github.com/repos/ABCUser/samplestest/assignees{/user}",
            "branches_url": "https://api.github.com/repos/ABCUser/samplestest/branches{/branch}",
            "tags_url": "https://api.github.com/repos/ABCUser/samplestest/tags",
            "blobs_url": "https://api.github.com/repos/ABCUser/samplestest/git/blobs{/sha}",
            "git_tags_url": "https://api.github.com/repos/ABCUser/samplestest/git/tags{/sha}",
            "git_refs_url": "https://api.github.com/repos/ABCUser/samplestest/git/refs{/sha}",
            "trees_url": "https://api.github.com/repos/ABCUser/samplestest/git/trees{/sha}",
            "statuses_url": "https://api.github.com/repos/ABCUser/samplestest/statuses/{sha}",
            "languages_url": "https://api.github.com/repos/ABCUser/samplestest/languages",
            "stargazers_url": "https://api.github.com/repos/ABCUser/samplestest/stargazers",
            "contributors_url": "https://api.github.com/repos/ABCUser/samplestest/contributors",
            "subscribers_url": "https://api.github.com/repos/ABCUser/samplestest/subscribers",
            "subscription_url": "https://api.github.com/repos/ABCUser/samplestest/subscription",
            "commits_url": "https://api.github.com/repos/ABCUser/samplestest/commits{/sha}",
            "git_commits_url": "https://api.github.com/repos/ABCUser/samplestest/git/commits{/sha}",
            "comments_url": "https://api.github.com/repos/ABCUser/samplestest/comments{/number}",
            "issue_comment_url": "https://api.github.com/repos/ABCUser/samplestest/issues/comments{/number}",
            "contents_url": "https://api.github.com/repos/ABCUser/samplestest/contents/{+path}",
            "compare_url": "https://api.github.com/repos/ABCUser/samplestest/compare/{base}...{head}",
            "merges_url": "https://api.github.com/repos/ABCUser/samplestest/merges",
            "archive_url": "https://api.github.com/repos/ABCUser/samplestest/{archive_format}{/ref}",
            "downloads_url": "https://api.github.com/repos/ABCUser/samplestest/downloads",
            "issues_url": "https://api.github.com/repos/ABCUser/samplestest/issues{/number}",
            "pulls_url": "https://api.github.com/repos/ABCUser/samplestest/pulls{/number}",
            "milestones_url": "https://api.github.com/repos/ABCUser/samplestest/milestones{/number}",
            "notifications_url": "https://api.github.com/repos/ABCUser/samplestest/notifications{?since,all,participating}",
            "labels_url": "https://api.github.com/repos/ABCUser/samplestest/labels{/name}",
            "releases_url": "https://api.github.com/repos/ABCUser/samplestest/releases{/id}",
            "deployments_url": "https://api.github.com/repos/ABCUser/samplestest/deployments",
            "created_at": "2021-05-19T08:52:12Z",
            "updated_at": "2021-05-19T08:55:58Z",
            "pushed_at": "2021-05-19T08:55:56Z",
            "git_url": "git://github.com/ABCUser/samplestest.git",
            "ssh_url": "git@github.com:ABCUser/samplestest.git",
            "clone_url": "https://github.com/ABCUser/samplestest.git",
            "svn_url": "https://github.com/ABCUser/samplestest",
            "homepage": null,
            "size": 0,
            "stargazers_count": 0,
            "watchers_count": 0,
            "language": null,
            "has_issues": true,
            "has_projects": true,
            "has_downloads": true,
            "has_wiki": true,
            "has_pages": false,
            "forks_count": 0,
            "mirror_url": null,
            "archived": false,
            "disabled": false,
            "open_issues_count": 8,
            "license": null,
            "allow_forking": true,
            "is_template": false,
            "topics": [

            ],
            "visibility": "public",
            "forks": 0,
            "open_issues": 8,
            "watchers": 0,
            "default_branch": "main"
        },
        "sender": {
            "login": "ABCUser",
            "id": 3378323,
            "node_id": "MDQ6VXNlcjMzNzgzMjM=",
            "avatar_url": "https://avatars.githubusercontent.com/u/3378323?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ABCUser",
            "html_url": "https://github.com/ABCUser",
            "followers_url": "https://api.github.com/users/ABCUser/followers",
            "following_url": "https://api.github.com/users/ABCUser/following{/other_user}",
            "gists_url": "https://api.github.com/users/ABCUser/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ABCUser/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ABCUser/subscriptions",
            "organizations_url": "https://api.github.com/users/ABCUser/orgs",
            "repos_url": "https://api.github.com/users/ABCUser/repos",
            "events_url": "https://api.github.com/users/ABCUser/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ABCUser/received_events",
            "type": "User",
            "site_admin": false
        }
    };
    http:Request req = new;
    req.setPayload(eventPayload.toJsonString());
    req.setHeader("X-GitHub-Event", "issues");
    http:Response|error issueAssignmentPayload =  clientEndpoint->post("/", req);

    if (issueAssignmentPayload is error) {
        test:assertFail(msg = "Issue creation failed: " + issueAssignmentPayload.message());
    } else {
        test:assertTrue(issueAssignmentPayload.statusCode === 200, msg = "expected a 200 status code. Found " + issueAssignmentPayload.statusCode.toBalString());
        test:assertEquals(issueAssignmentPayload.getTextPayload(), "Event acknoledged successfully", msg = "");
    }

    int counter = 10;
    while (!issueAssignedNotified && counter >= 0) {
        runtime:sleep(1);
        counter -= 1;
    }
    test:assertTrue(issueAssignedNotified, msg = "expected an issue assigned notification");
    test:assertEquals(issueTitle, createdIssueTitle, msg = "invalid issue title");
}

@test:Config {}
function testriggerPackage() returns error? {

    //API
    Package packageResp = check centralApiClient -> get("registry/packages/bcentralintegration1/sample_trigger/0.1.0");
    test:assertEquals(packageResp.organization, "bcentralintegration1");
    test:assertEquals(packageResp.name, "sample_trigger");
    test:assertEquals(packageResp.'version, "0.1.0");
    test:assertEquals(packageResp.URL, "/bcentralintegration1/sample_trigger/0.1.0");
    test:assertEquals(packageResp.visibility, "public");

    Module[] modules = packageResp.modules;
    test:assertEquals(modules.length(), 1);

    test:assertEquals(modules[0].name, "sample_trigger");
}

@test:Config { }
function testTriggerApiDocs() returns error? {
    http:Response resp = check apiDocsClient -> get("bcentralintegration1/sample_trigger/0.1.0");
    test:assertEquals(resp.statusCode, 200);

    string[] versions = check centralApiClient -> get("registry/packages/bcentralintegration1/sample_trigger?include-prereleases=true");
    test:assertEquals(versions[0], "0.1.0");

    APIDocResponse apiDocsResp = check centralApiClient -> get("docs/bcentralintegration1/sample_trigger/0.1.0");

    ModuleInfo modules = apiDocsResp.docsData.modules[0];
    
    test:assertEquals(modules.id, "sample_trigger");

    test:assertEquals(modules.records.length(), 63);
    test:assertEquals(modules.serviceTypes.length(), 10);
    test:assertEquals(modules.listeners.length(), 1);
    test:assertEquals(modules.unionTypes.length(), 2);
    test:assertEquals(modules.enums.length(), 10);
}


@test:Config { }
function testTriggerApi() returns error? {
    TriggerResponse triggerResp = check centralApiClient -> get("registry/triggers?org=bcentralintegration1");
    Trigger[] triggers = triggerResp.triggers;
    test:assertEquals(triggers.length(), 1);

    Trigger trigger1 = triggers[0];
    test:assertEquals(trigger1.name, "Trigger");
    test:assertEquals(trigger1.displayName, "GitHub");
    test:assertEquals(trigger1.moduleName, "sample_trigger");
    test:assertEquals(trigger1.displayAnnotation.iconPath, "docs/icon.png");
    test:assertEquals(trigger1.displayAnnotation.label, "GitHub");
    test:assertEquals(trigger1.package.name, "sample_trigger");
    test:assertTrue(trigger1.serviceTypes is ());
    test:assertTrue(trigger1.listenerParams is ());

    int triggerId = trigger1.id;
    Trigger triggerDetailed = check centralApiClient -> get("registry/triggers/" + triggerId.toString());
    
    anydata[] paramList = triggerDetailed.listenerParams ?: [];
    anydata[] svcTypes = triggerDetailed.serviceTypes ?: [];
    test:assertEquals(paramList.length(),2);
    test:assertEquals(svcTypes.length(),10);
}

type TriggerResponse record {
    Trigger[] triggers;
};

type Trigger record {
    int id;
    string name;
    string displayName;
    string moduleName;
    anydata[]? serviceTypes;
    anydata[]? listenerParams;
    DisplayAnnotation displayAnnotation;
    Package package;

};
