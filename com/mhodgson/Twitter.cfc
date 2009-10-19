/**
 * Twitter.cfc
 * Simple, opinionated Coldfusion interface to the Twitter REST API.
 * Licensed under the MIT License
 *
 * @version  0.50 15 Oct 2009
 * @author  Mike Hodgson <mhodgson@gmail.com>
*/


component  hint="Twitter API Client" output="false"
{
  property name="username" type="string";
  property name="password" type="string";
  property name="base_url"  type="string";

  // Component initialization //

  public Twitter function init(required string username, required string password, string base_url = "https://twitter.com/") {
    variables.username = arguments.username;
    variables.password = arguments.password;
	if (arguments.base_url neq "") {
      variables.base_url = arguments.base_url;
	}
    return this;
  }

  // User Methods //

  public struct function getUserById(required string user_id) {
    return twitterApiCall("users/show.json",
                            "GET",
                            [
                              {name = "user_id", value = arguments.user_id, type = "URL"}
                            ]);
  }

  public struct function getUserByScreenName(required string screen_name) {
    return twitterApiCall("users/show.json",
                            "GET",
                            [
                              {name = "screen_name", value = arguments.screen_name, type = "URL"}
                            ]);
  }

  public struct function getFriends(string cursor = "-1") {
    return twitterApiCall("statuses/friends.json",
                            "GET",
                            [
                              {name = "cursor", value = arguments.cursor, type = "URL"}
                            ]);
  }

  public struct function getFriendsById(required string user_id, string cursor="-1") {
    return twitterApiCall("statuses/friends.json",
                            "GET",
                            [
                              {name = "user_id", value = arguments.user_id, type = "URL"},
                              {name = "cursor", value = arguments.cursor, type = "URL"}
                            ]);
  }

  public struct function getFriendsByScreenName(required string screen_name, string cursor="-1") {
    return twitterApiCall("statuses/friends.json",
                            "GET",
                            [
                              {name = "screen_name", value = arguments.screen_name, type = "URL"},
                              {name = "cursor", value = arguments.cursor, type = "URL"}
                            ]);
  }

  public struct function getFollowers(string cursor = "-1") {
    return twitterApiCall("statuses/followers.json",
                            "GET",
                            [
                              {name = "cursor", value = arguments.cursor, type = "URL"}
                            ]);
  }

  public struct function getFollowersById(required string user_id, string cursor="-1") {
    return twitterApiCall("statuses/followers.json",
                            "GET",
                            [
                              {name = "user_id", value = arguments.user_id, type = "URL"},
                              {name = "cursor", value = arguments.cursor, type = "URL"}
                            ]);
  }

  public struct function getFollowersByScreenName(required string screen_name, string cursor="-1") {
    return twitterApiCall("statuses/followers.json",
                            "GET",
                            [
                              {name = "screen_name", value = arguments.screen_name, type = "URL"},
                              {name = "cursor", value = arguments.cursor, type = "URL"}
                            ]);
  }

  // Timeline Methods //

  public struct function getPublicTimeline() {
    return twitterApiCall("statuses/public_timeline.json");
  }

  public struct function getUserTimeline(since = "", max = "", count = 200, page = 1) {
    return twitterApiCall("statuses/user_timeline.json",
                            "GET",
                            [
                              {name = "since_id", value = arguments.since, type = "URL"},
                              {name = "max_id", value = arguments.max, type = "URL"},
                              {name = "count", value = arguments.count, type = "URL"},
                              {name = "page", value = arguments.page, type = "URL"}
                            ]);
  }

  public struct function getUserTimelineById(required string user_id, since = "", max = "", count = 200, page = 1) {
    return twitterApiCall("statuses/user_timeline.json",
                            "GET",
                            [
                              {name = "user_id", value = arguments.user_id, type = "URL"},
                              {name = "since_id", value = arguments.since, type = "URL"},
                              {name = "max_id", value = arguments.max, type = "URL"},
                              {name = "count", value = arguments.count, type = "URL"},
                              {name = "page", value = arguments.page, type = "URL"}
                            ]);
  }

  public struct function getUserTimelineByScreenName(required string screen_name, since = "", max = "", count = 200, page = 1) {
    return twitterApiCall("statuses/user_timeline.json",
                            "GET",
                            [
                              {name = "screen_name", value = arguments.screen_name, type = "URL"},
                              {name = "since_id", value = arguments.since, type = "URL"},
                              {name = "max_id", value = arguments.max, type = "URL"},
                              {name = "count", value = arguments.count, type = "URL"},
                              {name = "page", value = arguments.page, type = "URL"}
                            ]);
  }


  // WARN: Will be deprecated in future versions of the Twitter API, use getHomeTimeline
  public struct function getFriendsTimeline(since = "", max = "", count = 200, page = 1) {
    return twitterApiCall("statuses/friends_timeline.json",
                            "GET",
                            [
                              {name = "since_id", value = arguments.since, type = "URL"},
                              {name = "max_id", value = arguments.max, type = "URL"},
                              {name = "count", value = arguments.count, type = "URL"},
                              {name = "page", value = arguments.page, type = "URL"}
                            ]);
  }

  public struct function getHomeTimeline(since = "", max = "", count = 200, page = 1) {
    return twitterApiCall("statuses/home_timeline.json",
                            "GET",
                            [
                              {name = "since_id", value = arguments.since, type = "URL"},
                              {name = "max_id", value = arguments.max, type = "URL"},
                              {name = "count", value = arguments.count, type = "URL"},
                              {name = "page", value = arguments.page, type = "URL"}
                            ]);
  }

  public struct function getMentions(since = "", max = "", count = 200, page = 1) {
    return twitterApiCall("statuses/mentions.json",
                            "GET",
                            [
                              {name = "since_id", value = arguments.since, type = "URL"},
                              {name = "max_id", value = arguments.max, type = "URL"},
                              {name = "count", value = arguments.count, type = "URL"},
                              {name = "page", value = arguments.page, type = "URL"}
                            ]);
  }

  public struct function getRetweetedByMe(since = "", max = "", count = 200, page = 1) {
    return twitterApiCall("statuses/retweeted_by_me.json",
                            "GET",
                            [
                              {name = "since_id", value = arguments.since, type = "URL"},
                              {name = "max_id", value = arguments.max, type = "URL"},
                              {name = "count", value = arguments.count, type = "URL"},
                              {name = "page", value = arguments.page, type = "URL"}
                            ]);
  }

  public struct function getRetweetedToMe(since = "", max = "", count = 200, page = 1) {
    return twitterApiCall("statuses/retweeted_to_me.json",
                            "GET",
                            [
                              {name = "since_id", value = arguments.since, type = "URL"},
                              {name = "max_id", value = arguments.max, type = "URL"},
                              {name = "count", value = arguments.count, type = "URL"},
                              {name = "page", value = arguments.page, type = "URL"}
                            ]);
  }

  public struct function getRetweetsOfMe(since = "", max = "", count = 200, page = 1) {
    return twitterApiCall("statuses/retweets_of_me.json",
                            "GET",
                            [
                              {name = "since_id", value = arguments.since, type = "URL"},
                              {name = "max_id", value = arguments.max, type = "URL"},
                              {name = "count", value = arguments.count, type = "URL"},
                              {name = "page", value = arguments.page, type = "URL"}
                            ]);
  }

  // Status Methods //

  public struct function setStatus(required string status, string in_reply_to_status_id = "") {
    return twitterApiCall("statuses/update.json",
                            "POST",
                            [
                              {name = "status", value = arguments.status, type = "formField"},
                              {name = "in_reply_to_status_id", value = arguments.in_reply_to_status_id, type = "formField"}
                            ]);
  }

  public struct function getStatus(required string status_id) {
    return twitterApiCall("statuses/show/#arguments.status_id#.json");
  }

  public struct function destroyStatus(required string status_id) {
    return twitterApiCall("statuses/destroy/#arguments.status_id#.json");
  }

  public struct function retweetStatus(required string status_id) {
    return twitterApiCall("statuses/retweet/#arguments.status_id#.json");
  }

  public struct function statusRetweets(required string status_id) {
    return twitterApiCall("statuses/retweets/#arguments.status_id#.json");
  }


  // Direct Message Methods //

  public struct function getDirectMessages(since = "", max = "", count = 200, page = 1) {
    return twitterApiCall("direct_messages.json",
                            "GET",
                            [
                              {name = "since_id", value = arguments.since, type = "URL"},
                              {name = "max_id", value = arguments.max, type = "URL"},
                              {name = "count", value = arguments.count, type = "URL"},
                              {name = "page", value = arguments.page, type = "URL"}
                            ]);
  }

  public struct function getDirectMessagesSent(since = "", max = "", count = 200, page = 1) {
    return twitterApiCall("direct_messages/sent.json",
                            "GET",
                            [
                              {name = "since_id", value = arguments.since, type = "URL"},
                              {name = "max_id", value = arguments.max, type = "URL"},
                              {name = "count", value = arguments.count, type = "URL"},
                              {name = "page", value = arguments.page, type = "URL"}
                            ]);
  }

  public struct function setDirectMessageById(required string user_id, required string message) {
    return twitterApiCall("statuses/followers.json",
                            "POST",
                            [
                              {name = "user_id", value = arguments.user_id, type = "URL"},
                              {name = "text", value = arguments.message, type = "URL"}
                            ]);
  }

  public struct function setDirectMessageByScreenName(required string screen_name, required string message) {
    return twitterApiCall("statuses/followers.json",
                            "POST",
                            [
                              {name = "screen_name", value = arguments.screen_name, type = "URL"},
                              {name = "text", value = arguments.message, type = "URL"}
                            ]);
  }

  public struct function destroyDirectMessage(required string message_id) {
    return twitterApiCall("direct_messages/destroy/#arguments.message_id#.json", "GET");
  }

  // Account Methods //

  public struct function getRateLimitStatus() {
    return twitterApiCall("account/rate_limit_status.json", "GET");
  }


  // Interface to API, can be called directly to use methods not already implemented above //

  public struct function twitterApiCall(string url, string method = "GET", array parameters = arrayNew(1)) {
    var myHttpParams = {url="#variables.base_url##arguments.url#", username="#variables.username#", password="#variables.password#", method="#arguments.method#"};
    var myHttp = new Http(argumentCollection = myHttpParams);
    var myHttpResult = structNew();
    var myReturnVar = structNew();

    myReturnVar.result = structNew();

    for (i=1; i lte arrayLen(arguments.parameters); i++) {
      if (arguments.parameters[i].value neq "") {
        myHttp.addParam(argumentCollection = arguments.parameters[i]);
      }
    }

    myHttpResult = myHttp.send().getPrefix();
    myReturnVar.result_code = myHttpResult.responseheader.status_code;

    if (isJson(myHttpResult.filecontent)) {
      myReturnVar.result = deserializeJSON(myHttpResult.Filecontent);
    } else {
      switch (myHttpResult.responseheader.status_code) {
        case "401": {
          myReturnVar.result = {error = "This method requires authentication.", request="#arguments.url#"};
          break;
        }
        case "404": {
          myReturnVar.result = {error = "The requested resource was not found.", request="#arguments.url#"};
          break;
        }
        case "406": {
          myReturnVar.result = {error = "An invalid format was specified for the request.", request="#arguments.url#"};
          break;
        }
        case "500": {
          myReturnVar.result = {error = "Twitter is broken!", request="#arguments.url#"};
          break;
        }
        case "502": {
          myReturnVar.result = {error = "Twitter is down for maintenance or being upgraded.", request="#arguments.url#"};
          break;
        }
        case "503": {
          myReturnVar.result = {error = "The Twitter servers are overloaded, or your account is being rate limited.", request="#arguments.url#"};
          break;
        }
        default: {
          myReturnVar.result = {error = "There was an error but I don't know what it was.", request="#arguments.url#"};
          break;
        }
      }
    }
    return myReturnVar;
  }
}
