// To parse this JSON data, do
//
//     final instagramModel = instagramModelFromJson(jsonString);

import 'dart:convert';

InstagramModel instagramModelFromJson(String str) =>
    InstagramModel.fromJson(json.decode(str));

String instagramModelToJson(InstagramModel data) => json.encode(data.toJson());

class InstagramModel {
  InstagramModel({
    this.loggingPageId,
    this.showSuggestedProfiles,
    this.showFollowDialog,
    this.graphql,
    this.toastContentOnLoad,
    this.showViewShop,
    this.profilePicEditSyncProps,
  });

  String loggingPageId;
  bool showSuggestedProfiles;
  bool showFollowDialog;
  Graphql graphql;
  dynamic toastContentOnLoad;
  bool showViewShop;
  dynamic profilePicEditSyncProps;

  factory InstagramModel.fromJson(Map<String, dynamic> json) => InstagramModel(
        loggingPageId:
            json["logging_page_id"] == null ? null : json["logging_page_id"],
        showSuggestedProfiles: json["show_suggested_profiles"] == null
            ? null
            : json["show_suggested_profiles"],
        showFollowDialog: json["show_follow_dialog"] == null
            ? null
            : json["show_follow_dialog"],
        graphql:
            json["graphql"] == null ? null : Graphql.fromJson(json["graphql"]),
        toastContentOnLoad: json["toast_content_on_load"],
        showViewShop:
            json["show_view_shop"] == null ? null : json["show_view_shop"],
        profilePicEditSyncProps: json["profile_pic_edit_sync_props"],
      );

  Map<String, dynamic> toJson() => {
        "logging_page_id": loggingPageId == null ? null : loggingPageId,
        "show_suggested_profiles":
            showSuggestedProfiles == null ? null : showSuggestedProfiles,
        "show_follow_dialog":
            showFollowDialog == null ? null : showFollowDialog,
        "graphql": graphql == null ? null : graphql.toJson(),
        "toast_content_on_load": toastContentOnLoad,
        "show_view_shop": showViewShop == null ? null : showViewShop,
        "profile_pic_edit_sync_props": profilePicEditSyncProps,
      };
}

class Graphql {
  Graphql({
    this.user,
  });

  GraphqlUser user;

  factory Graphql.fromJson(Map<String, dynamic> json) => Graphql(
        user: json["user"] == null ? null : GraphqlUser.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user.toJson(),
      };
}

class GraphqlUser {
  GraphqlUser({
    this.biography,
    this.blockedByViewer,
    this.restrictedByViewer,
    this.countryBlock,
    this.externalUrl,
    this.externalUrlLinkshimmed,
    this.edgeFollowedBy,
    this.followedByViewer,
    this.edgeFollow,
    this.followsViewer,
    this.fullName,
    this.hasArEffects,
    this.hasClips,
    this.hasGuides,
    this.hasChannel,
    this.hasBlockedViewer,
    this.highlightReelCount,
    this.hasRequestedViewer,
    this.id,
    this.isBusinessAccount,
    this.isJoinedRecently,
    this.businessCategoryName,
    this.overallCategoryName,
    this.categoryEnum,
    this.isPrivate,
    this.isVerified,
    this.edgeMutualFollowedBy,
    this.profilePicUrl,
    this.profilePicUrlHd,
    this.requestedByViewer,
    this.username,
    this.connectedFbPage,
    this.edgeFelixVideoTimeline,
    this.edgeOwnerToTimelineMedia,
    this.edgeSavedMedia,
    this.edgeMediaCollections,
    this.edgeRelatedProfiles,
  });

  String biography;
  bool blockedByViewer;
  dynamic restrictedByViewer;
  bool countryBlock;
  String externalUrl;
  String externalUrlLinkshimmed;
  EdgeFollowClass edgeFollowedBy;
  bool followedByViewer;
  EdgeFollowClass edgeFollow;
  bool followsViewer;
  String fullName;
  bool hasArEffects;
  bool hasClips;
  bool hasGuides;
  bool hasChannel;
  bool hasBlockedViewer;
  int highlightReelCount;
  bool hasRequestedViewer;
  String id;
  bool isBusinessAccount;
  bool isJoinedRecently;
  String businessCategoryName;
  dynamic overallCategoryName;
  String categoryEnum;
  bool isPrivate;
  bool isVerified;
  EdgeMutualFollowedBy edgeMutualFollowedBy;
  String profilePicUrl;
  String profilePicUrlHd;
  bool requestedByViewer;
  Username username;
  dynamic connectedFbPage;
  EdgeFelixVideoTimelineClass edgeFelixVideoTimeline;
  EdgeOwnerToTimelineMedia edgeOwnerToTimelineMedia;
  EdgeFelixVideoTimelineClass edgeSavedMedia;
  EdgeFelixVideoTimelineClass edgeMediaCollections;
  EdgeRelatedProfilesClass edgeRelatedProfiles;

