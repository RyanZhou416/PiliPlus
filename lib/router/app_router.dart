import 'package:PiliPlus/common/widgets/route_aware_mixin.dart';
import 'package:PiliPlus/pages/about/view.dart';
import 'package:PiliPlus/pages/article/view.dart';
import 'package:PiliPlus/pages/article_list/view.dart';
import 'package:PiliPlus/pages/audio/view.dart';
import 'package:PiliPlus/pages/blacklist/view.dart';
import 'package:PiliPlus/pages/bubble/view.dart';
import 'package:PiliPlus/pages/danmaku_block/view.dart';
import 'package:PiliPlus/pages/dlna/view.dart';
import 'package:PiliPlus/pages/download/view.dart';
import 'package:PiliPlus/pages/dynamics/view.dart';
import 'package:PiliPlus/pages/dynamics_create_vote/view.dart';
import 'package:PiliPlus/pages/dynamics_detail/view.dart';
import 'package:PiliPlus/pages/dynamics_topic/view.dart';
import 'package:PiliPlus/pages/dynamics_topic_rcmd/view.dart';
import 'package:PiliPlus/pages/fan/view.dart';
import 'package:PiliPlus/pages/fav/view.dart';
import 'package:PiliPlus/pages/fav_create/view.dart';
import 'package:PiliPlus/pages/fav_detail/view.dart';
import 'package:PiliPlus/pages/fav_search/view.dart';
import 'package:PiliPlus/pages/follow/view.dart';
import 'package:PiliPlus/pages/follow_search/view.dart';
import 'package:PiliPlus/pages/follow_type/follow_same/view.dart';
import 'package:PiliPlus/pages/follow_type/followed/view.dart';
import 'package:PiliPlus/pages/history/view.dart';
import 'package:PiliPlus/pages/history_search/view.dart';
import 'package:PiliPlus/pages/home/view.dart';
import 'package:PiliPlus/pages/hot/view.dart';
import 'package:PiliPlus/pages/later/view.dart';
import 'package:PiliPlus/pages/later_search/view.dart';
import 'package:PiliPlus/pages/live_dm_block/view.dart';
import 'package:PiliPlus/pages/live_room/view.dart';
import 'package:PiliPlus/pages/login/view.dart';
import 'package:PiliPlus/pages/main/view.dart';
import 'package:PiliPlus/pages/main_reply/view.dart';
import 'package:PiliPlus/pages/match_info/view.dart';
import 'package:PiliPlus/pages/member/view.dart';
import 'package:PiliPlus/pages/member_dynamics/view.dart';
import 'package:PiliPlus/pages/member_guard/view.dart';
import 'package:PiliPlus/pages/member_profile/view.dart';
import 'package:PiliPlus/pages/member_search/view.dart';
import 'package:PiliPlus/pages/member_upower_rank/view.dart';
import 'package:PiliPlus/pages/member_video_web/archive/view.dart';
import 'package:PiliPlus/pages/member_video_web/season_series/view.dart';
import 'package:PiliPlus/pages/msg_feed_top/at_me/view.dart';
import 'package:PiliPlus/pages/msg_feed_top/like_detail/view.dart';
import 'package:PiliPlus/pages/msg_feed_top/like_me/view.dart';
import 'package:PiliPlus/pages/msg_feed_top/reply_me/view.dart';
import 'package:PiliPlus/pages/msg_feed_top/sys_msg/view.dart';
import 'package:PiliPlus/pages/music/view.dart';
import 'package:PiliPlus/pages/my_reply/view.dart';
import 'package:PiliPlus/pages/popular_precious/view.dart';
import 'package:PiliPlus/pages/popular_series/view.dart';
import 'package:PiliPlus/pages/search/view.dart';
import 'package:PiliPlus/pages/search_result/view.dart';
import 'package:PiliPlus/pages/search_trending/view.dart';
import 'package:PiliPlus/pages/setting/extra_setting.dart';
import 'package:PiliPlus/pages/setting/pages/bar_set.dart';
import 'package:PiliPlus/pages/setting/pages/color_select.dart';
import 'package:PiliPlus/pages/setting/pages/display_mode.dart';
import 'package:PiliPlus/pages/setting/pages/font_size_select.dart';
import 'package:PiliPlus/pages/setting/pages/logs.dart';
import 'package:PiliPlus/pages/setting/pages/play_speed_set.dart';
import 'package:PiliPlus/pages/setting/play_setting.dart';
import 'package:PiliPlus/pages/setting/privacy_setting.dart';
import 'package:PiliPlus/pages/setting/recommend_setting.dart';
import 'package:PiliPlus/pages/setting/style_setting.dart';
import 'package:PiliPlus/pages/setting/video_setting.dart';
import 'package:PiliPlus/pages/setting/view.dart';
import 'package:PiliPlus/pages/settings_search/view.dart';
import 'package:PiliPlus/pages/space_setting/view.dart';
import 'package:PiliPlus/pages/sponsor_block/view.dart';
import 'package:PiliPlus/pages/subscription/view.dart';
import 'package:PiliPlus/pages/subscription_detail/view.dart';
import 'package:PiliPlus/pages/video/view.dart';
import 'package:PiliPlus/pages/webdav/view.dart';
import 'package:PiliPlus/pages/webview/view.dart';
import 'package:PiliPlus/pages/whisper/view.dart';
import 'package:PiliPlus/pages/whisper_detail/view.dart';
import 'package:PiliPlus/router/app_routes.dart';
import 'package:PiliPlus/utils/nav.dart';
import 'package:PiliPlus/utils/storage_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart' show Transition;

