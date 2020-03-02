import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:technovation2020/src/bloc/event_ready_bloc.dart';
import 'package:technovation2020/src/model/event_model.dart';

enum EventProviderType { CATEGORY, DAY }

EventProvider eventProvider;

class EventProvider {
  List<dynamic> eventDynamic;
  List<List<EventModel>> eventDetails;

  static Future<EventProvider> create() async {
    if (eventProvider == null) {
      try {
        EventReadyBloc erb = EventReadyBloc();
        erb.no();
        http.Response res = await http
            .get('https://omega.pythonanywhere.com/android_api/get_events/');
        eventProvider = EventProvider();
        eventProvider.eventDetails = [
          [
            EventModel.fromJson({
              "id": 0,
              "image": "000.jpg",
              "name": "Internet Mystery",
              "description":
                  "This is an event to test the deciphering abilities of participants. Participants will need to solve some mind-boggling puzzles to get to the treasure. This event will be conducted in two phases.\n\nPhase1: It will be a pre-event. Participants will need to solve all the puzzles to know when and where phase 2 will be conducted.\n\nPhase 2: The final puzzle, which will be provided on the spot."
                  "\n\nIMPORTANT: App provided with puzzle is only required in phase 2 and its entry code will be provided on the spot.",
              "rules": [
                "It is an individual challenge",
                "Full use of internet is allowed"
              ],
              "coordinators": ["Md.Azharuddin", "Sonali Mishra"],
              "coordinatorsNumber": ["9078600498", "9439141156"],
              "judgement": [
                "The very first person to solve the final puzzle will win the prize."
              ],
            }),
            EventModel.fromJson({
              "id": 1,
              "image": "001.jpg",
              "name": "Suspense Coding",
              "description":
                  "This is an event to test the algorithmic understanding of participants. Participants will need to write simple programs like addition of numbers, finding factorial etc. with an unknown language. They will have full access to the documentation of the language.",
              "rules": [
                "Participants per group- maximum 2",
                "Full access to internet.",
                "Time: 1 hr."
              ],
              "coordinators": ["Md.Azharuddin", "Rashmi Rekha Dash"],
              "coordinatorsNumber": ["9078600498", "8658937992"],
              "judgement": ["The one who scores maximum points will win."]
            }),
            EventModel.fromJson({
              "id": 2,
              "image": "002.jpg",
              "name": "Tech Fresh",
              "description":
                  "If you are looking for a lively event humming with the energy of sparked-up brains working together, your destination is here!\n\nRound 1: An aptitude test to examine the basic understanding of problems.\n\nRound 2: You will be given puzzles which you are expected to decode with given constraints. Each puzzle solved will put you ahead in the race.\nFeeling the heat, right!!",
              "rules": ["At max 2 students per team."],
              "coordinators": ["Hrushikesh Sahu", "Satya Sarathi Barik"],
              "coordinatorsNumber": ["9668633561", "7377477891"],
              "judgement": []
            }),
            EventModel.fromJson({
              "id": 3,
              "image": "003.jpg",
              "name": "Debugger",
              "description":
                  "This is an event to test the error correcting capabilities of the participants. The participants will be given several pieces of code each containing some errors which they need to correct.",
              "rules": [
                "At max 2 participants per group",
                "Use of internet is prohibited",
                "Time: 1 hr"
              ],
              "coordinators": ["Andhavarapu Supriya", "Poonam Das"],
              "coordinatorsNumber": ["8018917590", "9090832910"],
              "judgement": ["One who scores highest points will win."]
            }),
            EventModel.fromJson({
              "id": 4,
              "image": "004.jpg",
              "name": "Blind Coding",
              "description":
                  "Ever wondered what is to type code without seeing what you are writing. This event will let you experience this.\n\nParticipants will be given a question for which they need to write a program in paper. After they are done, they will need to type their program into their computer with their monitor turned off.",
              "rules": ["One person per team", "Time: 1hr"],
              "coordinators": ["Gayatri Jena", "Simarani Rout"],
              "coordinatorsNumber": ["8118035303", "7596806985"],
              "judgement": [
                "Points will be rewarded based on how less mistakes one makes during typing."
              ]
            }),
            EventModel.fromJson({
              "id": 5,
              "image": "005.jpg",
              "name": "Paper Presentation",
              "description":
                  "Wanna know how good you are in presenting your ideas, view and information. Then this event is for you. You can present any technical subject of your interest.",
              "rules": [
                "At max 3 participants per group",
                "Time: 15 minutes per group",
                "Must have a ppt"
              ],
              "coordinators": ["Md.Azharuddin", "Swadesh Patra"],
              "coordinatorsNumber": ["9078600498", "8598930053"],
              "judgement": ["Group with best presentation will win"]
            }),
            EventModel.fromJson({
              "id": 6,
              "image": "006.jpg",
              "name": "Mock Interview",
              "description":
                  "So, you have never faced any interview before! Wanna know how it feels to sit for an interview? . Then what are you waiting for! Come and test how good you are when it comes to interview.",
              "rules": [
                "1 participant per team",
                "Time: Will depend on interviewer"
              ],
              "coordinators": ["Supriya Panda", "Monalisa Giri"],
              "coordinatorsNumber": ["8280737707", "8339820727"],
              "judgement": ["Based on performance"]
            }),
            EventModel.fromJson({
              "id": 7,
              "image": "007.jpg",
              "name": "Techno Cupid",
              "description":
                  "The most awaited couple event from last year is back!. In this a male and a female coder needs to work with each other to defeat other couples. It consists of two rounds each related to programming and partnership.\n\nRound 1: In this round couples will be given a piece if code which they have to type and run within specified time. The code may have errors which they need to correct. Top 10 pairs with fastest performance will be selected for next round.\n\nRound 2: This round is based on mutual understanding and how much do they know about each other.",
              "rules": [
                "1 male and 1 female per group",
                "Time: 1 hr per round",
                "Use of interner is prohibited"
              ],
              "coordinators": ["Yashobanta Kumar Behera", "Anuranjita Kund"],
              "coordinatorsNumber": ["9556580938", "6370400017"],
              "judgement": []
            }),
            EventModel.fromJson({
              "id": 8,
              "image": "008.jpg",
              "name": "Chanakya Neeti",
              "description":
                  "If you want to take your passion of mystery beyond reading books and listening to podcast, we have some good news!\n\nUse your instinct and common sense to solve the real life problems within a given time frame.\n\nCome Decrypt, Defuse, Decode and Survive.",
              "rules": ["Maximum number of participants per team is 2."],
              "coordinators": ["Sonali Mishra", "Digvijay"],
              "coordinatorsNumber": ["9439141156", "8908804085"],
              "judgement": ["One who solves all the puzzles first, will win"]
            }),
            EventModel.fromJson({
              "id": 9,
              "image": "009.jpg",
              "name": "Lazer Maze",
              "description":
              "It is a real life heist style game where you dodge lasers and finish the track levels as quickly as possible without setting off the alarm.\n\nYou have to use your body balance and flexibility to reach the end of the room without touching the lasers.",
              "rules": [],
              "coordinators": ["Swadesh Patra", "Soumya Ranjan Naik"],
              "coordinatorsNumber": ["8598930053", "8249595118"],
              "judgement": []
            }),
          ],
          [
            EventModel.fromJson({
              "id": 100,
              "image": "100.jpg",
              "name": "Encantador",
              "description":
                  "Being well dressed hasn’t much to do with having good clothes. It’s a question of good balance and good common sense. So in order to be irreplaceable one must always be different.\n\nSo wake up beauties and hunks, its time to beast, for we are back with the 4th edition of Encantador, the fashion show.\n\nBe the designer of your own and let the fire inside you burn brighter than the fire around you.\n\nThemes:\n\nBollywood\nWizardry\nColors of the sea\nAnimals in cage\nShades of karma \"Zodiac\"\nPalace of illusions\nGarbage bag gala\nDiversity of India\nCandy Land\nK-Pop\n",
              "rules": [
                "Each team will consist of 6-9 members",
                "Every team will have to base their performance on a specific theme",
                "Every team will be given a time limit of maximum 3 minutes.",
                "Every team will have to bring its own music track for the walk.",
                "Each theme can be taken up by a maximum of 2 teams on a first come first serve basis."
              ],
              "coordinators": ["Azazul Haque", "Monalisha sahoo", "Satya Prakash Rout", "Pujarani Rout"],
              "coordinatorsNumber": ["8457867856", "9348328210", "9040583814", "6370873252"],
              "judgement": [
                "On the basis of Creativity",
                "On the basis of Confidense",
                "On the basis of Costume design",
                "On the basis of Relevance to the theme",
                "On the basis of Originality of concept",
                "On the basis of Interaction with the audience"
              ]
            }),
            EventModel.fromJson({
              "id": 101,
              "image": "101.jpg",
              "name": "Star Night",
              "description":
                  "Come and Enjoy! We have a Special guest waiting to make your night a lifetime experience.",
              "rules": [],
              "coordinators": ["Prasant Kumar Dey", "Monalisha Sahoo"],
              "coordinatorsNumber": ["9078824629", "9348328210"],
              "judgement": []
            }),
            EventModel.fromJson({
              "id": 102,
              "image": "102.jpg",
              "name": "Spectacolo-di-Talenti",
              "description":
                  "\"The entire world ‘s a stage\", they say. For the people who believe this , for the people with passion and obsession, we have the right stage for you!. Be it comedy, mimicry, acting, magic, dance or any quirky thing you are passionately curious about, we have the stage ready for you!. Give the crowd the time of their lives. Spectacolo-di-talenti brings the opportunityto make your move.",
                  "\n\nDance:- It may be solo or duet or group performance having maximum 8 members.(Duration: 3-4 min)"
                  "\n\nSong:- Songs of any language may be sung. (Duration: 3-4 min)."
                  "\n\nInstrumental:- All types of instruments are allowed. (Duration: 3-4 min)"
                  "\n\nAct:- Mono act or skit can be performed. (Duration: 3-4 min)"
                  "\n\nBand Performance (Duration: 3-4 min)"
              "rules": [
                "The entry fee per person will be Rs 50/-",
                "Time limit for every performance must be strictly within 3 - 4 minutes.",
                "Any kind of talent may be showcased on the stage, be it comedy, mimicry, acting, magic, dance, etc.",
                "The contestants need to submit their music track to the coordinators in advance.",
                "Use of props is allowed.",
                "Requirements of any sort must be informed well before hand.",
                "Use of fire/water/smoke in any form is not allowed.",
                "The decision of the judges will be final and binding in all cases.",
                "Organizers have full authority to disqualify the participation in case of any discrepancy."
              ],
              "coordinators": ["Prasant Kumar Dey", "Jhalsa Mishra", "Kaushik Kumar Behera", "Pujarani Rout"],
              "coordinatorsNumber": ["9078824629", "7788818623", "8328820950", "6370873252"],
              "judgement": [
                "On the basis of Skill and Creativity",
                "On the basis of Presentation",
              ]
            }),
            EventModel.fromJson({
              "id": 103,
              "image": "103.jpg",
              "name": "Mr. & Mrs. Technovation",
              "description":
                  "“Success is a series of small wins”.\n\nThe most awaited, charismatic, Mr. and Mrs. Technovation is back with a bang. An online event where you will be asked to send a picture of yours And the participant with the highest number of likes will qualify to the next round followed by some other interesting rounds.\n\nThe difference between ordinary and extraordinary is that little “extra”. Go that extra mile, Make it happen . Cause no one is you and that is your superpower."
                      "\n\nProcedure:\n\nThe contestants will send their photo on the email ID mrandmisstechnovation2020@gmail.com on or before 10TH MARCH.\n\nThe pics sent by the contestants will be posted in Mr and Miss Technovation page.\n\nThe jury shall consider the likes of those persons who like the pic as well as the Mr  & Miss Technovation page.\n\nTop 16 participants (8 boys and 8 girls inclusively) getting the maximum likes for their pic on the page will be selected for the 2nd round to be conducted at IGIT, Sarang during Technovation 2020."
                      "\n\nMr & Miss Fame (the boy and the girl who will be the Highest like holder) will get some bonus point in this competition.\n\nIn the 2nd round the participants will face the quiz test and self performance (Dancing , singing or Solo Act) and PI.\n\nAmong all the 16 participants, 10 (5 boys and 5 girls) will be selected for the final round.\n\nWinner of Mr. Technovation and Miss Technovation will be decided based on the participants' performance in the Final round (Ramp Walk)."
                      "\n\nDo check the page regularly to stay updated with the event and related posts.",
              "rules": [
                "The contestants need to send their photos along with their full name & college name to mrandmisstechnovation2020@gmail.com",
                "Photo size should be less than 10 MB and it must not have any filter effects or edits.",
                "Selfies are not allowed in the competition.",
                "Use of auto liker and auto commenter is  not allowed. Participants using such means will be disqualified.",
                "Photo should be decent where the participant should be properly dressed.",
                "Only a single picture without any collage shall be taken into consideration.",
                "If any of the above rules is not followed by any of the contestants they will be disqualified.",
              ],
              "coordinators": ["Abhijit Panda", "Moumita Panda"],
              "coordinatorsNumber": ["8114957735", "8917242677"],
              "judgement": []
            }),
            EventModel.fromJson({
              "id": 104,
              "image": "104.jpg",
              "name": "DJ Night",
              "description":
                  "Come and Enjoy! We have a Special guest waiting to rock you to the core!!",
              "rules": [],
              "coordinators": ["Prasant Kumar Dey", "Monalisha Sahoo"],
              "coordinatorsNumber": ["9078824629", "7788818623"],
              "judgement": []
            }),
            EventModel.fromJson({
              "id": 105,
              "image": "105.jpg",
              "name": "Nukkad Nattak",
              "description":
                  "What is life without art and art without a tinge of drama?\n\nPresenting you Nukkad Natak. For those fond of good cinema and quality drama ,the stage is all set for you to adhere. Be a part of this Natak journey and unravel the whole new experience of artistic talent.",
              "rules": [
                "A team should have a minimum of 8 and a maximum of 20 people (exclusive of all helpers).",
                "There will be only one round.",
                "The maximum duration for the play is 15 minutes.",
                "Teams exceeding time limit will be penalised and those crossing 5 minutes extra time will be disqualified.",
                "No electronic music instruments will be allowed.",
                "No sound system or mikes will be allowed.",
                "Plays with social relevance are expected.",
                "Use of fire (even diyas, candles or lighters) and water is not allowed.",
                "Teams have to bring their own props and costumes.",
              ],
              "coordinators": ["Prasant Kumar Dey", "Monalisha Sahoo"],
              "coordinatorsNumber": ["9078824629", "7788818623"],
              "judgement": []
            }),
            EventModel.fromJson({
              "id": 106,
              "image": "106.jpg",
              "name": "Clash of Titans",
              "description":
                  "“The job of feets is walking, but their hobby is dancing.”\n\nA signature event of Technovat ion, “Clash of Titans” is a group dance competit ion, featuring the most talented crews across the nation. Your team, your beats, your grooves, our arena. Are you up for the challenge?",
              "rules": [
                "Each team consist of a minimum of 8 and a maximum of 20 members.",
                "Music of the final round must be submitted well in advance to the co-ordinators.",
                "On-stage at a time : 15 members.",
                "Any pre-recorded or live music can be used for the performance.",
                "The performance should not exceed 8 minutes.",
                "Any kind of props are allowed .",
                "Usage of fire/water/smoke in any form is not allowed.",
                "Any kind of misbehaviour would resul t in direct disqualification.",
                "The decision taken by the organisers is final and binding for the performers.",
              ],
              "coordinators": ["Srutismita Naik", "Ansuman Samal", "Alina Rout"],
              "coordinatorsNumber": ["9438668886", "9439922731", "9658946248"],
              "judgement": []
            }),
            EventModel.fromJson({
              "id": 107,
              "image": "107.jpg",
              "name": "Fire and Ice",
              "description":
                  "We dance for laughter, we dance for tears, we dance for madness, we dance for fears, we dance for hopes, we dance for screams, we are the dancers, we create the dreams. Technovat ion gives you the chance to create these dreams with your partner. Are you the best duo you think, then just prove it.!",
              "rules": [
                "Any pre-recorded or live music can be used for the performance.",
                "Music for the performance must be submitted in advance.",
                "Props can be used.",
                "Team members can be boys, girls, or mix.",
                "Any kind of misbehaviour will lead to direct disqualification.",
                "The time limi t for each performance shouldnot exceed 4 minutes.",
                "The decision taken by the organisers is final and binding for the performers.",
              ],
              "coordinators": ["Prasant Kumar Dey", "Monalisha Sahoo", "Bibekananda Pradhan", "Shurtika"],
              "coordinatorsNumber": ["9078824629", "9348328210", "9658990582", "9556119141"],
              "judgement": []
            }),
            EventModel.fromJson({
              "id": 108,
              "image": "108.jpg",
              "name": "Flashmob",
              "description":
                  "They gathered, they danced and they left. Gathering people together is an art and the one who holds someone’s at tention is the art ist. So let’s assemble to entertain and sat irize the crowd .Come and let your body move in every beat of the music.",
              "rules": [],
              "coordinators": ["Prasant Kumar Dey", "Monalisha Sahoo"],
              "coordinatorsNumber": ["9078824629", "7788818623"],
              "judgement": []
            }),
          ],
          [
            EventModel.fromJson({
              "id": 200,
              "image": "200.jpg",
              "name": "E-Auction",
              "description":
                  "An event that can make you the don of the hat of a bidder.\n\nYou need to manage your budget and you can strategize to complete the maximum number of sets, competing against other opponents who will give you a run for your money, quite literally.\n\nIf you can mix common sense with passion into your bidding strategy,this event is a must for you.",
              "rules": [
                "Each team will be given a fixed budget which will be used for the auction.",
                "The teams can trade among themselves",
                "The aim is to build the maximum number of required sets",
                "Number of players per team: 3-4"
              ],
              "coordinators": ["Abinash Sahoo", "Sonali Rashmirekha", "Neelesh Mohanty"],
              "coordinatorsNumber": ["7609929488", "7978520885", "9438120178"],
              "judgement": [
                "The team with highest number of sets cumulated with remaining budget will win"
              ]
            }),
            EventModel.fromJson({
              "id": 201,
              "image": "201.jpg",
              "name": "Gully Cricket",
              "description":
                  "Who doesn't love gully cricket? School and college life is virtually incomplete without a cricket match in the streets.\n\nWith strange rules and regulations, gully cricket is excellent entertainment and an integral part of every Indian's childhood.\n\nTake a break from the craze of online games and come to feel the emotions of gully cricket.\n\nENTRY FEES: RS. 50/- PER TEAM",
              "rules": [
                "Matches will be played in league style",
                "All the matches will be knock out",
                "Number of players per team: 5"
              ],
              "coordinators": ["Jyotishman Maharana", "Neha Rai", "Sworaj"],
              "coordinatorsNumber": ["9124026162", "8917364985", "7683847373"],
              "judgement": [
                "The team that wins the final is declared the winner "
              ]
            }),
            EventModel.fromJson({
              "id": 202,
              "image": "202.jpg",
              "name": "Minute to Win it",
              "description":
                  "You got 60 seconds to prove your worth and beat your opponent in a series of challenges.\n\nThe challenges will be quite innovative and truly take you on a funny enjoyable ride.",
              "rules": ["Number of players per team: 1"],
              "coordinators": ["Nachiketa Dhal", "Smruti Swagatika Muduli", "Trupti Prava Patra", "Supratika Bhuyan"],
              "coordinatorsNumber": ["8328992036", "9556027382", "8763113661", "8249046351"],
              "judgement": []
            }),
            EventModel.fromJson({
              "id": 203,
              "image": "203.jpg",
              "name": "Follow my steps",
              "description":
                  "\"Follow my steps, only then you can judge me.\"Ohh! sorry, but we kinda modified it...you follow our steps, and then we will judge you.\n\n Small steps in the right direction will take you to the destination.",
              "rules": ["Number of player per team: 1"],
              "coordinators": ["Nachiketa Dhal", "Smruti Swagatika Muduli", "Rajib Kumar Behera"],
              "coordinatorsNumber": ["8328992036", "9556027382", "8917679815"],
              "judgement": [
                "One who successfully completes the track in right order will win."
              ]
            }),
            EventModel.fromJson({
              "id": 204,
              "image": "204.jpg",
              "name": "E-roadies",
              "description":
                  "The day you start saying that I am a struggler you start losing out. Don't struggle love what you do. You are your own superhero...make adventure your damsel in distress.\n\nInspired from the youth-based reality show MTV Roadies, we bring you E-roadies.\n\nParticipants selected via auditions, compete against each other in various tasks that challenge their physical and mental strength, and go on to win the title.",
              "rules": ["Number of players per team: 1"],
              "coordinators": ["Amit Tripathi", "Shreeya Sethi"],
              "coordinatorsNumber": ["7381159118", "7655831682"],
              "judgement": [
                "On the basis of performances of the participants in various tasks"
              ]
            }),
            EventModel.fromJson({
              "id": 205,
              "image": "205.jpg",
              "name": "Task Scavenger",
              "description":
              "Do you think you are crazy and daring enough? Then this is your call.\n\nA game in which a team has to complete a series of tasks within 2 days of fest and the one team which will report us,will win.\n\n",
              "rules": [
                "Participants have to take photo or video as proof to show while reporting",
                "Number of players per team: 5"
              ],
              "coordinators": ["Debasmita Debadarshani", "Gyana Ranjan Behera"],
              "coordinatorsNumber": ["8280078980", "6360154302"],
              "judgement": [
                "The first team to report with all the tasks done will win."
              ]
            }),

            EventModel.fromJson({
              "id": 206,
              "image": "206.jpg",
              "name": "E-Gaming",
              "description":
                  "Unleash your gaming capabilities to a whole new level. Compete against the best out there.\n\nGames: \n\nPUBG\nFIFA\nMobile Legends\nCall of Duty Mobile\nNFS\nTekken\nCS Go",
              "rules": [],
              "coordinators": ["Satya Narayan Patra", "Aditya Ranjan Mohanty"],
              "coordinatorsNumber": ["9556989814", "7504948433"],
              "judgement": ["There will be only one winner team per game"]
            }),

          ],
        ];

        if (res.statusCode == 200) {
          eventProvider.eventDynamic = json.decode(res.body)['events'];
          erb.yes();
        } else {
          eventProvider = null;
          throw Exception("Failed to load data");
        }
      } catch (e) {
        print(e);
        eventProvider = null;
        throw Exception('$e');
      }
    }
    return eventProvider;
  }