  factory GraphqlUser.fromJson(Map<String, dynamic> json) => GraphqlUser(
        biography: json["biography"] == null ? null : json["biography"],
        blockedByViewer: json["blocked_by_viewer"] == null
            ? null
            : json["blocked_by_viewer"],
        restrictedByViewer: json["restricted_by_viewer"],
        countryBlock:
            json["country_block"] == null ? null : json["country_block"],
        externalUrl: json["external_url"] == null ? null : json["external_url"],
        externalUrlLinkshimmed: json["external_url_linkshimmed"] == null
            ? null
            : json["external_url_linkshimmed"],
        edgeFollowedBy: json["edge_followed_by"] == null
            ? null
            : EdgeFollowClass.fromJson(json["edge_followed_by"]),
        followedByViewer: json["followed_by_viewer"] == null
            ? null
            : json["followed_by_viewer"],
        edgeFollow: json["edge_follow"] == null
            ? null
            : EdgeFollowClass.fromJson(json["edge_follow"]),
        followsViewer:
            json["follows_viewer"] == null ? null : json["follows_viewer"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        hasArEffects:
            json["has_ar_effects"] == null ? null : json["has_ar_effects"],
        hasClips: json["has_clips"] == null ? null : json["has_clips"],
        hasGuides: json["has_guides"] == null ? null : json["has_guides"],
        hasChannel: json["has_channel"] == null ? null : json["has_channel"],
        hasBlockedViewer: json["has_blocked_viewer"] == null
            ? null
            : json["has_blocked_viewer"],
        highlightReelCount: json["highlight_reel_count"] == null
            ? null
            : json["highlight_reel_count"],
        hasRequestedViewer: json["has_requested_viewer"] == null
            ? null
            : json["has_requested_viewer"],
        id: json["id"] == null ? null : json["id"],
        isBusinessAccount: json["is_business_account"] == null
            ? null
            : json["is_business_account"],
        isJoinedRecently: json["is_joined_recently"] == null
            ? null
            : json["is_joined_recently"],
        businessCategoryName: json["business_category_name"] == null
            ? null
            : json["business_category_name"],
        overallCategoryName: json["overall_category_name"],
        categoryEnum:
            json["category_enum"] == null ? null : json["category_enum"],
        isPrivate: json["is_private"] == null ? null : json["is_private"],
        isVerified: json["is_verified"] == null ? null : json["is_verified"],
        edgeMutualFollowedBy: json["edge_mutual_followed_by"] == null
            ? null
            : EdgeMutualFollowedBy.fromJson(json["edge_mutual_followed_by"]),
        profilePicUrl:
            json["profile_pic_url"] == null ? null : json["profile_pic_url"],
        profilePicUrlHd: json["profile_pic_url_hd"] == null
            ? null
            : json["profile_pic_url_hd"],
        requestedByViewer: json["requested_by_viewer"] == null
            ? null
            : json["requested_by_viewer"],
        username: json["username"] == null
            ? null
            : usernameValues.map[json["username"]],
        connectedFbPage: json["connected_fb_page"],
        edgeFelixVideoTimeline: json["edge_felix_video_timeline"] == null
            ? null
            : EdgeFelixVideoTimelineClass.fromJson(
                json["edge_felix_video_timeline"]),
        edgeOwnerToTimelineMedia: json["edge_owner_to_timeline_media"] == null
            ? null
            : EdgeOwnerToTimelineMedia.fromJson(
                json["edge_owner_to_timeline_media"]),
        edgeSavedMedia: json["edge_saved_media"] == null
            ? null
            : EdgeFelixVideoTimelineClass.fromJson(json["edge_saved_media"]),
        edgeMediaCollections: json["edge_media_collections"] == null
            ? null
            : EdgeFelixVideoTimelineClass.fromJson(
                json["edge_media_collections"]),
        edgeRelatedProfiles: json["edge_related_profiles"] == null
            ? null
            : EdgeRelatedProfilesClass.fromJson(json["edge_related_profiles"]),
      );

  Map<String, dynamic> toJson() => {
        "biography": biography == null ? null : biography,
        "blocked_by_viewer": blockedByViewer == null ? null : blockedByViewer,
        "restricted_by_viewer": restrictedByViewer,
        "country_block": countryBlock == null ? null : countryBlock,
        "external_url": externalUrl == null ? null : externalUrl,
        "external_url_linkshimmed":
            externalUrlLinkshimmed == null ? null : externalUrlLinkshimmed,
        "edge_followed_by":
            edgeFollowedBy == null ? null : edgeFollowedBy.toJson(),
        "followed_by_viewer":
            followedByViewer == null ? null : followedByViewer,
        "edge_follow": edgeFollow == null ? null : edgeFollow.toJson(),
        "follows_viewer": followsViewer == null ? null : followsViewer,
        "full_name": fullName == null ? null : fullName,
        "has_ar_effects": hasArEffects == null ? null : hasArEffects,
        "has_clips": hasClips == null ? null : hasClips,
        "has_guides": hasGuides == null ? null : hasGuides,
        "has_channel": hasChannel == null ? null : hasChannel,
        "has_blocked_viewer":
            hasBlockedViewer == null ? null : hasBlockedViewer,
        "highlight_reel_count":
            highlightReelCount == null ? null : highlightReelCount,
        "has_requested_viewer":
            hasRequestedViewer == null ? null : hasRequestedViewer,
        "id": id == null ? null : id,
        "is_business_account":
            isBusinessAccount == null ? null : isBusinessAccount,
        "is_joined_recently":
            isJoinedRecently == null ? null : isJoinedRecently,
        "business_category_name":
            businessCategoryName == null ? null : businessCategoryName,
        "overall_category_name": overallCategoryName,
        "category_enum": categoryEnum == null ? null : categoryEnum,
        "is_private": isPrivate == null ? null : isPrivate,
        "is_verified": isVerified == null ? null : isVerified,
        "edge_mutual_followed_by":
            edgeMutualFollowedBy == null ? null : edgeMutualFollowedBy.toJson(),
        "profile_pic_url": profilePicUrl == null ? null : profilePicUrl,
        "profile_pic_url_hd": profilePicUrlHd == null ? null : profilePicUrlHd,
        "requested_by_viewer":
            requestedByViewer == null ? null : requestedByViewer,
        "username": username == null ? null : usernameValues.reverse[username],
        "connected_fb_page": connectedFbPage,
        "edge_felix_video_timeline": edgeFelixVideoTimeline == null
            ? null
            : edgeFelixVideoTimeline.toJson(),
        "edge_owner_to_timeline_media": edgeOwnerToTimelineMedia == null
            ? null
            : edgeOwnerToTimelineMedia.toJson(),
        "edge_saved_media":
            edgeSavedMedia == null ? null : edgeSavedMedia.toJson(),
        "edge_media_collections":
            edgeMediaCollections == null ? null : edgeMediaCollections.toJson(),
        "edge_related_profiles":
            edgeRelatedProfiles == null ? null : edgeRelatedProfiles.toJson(),
      };
}

class EdgeFelixVideoTimelineClass {
  EdgeFelixVideoTimelineClass({
    this.count,
    this.pageInfo,
    this.edges,
  });

