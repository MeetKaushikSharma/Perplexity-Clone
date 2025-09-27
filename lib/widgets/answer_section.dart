import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:perplexity_clone/services/chat_web_service.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  bool isLoading = true;

  String fullResponse = ''' 
India and Australia are currently playing a series across multiple formats, but based on the latest available, up-to-date information, here are the scores and match summaries from the most recent contests:

### India vs Australia (Main National Teams)
- In the latest major encounter (ICC Champions Trophy, 1st Semi-Final), India successfully chased down Australia's score. Australia scored 264 runs, and India chased it, finishing at 267/6 in 48.1 overs, winning the match with 11 balls to spare. Key contributions for India included a 91-run partnership between Shreyas Iyer and Virat Kohli, with Kohli scoring 84. The match featured balanced spin and pace on a dry pitch, with both sides under pressure but India controlling the chase well.[1]

### India A vs Australia A (Unofficial Test, 2025)
- In the ongoing 2nd Unofficial Test (Day 3), Australia A, having set a first-inning lead with 420 runs, ended Day 3 at 170/8 in their second innings. India A earlier made 194 in their first innings, largely thanks to B Sai Sudharsan’s 75. At stumps, Australia A's overall lead stands at 242 runs, as India A bowlers fought back with crucial wickets, especially from Gurnoor Brar and MJ Suthar.[2]

### Score Table Summary

| Match Type          | Latest Status                                                                                                   | Highlight                                                                                                  |
|---------------------|----------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------|
| ICC Champions Trophy SF | India: 267/6 (48.1 overs), Australia: 264 all out                                                          | India chased the target with 11 balls left, starring Kohli (84) and Shreyas (91-run stand)[1]          |
| Unofficial Test (A Teams)   | Australia A: 170/8 (2nd innings, lead 242 at stumps, Day 3), India A: 194 all out (1st innings)         | Brar and Suthar key for India A; Sai Sudharsan top scored with 75[2]                                   |


### Other Test Matches in 2024-25 (Reference)
- In the last completed 1st Test of India's tour of Australia, India beat Australia by 295 runs. India batted first, declaring at 487/6 with Kohli and Jaiswal scoring centuries. Australia managed 104 and 238 in their two innings, with Indian bowlers dominating.[3]

If more recent scores or a specific match update is needed (including T20, ODI, or women's matches), please specify the format or day for sharper details.

[1](https://www.cricbuzz.com/live-cricket-scores/112462/ind-vs-aus-1st-semi-final-a1-v-b2-icc-champions-trophy-2025)
[2](https://www.news18.com/cricket/india-a-vs-australia-a-live-score-2nd-unofficial-test-day-3-latest-scorecard-updates-lucknow-rahul-siraj-jurel-padikkal-sudharsan-liveblog-9594973.html)
[3](https://indianexpress.com/article/sports/cricket/ind-vs-aus-1st-test-day-3-live-score-india-vs-australia-live-cricket-scorecard-updates-optus-stadium-perth-9686795/)
[4](https://www.cricbuzz.com/live-cricket-scorecard/91778/aus-vs-ind-1st-test-india-tour-of-australia-2024-25)
[5](https://www.espncricinfo.com/series/icc-champions-trophy-2024-25-1459031/australia-vs-india-1st-semi-final-1466426/full-scorecard)
[6](https://www.hotstar.com/in/sports/cricket/aus-u19-vs-ind-u19-2nd-odi-highlights/1540051801/video/highlights/watch)
[7](https://www.youtube.com/watch?v=ghUNWwC3dio)
[8](https://www.cricbuzz.com/live-cricket-scores/91805/aus-vs-ind-4th-test-india-tour-of-australia-2024-25)
[9](https://www.youtube.com/watch?v=E58nRLFXD-s)
[10](https://www.youtube.com/watch?v=4wU-g9oG2Pw)
[11](https://www.cricbuzz.com/cricket-series/7745/india-tour-of-australia-2024-25/matches)
[12](https://www.hotstar.com/in/sports/cricket/ind-w-vs-aus-w-3rd-odi-highlights/1540051498/video/highlights/watch)
[13](https://www.espncricinfo.com/series/australia-a-in-india-2025-26-1488251/india-a-vs-australia-a-1st-unofficial-test-1488257/match-report)
[14](https://sports.ndtv.com/cricket/ind-vs-aus-scorecard-live-cricket-score-australia-in-india-3-odi-series-2020-2nd-odi-inau01172020190941)
[15](https://www.youtube.com/watch?v=YcMS3GvTgSk)
[16](https://www.espncricinfo.com/records/headtohead/team-series-results/australia-india-2vs6/test-matches-1)
[17](https://www.cricbuzz.com/live-cricket-scores/91778/aus-vs-ind-1st-test-india-tour-of-australia-2024-25)
[18](https://m.cricbuzz.com/player-match-highlights/119852/4/8733/batting)
[19](https://www.cricbuzz.com/live-cricket-scores/91796/aus-vs-ind-3rd-test-india-tour-of-australia-2024-25)
[20](https://www.youtube.com/watch?v=URl9QdCwmmc)

  ''';

  @override
  void initState() {
    super.initState();
    ChatWebService().contentStream.listen((data) {
      if (isLoading) {
        fullResponse = "";
      }
      setState(() {
        fullResponse += data['data'];
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Perplexity',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Skeletonizer(
          enabled: isLoading,
          effect: const ShimmerEffect(
            baseColor: Color(0xFFE0E0E0),
            highlightColor: Color(0xFFF5F5F5),
            duration: Duration(seconds: 1),
          ),

          child: Markdown(
            data: fullResponse,
            shrinkWrap: true,
            styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
                .copyWith(
                  codeblockDecoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  code: const TextStyle(fontSize: 16),
                ),
          ),
        ),
      ],
    );
  }
}