Page<T> buildTransitionPage<T>(GoRouterState state, Widget child) {
  final transition = Pref.pageTransition;
  switch (transition) {
    case Transition.fade:
      return CustomTransitionPage<T>(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      );
    case Transition.rightToLeft:
      return CustomTransitionPage<T>(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      );
    case Transition.leftToRight:
      return CustomTransitionPage<T>(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      );
    case Transition.upToDown:
      return CustomTransitionPage<T>(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(0.0, -1.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      );
    case Transition.downToUp:
      return CustomTransitionPage<T>(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      );
    case Transition.zoom:
      return CustomTransitionPage<T>(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            ScaleTransition(scale: animation, child: child),
      );
    case Transition.noTransition:
      return NoTransitionPage<T>(key: state.pageKey, child: child);
    case Transition.cupertino:
      return CupertinoPage<T>(key: state.pageKey, child: child);
    case Transition.native || _:
      return MaterialPage<T>(key: state.pageKey, child: child);
  }
}

GoRouter createRouter() {
  final router = GoRouter(
    navigatorKey: Nav.navigatorKey,
    initialLocation: AppRoutes.root,
    observers: [
      routeObserver,
      FlutterSmartDialog.observer,
    ],
    routes: [
      GoRoute(
        path: AppRoutes.root,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const MainApp()),
      ),
      GoRoute(
        path: AppRoutes.home,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const HomePage()),
      ),
      GoRoute(
        path: AppRoutes.hot,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const HotPage()),
      ),
      GoRoute(
        path: AppRoutes.videoV,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const VideoDetailPageV()),
      ),
      GoRoute(
        path: AppRoutes.webview,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const WebviewPage()),
      ),
      GoRoute(
        path: AppRoutes.setting,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const SettingPage()),
      ),
      GoRoute(
        path: AppRoutes.fav,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const FavPage()),
      ),
      GoRoute(
        path: AppRoutes.favDetail,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const FavDetailPage()),
      ),
      GoRoute(
        path: AppRoutes.later,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const LaterPage()),
      ),
      GoRoute(
        path: AppRoutes.history,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const HistoryPage()),
      ),
      GoRoute(
        path: AppRoutes.search,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const SearchPage()),
      ),
      GoRoute(
        path: AppRoutes.searchResult,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const SearchResultPage()),
      ),
      GoRoute(
        path: AppRoutes.dynamics,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const DynamicsPage()),
      ),
      GoRoute(
        path: AppRoutes.dynamicDetail,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const DynamicDetailPage()),
      ),
      GoRoute(
        path: AppRoutes.follow,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const FollowPage()),
      ),
      GoRoute(
        path: AppRoutes.fan,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const FansPage()),
      ),
      GoRoute(
        path: AppRoutes.liveRoom,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const LiveRoomPage()),
      ),
      GoRoute(
        path: AppRoutes.member,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const MemberPage()),
      ),
      GoRoute(
        path: AppRoutes.memberSearch,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const MemberSearchPage()),
      ),
      GoRoute(
        path: AppRoutes.recommendSetting,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const RecommendSetting()),
      ),
      GoRoute(
        path: AppRoutes.videoSetting,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const VideoSetting()),
      ),
      GoRoute(
        path: AppRoutes.playSetting,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const PlaySetting()),
      ),
      GoRoute(
        path: AppRoutes.styleSetting,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const StyleSetting()),
      ),
      GoRoute(
        path: AppRoutes.privacySetting,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const PrivacySetting()),
      ),
      GoRoute(
        path: AppRoutes.extraSetting,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const ExtraSetting()),
      ),
      GoRoute(
        path: AppRoutes.blackListPage,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const BlackListPage()),
      ),
      GoRoute(
        path: AppRoutes.colorSetting,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const ColorSelectPage()),
      ),
      GoRoute(
        path: AppRoutes.fontSizeSetting,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const FontSizeSelectPage()),
      ),
      GoRoute(
        path: AppRoutes.displayModeSetting,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const SetDisplayMode()),
      ),
      GoRoute(
        path: AppRoutes.about,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const AboutPage()),
      ),
      GoRoute(
        path: AppRoutes.articlePage,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const ArticlePage()),
      ),
      GoRoute(
        path: AppRoutes.playSpeedSet,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const PlaySpeedPage()),
      ),
      GoRoute(
        path: AppRoutes.favSearch,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const FavSearchPage()),
      ),
      GoRoute(
        path: AppRoutes.historySearch,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const HistorySearchPage()),
      ),
      GoRoute(
        path: AppRoutes.laterSearch,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const LaterSearchPage()),
      ),
      GoRoute(
        path: AppRoutes.followSearch,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const FollowSearchPage()),
      ),
      GoRoute(
        path: AppRoutes.whisper,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const WhisperPage()),
      ),
      GoRoute(
        path: AppRoutes.whisperDetail,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const WhisperDetailPage()),
      ),
      GoRoute(
        path: AppRoutes.replyMe,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const ReplyMePage()),
      ),
      GoRoute(
        path: AppRoutes.atMe,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const AtMePage()),
      ),
      GoRoute(
        path: AppRoutes.likeMe,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const LikeMePage()),
      ),
      GoRoute(
        path: AppRoutes.sysMsg,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const SysMsgPage()),
      ),
      GoRoute(
        path: AppRoutes.loginPage,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const LoginPage()),
      ),
      GoRoute(
        path: AppRoutes.memberDynamics,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const MemberDynamicsPage()),
      ),
      GoRoute(
        path: AppRoutes.logs,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const LogsPage()),
      ),
      GoRoute(
        path: AppRoutes.subscription,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const SubPage()),
      ),
      GoRoute(
        path: AppRoutes.subDetail,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const SubDetailPage()),
      ),
      GoRoute(
        path: AppRoutes.danmakuBlock,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const DanmakuBlockPage()),
      ),
      GoRoute(
        path: AppRoutes.sponsorBlock,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const SponsorBlockPage()),
      ),
      GoRoute(
        path: AppRoutes.createFav,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const CreateFavPage()),
      ),
      GoRoute(
        path: AppRoutes.editProfile,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const EditProfilePage()),
      ),
      GoRoute(
        path: AppRoutes.settingsSearch,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const SettingsSearchPage()),
      ),
      GoRoute(
        path: AppRoutes.webdavSetting,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const WebDavSettingPage()),
      ),
      GoRoute(
        path: AppRoutes.searchTrending,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const SearchTrendingPage()),
      ),
      GoRoute(
        path: AppRoutes.dynTopic,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const DynTopicPage()),
      ),
      GoRoute(
        path: AppRoutes.articleList,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const ArticleListPage()),
      ),
      GoRoute(
        path: AppRoutes.barSetting,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const BarSetPage()),
      ),
      GoRoute(
        path: AppRoutes.upowerRank,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const UpowerRankPage()),
      ),
      GoRoute(
        path: AppRoutes.spaceSetting,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const SpaceSettingPage()),
      ),
      GoRoute(
        path: AppRoutes.dynTopicRcmd,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const DynTopicRcmdPage()),
      ),
      GoRoute(
        path: AppRoutes.matchInfo,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const MatchInfoPage()),
      ),
      GoRoute(
        path: AppRoutes.msgLikeDetail,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const LikeDetailPage()),
      ),
      GoRoute(
        path: AppRoutes.liveDmBlockPage,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const LiveDmBlockPage()),
      ),
      GoRoute(
        path: AppRoutes.createVote,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const CreateVotePage()),
      ),
      GoRoute(
        path: AppRoutes.musicDetail,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const MusicDetailPage()),
      ),
      GoRoute(
        path: AppRoutes.popularSeries,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const PopularSeriesPage()),
      ),
      GoRoute(
        path: AppRoutes.popularPrecious,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const PopularPreciousPage()),
      ),
      GoRoute(
        path: AppRoutes.audio,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const AudioPage()),
      ),
      GoRoute(
        path: AppRoutes.mainReply,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const MainReplyPage()),
      ),
      GoRoute(
        path: AppRoutes.followed,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const FollowedPage()),
      ),
      GoRoute(
        path: AppRoutes.sameFollowing,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const FollowSamePage()),
      ),
      GoRoute(
        path: AppRoutes.download,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const DownloadPage()),
      ),
      GoRoute(
        path: AppRoutes.dlna,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const DLNAPage()),
      ),
      GoRoute(
        path: AppRoutes.myReply,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const MyReply()),
      ),
      GoRoute(
        path: AppRoutes.videoWeb,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const MemberVideoWeb()),
      ),
      GoRoute(
        path: AppRoutes.ssWeb,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const MemberSSWeb()),
      ),
      GoRoute(
        path: AppRoutes.memberGuard,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const MemberGuard()),
      ),
      GoRoute(
        path: AppRoutes.bubble,
        pageBuilder: (context, state) =>
            buildTransitionPage(state, const BubblePage()),
      ),
    ],
  );

  Nav.init(router);
  return router;
}