  int count;
  PageInfo pageInfo;
  List<EdgeFelixVideoTimelineEdge> edges;

  factory EdgeFelixVideoTimelineClass.fromJson(Map<String, dynamic> json) =>
      EdgeFelixVideoTimelineClass(
        count: json["count"] == null ? null : json["count"],
        pageInfo: json["page_info"] == null
            ? null
            : PageInfo.fromJson(json["page_info"]),
        edges: json["edges"] == null
            ? null
            : List<EdgeFelixVideoTimelineEdge>.from(json["edges"]
                .map((x) => EdgeFelixVideoTimelineEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count == null ? null : count,
        "page_info": pageInfo == null ? null : pageInfo.toJson(),
        "edges": edges == null
            ? null
            : List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class EdgeFelixVideoTimelineEdge {
  EdgeFelixVideoTimelineEdge({
    this.node,
  });

  PurpleNode node;

  factory EdgeFelixVideoTimelineEdge.fromJson(Map<String, dynamic> json) =>
      EdgeFelixVideoTimelineEdge(
        node: json["node"] == null ? null : PurpleNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node == null ? null : node.toJson(),
      };
}

class PurpleNode {
  PurpleNode({
    this.typename,
    this.id,
    this.shortcode,
    this.dimensions,
    this.displayUrl,
    this.edgeMediaToTaggedUser,
    this.factCheckOverallRating,
    this.factCheckInformation,
    this.gatingInfo,
    this.sharingFrictionInfo,
    this.mediaOverlayInfo,
    this.mediaPreview,
    this.owner,
    this.isVideo,
    this.accessibilityCaption,
    this.dashInfo,
    this.hasAudio,
    this.trackingToken,
    this.videoUrl,
    this.videoViewCount,
    this.edgeMediaToCaption,
    this.edgeMediaToComment,
    this.commentsDisabled,
    this.takenAtTimestamp,
    this.edgeLikedBy,
    this.edgeMediaPreviewLike,
    this.location,
    this.thumbnailSrc,
    this.thumbnailResources,
    this.felixProfileGridCrop,
    this.encodingStatus,
    this.isPublished,
    this.productType,
    this.title,
    this.videoDuration,
  });

  String typename;
  String id;
  String shortcode;
  Dimensions dimensions;
  String displayUrl;
  EdgeRelatedProfilesClass edgeMediaToTaggedUser;
  dynamic factCheckOverallRating;
  dynamic factCheckInformation;
  dynamic gatingInfo;
  SharingFrictionInfo sharingFrictionInfo;
  dynamic mediaOverlayInfo;
  String mediaPreview;
  Owner owner;
  bool isVideo;
  dynamic accessibilityCaption;
  DashInfo dashInfo;
  bool hasAudio;
  String trackingToken;
  String videoUrl;
  int videoViewCount;
  EdgeRelatedProfilesClass edgeMediaToCaption;
  EdgeFollowClass edgeMediaToComment;
  bool commentsDisabled;
  int takenAtTimestamp;
  EdgeFollowClass edgeLikedBy;
  EdgeFollowClass edgeMediaPreviewLike;
  dynamic location;
  String thumbnailSrc;
  List<ThumbnailResource> thumbnailResources;
  dynamic felixProfileGridCrop;
  dynamic encodingStatus;
  bool isPublished;
  String productType;
  String title;
  double videoDuration;

  factory PurpleNode.fromJson(Map<String, dynamic> json) => PurpleNode(
        typename: json["__typename"] == null ? null : json["__typename"],
        id: json["id"] == null ? null : json["id"],
        shortcode: json["shortcode"] == null ? null : json["shortcode"],
        dimensions: json["dimensions"] == null
            ? null
            : Dimensions.fromJson(json["dimensions"]),
        displayUrl: json["display_url"] == null ? null : json["display_url"],
        edgeMediaToTaggedUser: json["edge_media_to_tagged_user"] == null
            ? null
            : EdgeRelatedProfilesClass.fromJson(
                json["edge_media_to_tagged_user"]),
        factCheckOverallRating: json["fact_check_overall_rating"],
        factCheckInformation: json["fact_check_information"],
        gatingInfo: json["gating_info"],
        sharingFrictionInfo: json["sharing_friction_info"] == null
            ? null
            : SharingFrictionInfo.fromJson(json["sharing_friction_info"]),
        mediaOverlayInfo: json["media_overlay_info"],
        mediaPreview:
            json["media_preview"] == null ? null : json["media_preview"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        isVideo: json["is_video"] == null ? null : json["is_video"],
        accessibilityCaption: json["accessibility_caption"],
        dashInfo: json["dash_info"] == null
            ? null
            : DashInfo.fromJson(json["dash_info"]),
        hasAudio: json["has_audio"] == null ? null : json["has_audio"],
        trackingToken:
            json["tracking_token"] == null ? null : json["tracking_token"],
        videoUrl: json["video_url"] == null ? null : json["video_url"],
        videoViewCount:
            json["video_view_count"] == null ? null : json["video_view_count"],
        edgeMediaToCaption: json["edge_media_to_caption"] == null
            ? null
            : EdgeRelatedProfilesClass.fromJson(json["edge_media_to_caption"]),
        edgeMediaToComment: json["edge_media_to_comment"] == null
            ? null
            : EdgeFollowClass.fromJson(json["edge_media_to_comment"]),
        commentsDisabled: json["comments_disabled"] == null
            ? null
            : json["comments_disabled"],
        takenAtTimestamp: json["taken_at_timestamp"] == null
            ? null
            : json["taken_at_timestamp"],
        edgeLikedBy: json["edge_liked_by"] == null
            ? null
            : EdgeFollowClass.fromJson(json["edge_liked_by"]),
        edgeMediaPreviewLike: json["edge_media_preview_like"] == null
            ? null
            : EdgeFollowClass.fromJson(json["edge_media_preview_like"]),
        location: json["location"],
        thumbnailSrc:
            json["thumbnail_src"] == null ? null : json["thumbnail_src"],
        thumbnailResources: json["thumbnail_resources"] == null
            ? null
            : List<ThumbnailResource>.from(json["thumbnail_resources"]
                .map((x) => ThumbnailResource.fromJson(x))),
        felixProfileGridCrop: json["felix_profile_grid_crop"],
        encodingStatus: json["encoding_status"],
        isPublished: json["is_published"] == null ? null : json["is_published"],
        productType: json["product_type"] == null ? null : json["product_type"],
        title: json["title"] == null ? null : json["title"],
        videoDuration: json["video_duration"] == null
            ? null
            : json["video_duration"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "__typename": typename == null ? null : typename,
        "id": id == null ? null : id,
        "shortcode": shortcode == null ? null : shortcode,
        "dimensions": dimensions == null ? null : dimensions.toJson(),
        "display_url": displayUrl == null ? null : displayUrl,
        "edge_media_to_tagged_user": edgeMediaToTaggedUser == null
            ? null
            : edgeMediaToTaggedUser.toJson(),
        "fact_check_overall_rating": factCheckOverallRating,
        "fact_check_information": factCheckInformation,
        "gating_info": gatingInfo,
        "sharing_friction_info":
            sharingFrictionInfo == null ? null : sharingFrictionInfo.toJson(),
        "media_overlay_info": mediaOverlayInfo,
        "media_preview": mediaPreview == null ? null : mediaPreview,
        "owner": owner == null ? null : owner.toJson(),
        "is_video": isVideo == null ? null : isVideo,
        "accessibility_caption": accessibilityCaption,
        "dash_info": dashInfo == null ? null : dashInfo.toJson(),
        "has_audio": hasAudio == null ? null : hasAudio,
        "tracking_token": trackingToken == null ? null : trackingToken,
        "video_url": videoUrl == null ? null : videoUrl,
        "video_view_count": videoViewCount == null ? null : videoViewCount,
        "edge_media_to_caption":
            edgeMediaToCaption == null ? null : edgeMediaToCaption.toJson(),
        "edge_media_to_comment":
            edgeMediaToComment == null ? null : edgeMediaToComment.toJson(),
        "comments_disabled": commentsDisabled == null ? null : commentsDisabled,
        "taken_at_timestamp":
            takenAtTimestamp == null ? null : takenAtTimestamp,
        "edge_liked_by": edgeLikedBy == null ? null : edgeLikedBy.toJson(),
        "edge_media_preview_like":
            edgeMediaPreviewLike == null ? null : edgeMediaPreviewLike.toJson(),
        "location": location,
        "thumbnail_src": thumbnailSrc == null ? null : thumbnailSrc,
        "thumbnail_resources": thumbnailResources == null
            ? null
            : List<dynamic>.from(thumbnailResources.map((x) => x.toJson())),
        "felix_profile_grid_crop": felixProfileGridCrop,
        "encoding_status": encodingStatus,
        "is_published": isPublished == null ? null : isPublished,
        "product_type": productType == null ? null : productType,
        "title": title == null ? null : title,
        "video_duration": videoDuration == null ? null : videoDuration,
      };
}

class DashInfo {
  DashInfo({
    this.isDashEligible,
    this.videoDashManifest,
    this.numberOfQualities,
  });

  bool isDashEligible;
  dynamic videoDashManifest;
  int numberOfQualities;

  factory DashInfo.fromJson(Map<String, dynamic> json) => DashInfo(
        isDashEligible:
            json["is_dash_eligible"] == null ? null : json["is_dash_eligible"],
        videoDashManifest: json["video_dash_manifest"],
        numberOfQualities: json["number_of_qualities"] == null
            ? null
            : json["number_of_qualities"],
      );

  Map<String, dynamic> toJson() => {
        "is_dash_eligible": isDashEligible == null ? null : isDashEligible,
        "video_dash_manifest": videoDashManifest,
        "number_of_qualities":
            numberOfQualities == null ? null : numberOfQualities,
      };
}

class Dimensions {
  Dimensions({
    this.height,
    this.width,
  });

  int height;
  int width;

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        height: json["height"] == null ? null : json["height"],
        width: json["width"] == null ? null : json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height == null ? null : height,
        "width": width == null ? null : width,
      };
}

class EdgeFollowClass {
  EdgeFollowClass({
    this.count,
  });

  int count;

  factory EdgeFollowClass.fromJson(Map<String, dynamic> json) =>
      EdgeFollowClass(
        count: json["count"] == null ? null : json["count"],
      );

  Map<String, dynamic> toJson() => {
        "count": count == null ? null : count,
      };
}

class EdgeRelatedProfilesClass {
  EdgeRelatedProfilesClass({
    this.edges,
  });

  List<EdgeRelatedProfilesEdge> edges;

  factory EdgeRelatedProfilesClass.fromJson(Map<String, dynamic> json) =>
      EdgeRelatedProfilesClass(
        edges: json["edges"] == null
            ? null
            : List<EdgeRelatedProfilesEdge>.from(
                json["edges"].map((x) => EdgeRelatedProfilesEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": edges == null
            ? null
            : List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class EdgeRelatedProfilesEdge {
  EdgeRelatedProfilesEdge({
    this.node,
  });

  FluffyNode node;

  factory EdgeRelatedProfilesEdge.fromJson(Map<String, dynamic> json) =>
      EdgeRelatedProfilesEdge(
        node: json["node"] == null ? null : FluffyNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node == null ? null : node.toJson(),
      };
}

class FluffyNode {
  FluffyNode({
    this.text,
  });

  String text;

  factory FluffyNode.fromJson(Map<String, dynamic> json) => FluffyNode(
        text: json["text"] == null ? null : json["text"],
      );

  Map<String, dynamic> toJson() => {
        "text": text == null ? null : text,
      };
}

class Owner {
  Owner({
    this.id,
    this.username,
  });

  String id;
  Username username;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"] == null ? null : json["id"],
        username: json["username"] == null
            ? null
            : usernameValues.map[json["username"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "username": username == null ? null : usernameValues.reverse[username],
      };
}

enum Username { GRIYABAYAR }

final usernameValues = EnumValues({"griyabayar": Username.GRIYABAYAR});

class SharingFrictionInfo {
  SharingFrictionInfo({
    this.shouldHaveSharingFriction,
    this.bloksAppUrl,
  });

  bool shouldHaveSharingFriction;
  dynamic bloksAppUrl;

  factory SharingFrictionInfo.fromJson(Map<String, dynamic> json) =>
      SharingFrictionInfo(
        shouldHaveSharingFriction: json["should_have_sharing_friction"] == null
            ? null
            : json["should_have_sharing_friction"],
        bloksAppUrl: json["bloks_app_url"],
      );

  Map<String, dynamic> toJson() => {
        "should_have_sharing_friction": shouldHaveSharingFriction == null
            ? null
            : shouldHaveSharingFriction,
        "bloks_app_url": bloksAppUrl,
      };
}

class ThumbnailResource {
  ThumbnailResource({
    this.src,
    this.configWidth,
    this.configHeight,
  });

  String src;
  int configWidth;
  int configHeight;

  factory ThumbnailResource.fromJson(Map<String, dynamic> json) =>
      ThumbnailResource(
        src: json["src"] == null ? null : json["src"],
        configWidth: json["config_width"] == null ? null : json["config_width"],
        configHeight:
            json["config_height"] == null ? null : json["config_height"],
      );

  Map<String, dynamic> toJson() => {
        "src": src == null ? null : src,
        "config_width": configWidth == null ? null : configWidth,
        "config_height": configHeight == null ? null : configHeight,
      };
}

class PageInfo {
  PageInfo({
    this.hasNextPage,
    this.endCursor,
  });

  bool hasNextPage;
  String endCursor;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        hasNextPage:
            json["has_next_page"] == null ? null : json["has_next_page"],
        endCursor: json["end_cursor"] == null ? null : json["end_cursor"],
      );

  Map<String, dynamic> toJson() => {
        "has_next_page": hasNextPage == null ? null : hasNextPage,
        "end_cursor": endCursor == null ? null : endCursor,
      };
}

class EdgeMutualFollowedBy {
  EdgeMutualFollowedBy({
    this.count,
    this.edges,
  });

  int count;
  List<dynamic> edges;

  factory EdgeMutualFollowedBy.fromJson(Map<String, dynamic> json) =>
      EdgeMutualFollowedBy(
        count: json["count"] == null ? null : json["count"],
        edges: json["edges"] == null
            ? null
            : List<dynamic>.from(json["edges"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "count": count == null ? null : count,
        "edges": edges == null ? null : List<dynamic>.from(edges.map((x) => x)),
      };
}

class EdgeOwnerToTimelineMedia {
  EdgeOwnerToTimelineMedia({
    this.count,
    this.pageInfo,
    this.edges,
  });

  int count;
  PageInfo pageInfo;
  List<EdgeOwnerToTimelineMediaEdge> edges;

  factory EdgeOwnerToTimelineMedia.fromJson(Map<String, dynamic> json) =>
      EdgeOwnerToTimelineMedia(
        count: json["count"] == null ? null : json["count"],
        pageInfo: json["page_info"] == null
            ? null
            : PageInfo.fromJson(json["page_info"]),
        edges: json["edges"] == null
            ? null
            : List<EdgeOwnerToTimelineMediaEdge>.from(json["edges"]
                .map((x) => EdgeOwnerToTimelineMediaEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count == null ? null : count,
        "page_info": pageInfo == null ? null : pageInfo.toJson(),
        "edges": edges == null
            ? null
            : List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class EdgeOwnerToTimelineMediaEdge {
  EdgeOwnerToTimelineMediaEdge({
    this.node,
  });

  TentacledNode node;

  factory EdgeOwnerToTimelineMediaEdge.fromJson(Map<String, dynamic> json) =>
      EdgeOwnerToTimelineMediaEdge(
        node:
            json["node"] == null ? null : TentacledNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node == null ? null : node.toJson(),
      };
}

class TentacledNode {
  TentacledNode({
    this.typename,
    this.id,
    this.shortcode,
    this.dimensions,
    this.displayUrl,
    this.edgeMediaToTaggedUser,
    this.factCheckOverallRating,
    this.factCheckInformation,
    this.gatingInfo,
    this.sharingFrictionInfo,
    this.mediaOverlayInfo,
    this.mediaPreview,
    this.owner,
    this.isVideo,
    this.accessibilityCaption,
    this.edgeMediaToCaption,
    this.edgeMediaToComment,
    this.commentsDisabled,
    this.takenAtTimestamp,
    this.edgeLikedBy,
    this.edgeMediaPreviewLike,
    this.location,
    this.thumbnailSrc,
    this.thumbnailResources,
  });

  Typename typename;
  String id;
  String shortcode;
  Dimensions dimensions;
  String displayUrl;
  EdgeMediaToTaggedUser edgeMediaToTaggedUser;
  dynamic factCheckOverallRating;
  dynamic factCheckInformation;
  dynamic gatingInfo;
  SharingFrictionInfo sharingFrictionInfo;
  dynamic mediaOverlayInfo;
  String mediaPreview;
  Owner owner;
  bool isVideo;
  String accessibilityCaption;
  EdgeRelatedProfilesClass edgeMediaToCaption;
  EdgeFollowClass edgeMediaToComment;
  bool commentsDisabled;
  int takenAtTimestamp;
  EdgeFollowClass edgeLikedBy;
  EdgeFollowClass edgeMediaPreviewLike;
  Location location;
  String thumbnailSrc;
  List<ThumbnailResource> thumbnailResources;

  factory TentacledNode.fromJson(Map<String, dynamic> json) => TentacledNode(
        typename: json["__typename"] == null
            ? null
            : typenameValues.map[json["__typename"]],
        id: json["id"] == null ? null : json["id"],
        shortcode: json["shortcode"] == null ? null : json["shortcode"],
        dimensions: json["dimensions"] == null
            ? null
            : Dimensions.fromJson(json["dimensions"]),
        displayUrl: json["display_url"] == null ? null : json["display_url"],
        edgeMediaToTaggedUser: json["edge_media_to_tagged_user"] == null
            ? null
            : EdgeMediaToTaggedUser.fromJson(json["edge_media_to_tagged_user"]),
        factCheckOverallRating: json["fact_check_overall_rating"],
        factCheckInformation: json["fact_check_information"],
        gatingInfo: json["gating_info"],
        sharingFrictionInfo: json["sharing_friction_info"] == null
            ? null
            : SharingFrictionInfo.fromJson(json["sharing_friction_info"]),
        mediaOverlayInfo: json["media_overlay_info"],
        mediaPreview:
            json["media_preview"] == null ? null : json["media_preview"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        isVideo: json["is_video"] == null ? null : json["is_video"],
        accessibilityCaption: json["accessibility_caption"] == null
            ? null
            : json["accessibility_caption"],
        edgeMediaToCaption: json["edge_media_to_caption"] == null
            ? null
            : EdgeRelatedProfilesClass.fromJson(json["edge_media_to_caption"]),
        edgeMediaToComment: json["edge_media_to_comment"] == null
            ? null
            : EdgeFollowClass.fromJson(json["edge_media_to_comment"]),
        commentsDisabled: json["comments_disabled"] == null
            ? null
            : json["comments_disabled"],
        takenAtTimestamp: json["taken_at_timestamp"] == null
            ? null
            : json["taken_at_timestamp"],
        edgeLikedBy: json["edge_liked_by"] == null
            ? null
            : EdgeFollowClass.fromJson(json["edge_liked_by"]),
        edgeMediaPreviewLike: json["edge_media_preview_like"] == null
            ? null
            : EdgeFollowClass.fromJson(json["edge_media_preview_like"]),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        thumbnailSrc:
            json["thumbnail_src"] == null ? null : json["thumbnail_src"],
        thumbnailResources: json["thumbnail_resources"] == null
            ? null
            : List<ThumbnailResource>.from(json["thumbnail_resources"]
                .map((x) => ThumbnailResource.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "__typename":
            typename == null ? null : typenameValues.reverse[typename],
        "id": id == null ? null : id,
        "shortcode": shortcode == null ? null : shortcode,
        "dimensions": dimensions == null ? null : dimensions.toJson(),
        "display_url": displayUrl == null ? null : displayUrl,
        "edge_media_to_tagged_user": edgeMediaToTaggedUser == null
            ? null
            : edgeMediaToTaggedUser.toJson(),
        "fact_check_overall_rating": factCheckOverallRating,
        "fact_check_information": factCheckInformation,
        "gating_info": gatingInfo,
        "sharing_friction_info":
            sharingFrictionInfo == null ? null : sharingFrictionInfo.toJson(),
        "media_overlay_info": mediaOverlayInfo,
        "media_preview": mediaPreview == null ? null : mediaPreview,
        "owner": owner == null ? null : owner.toJson(),
        "is_video": isVideo == null ? null : isVideo,
        "accessibility_caption":
            accessibilityCaption == null ? null : accessibilityCaption,
        "edge_media_to_caption":
            edgeMediaToCaption == null ? null : edgeMediaToCaption.toJson(),
        "edge_media_to_comment":
            edgeMediaToComment == null ? null : edgeMediaToComment.toJson(),
        "comments_disabled": commentsDisabled == null ? null : commentsDisabled,
        "taken_at_timestamp":
            takenAtTimestamp == null ? null : takenAtTimestamp,
        "edge_liked_by": edgeLikedBy == null ? null : edgeLikedBy.toJson(),
        "edge_media_preview_like":
            edgeMediaPreviewLike == null ? null : edgeMediaPreviewLike.toJson(),
        "location": location == null ? null : location.toJson(),
        "thumbnail_src": thumbnailSrc == null ? null : thumbnailSrc,
        "thumbnail_resources": thumbnailResources == null
            ? null
            : List<dynamic>.from(thumbnailResources.map((x) => x.toJson())),
      };
}

class EdgeMediaToTaggedUser {
  EdgeMediaToTaggedUser({
    this.edges,
  });

  List<PurpleEdge> edges;

  factory EdgeMediaToTaggedUser.fromJson(Map<String, dynamic> json) =>
      EdgeMediaToTaggedUser(
        edges: json["edges"] == null
            ? null
            : List<PurpleEdge>.from(
                json["edges"].map((x) => PurpleEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": edges == null
            ? null
            : List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class PurpleEdge {
  PurpleEdge({
    this.node,
  });

  StickyNode node;

  factory PurpleEdge.fromJson(Map<String, dynamic> json) => PurpleEdge(
        node: json["node"] == null ? null : StickyNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node == null ? null : node.toJson(),
      };
}

class StickyNode {
  StickyNode({
    this.user,
    this.x,
    this.y,
  });

  NodeUser user;
  double x;
  double y;

  factory StickyNode.fromJson(Map<String, dynamic> json) => StickyNode(
        user: json["user"] == null ? null : NodeUser.fromJson(json["user"]),
        x: json["x"] == null ? null : json["x"].toDouble(),
        y: json["y"] == null ? null : json["y"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user.toJson(),
        "x": x == null ? null : x,
        "y": y == null ? null : y,
      };
}

class NodeUser {
  NodeUser({
    this.fullName,
    this.id,
    this.isVerified,
    this.profilePicUrl,
    this.username,
  });

  String fullName;
  String id;
  bool isVerified;
  String profilePicUrl;
  String username;

  factory NodeUser.fromJson(Map<String, dynamic> json) => NodeUser(
        fullName: json["full_name"] == null ? null : json["full_name"],
        id: json["id"] == null ? null : json["id"],
        isVerified: json["is_verified"] == null ? null : json["is_verified"],
        profilePicUrl:
            json["profile_pic_url"] == null ? null : json["profile_pic_url"],
        username: json["username"] == null ? null : json["username"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName == null ? null : fullName,
        "id": id == null ? null : id,
        "is_verified": isVerified == null ? null : isVerified,
        "profile_pic_url": profilePicUrl == null ? null : profilePicUrl,
        "username": username == null ? null : username,
      };
}

class Location {
  Location({
    this.id,
    this.hasPublicPage,
    this.name,
    this.slug,
  });

  String id;
  bool hasPublicPage;
  String name;
  String slug;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"] == null ? null : json["id"],
        hasPublicPage:
            json["has_public_page"] == null ? null : json["has_public_page"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "has_public_page": hasPublicPage == null ? null : hasPublicPage,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
      };
}

enum Typename { GRAPH_IMAGE }

final typenameValues = EnumValues({"GraphImage": Typename.GRAPH_IMAGE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