  List<List<EventModel>> getEventsByType(EventProviderType type) {
    List<List<EventModel>> res = [[], [], []];
    if (type == EventProviderType.CATEGORY) {
      eventDynamic.forEach((event) {
        int id = event['event_id'];
        int i = id ~/ 100;
        int j = id % 100;
        try {
          EventModel e = eventDetails[i][j];
          e.location = event['location'];
          int time = int.parse(event['time']);
          e.time = time;
          int p = -1;
          if (time >= 1584037800000 && time <= 1584124199000)
            p = 0;
          else if (time >= 1584124200000 && time <= 1584210599000)
            p = 1;
          else if (time >= 1584210600000 && time <= 1584296999000) p = 2;
          e.day = p + 1;
          res[i].add(e);
        } catch (e) {}
      });
    } else if (type == EventProviderType.DAY) {
      eventDynamic.forEach((event) {
        int id = event['event_id'];
        int i = id ~/ 100;
        int j = id % 100;
        int time = int.parse(event['time']);
        int p = -1;
        if (time >= 1584037800000 && time <= 1584124199000)
          p = 0;
        else if (time >= 1584124200000 && time <= 1584210599000)
          p = 1;
        else if (time >= 1584210600000 && time <= 1584296999000) p = 2;
        try {
          if (p != -1) {
            EventModel e = eventDetails[i][j];
            e.location = event['location'];
            e.time = time;
            e.day = p + 1;
            res[p].add(e);
          }
        } catch (e) {}
      });
    }
    return res;
  }

  void close() {
    eventProvider = null;
  }
}
