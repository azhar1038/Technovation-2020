import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:technovation2020/src/model/event_model.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:technovation2020/src/resource/firebase_helper.dart';

enum EventProviderType { CATEGORY, DAY }

EventProvider eventProvider;

class EventProvider {
  List<dynamic> eventDynamic;
  List<List<EventModel>> eventDetails;

  static Future<EventProvider> create() async {
    if (eventProvider == null) {
      eventProvider = EventProvider();
      eventProvider.eventDetails = [
        [
          EventModel.fromJson({
            "id": 0,
            "image": "000.jpg",
            "name": "Internet Mystery",
            "description":
                "This is an event to test the deciphering abilities of participants. Participants will need to solve some mind-boggling puzzles to get to the treasure. This event will be conducted in two phases.\n\nPhase1: It will be a pre-event. Participants will need to solve all the puzzles to know when and where phase 2 will be conducted.\n\nPhase 2: The final puzzle which will be provided on the spot.",
            "rules": ["Number of participants-1", "Full use of internet is allowed"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["The very first person to solve the puzzle will win the prize."],
          }),
          EventModel.fromJson({
            "id": 1,
            "image": "001.jpg",
            "name": "Suspense Coding",
            "description":
                "This is an event to test the algorithmic understanding of participants. Participants will need to write simple programs like addition of numbers, finding factorial etc. with an unknown language. They will have full access to the documentation of the language.",
            "rules": ["Participants per group- maximum 2", "Full access to internet.", "Time: 1 hr."],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": [
              "This is how you will get points",
              "This is how you will loose points"
            ]
          }),
          EventModel.fromJson({
            "id": 2,
            "image": "002.jpg",
            "name": "Tech Fresh",
            "description":
                "If you are looking for a lively event humming with the energy of sparked-up brains working together, your destination is here!\n\nRound 1: An aptitude test to examine the basic understanding of problems.\n\nRound 2: You will be given puzzles which you are expected to decode with given constraints. Each puzzle solved will put you ahead in the race.\nFeeling the heat, right!!",
            "rules": ["Students can register in team of 3"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": []
          }),
          EventModel.fromJson({
            "id": 3,
            "image": "003.jpg",
            "name": "Debugger",
            "description":
                "This is an event to test the error correcting capabilities of the participants. The participants will be given several pieces of code each containing some errors which they need to correct.",
            "rules": ["At max 2 participants per group", "Use of internet is prohibited", "Time: 1 hr"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["One who scores highest points will win."]
          }),
          EventModel.fromJson({
            "id": 4,
            "image": "004.jpg",
            "name": "Blind Coding",
            "description":
                "Ever wondered what is to type code without seeing what you are writing. This event will let you experience this.\n\nParticipants will be given a question for which they need to write a program in paper. After they are done, they will need to type their program into their computer with their monitor turned off.",
            "rules": ["One person per team", "Time: 1hr"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["Points will be rewarded based on how less mistakes one makes during typing."]
          }),
          EventModel.fromJson({
            "id": 5,
            "image": "005.jpg",
            "name": "Paper Presentation",
            "description":
                "Wanna know how good you are in presenting your ideas, view and information. Then this event is for you. You can present any technical subject of your interest.",
            "rules": ["At max 3 participants per group", "Time: 15 minutes per group", "Must have a ppt"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["Group with best presentation will win"]
          }),
          EventModel.fromJson({
            "id": 6,
            "image": "006.jpg",
            "name": "Mock Interview",
            "description":
                "So, you have never faced any interview before! Wanna know how it feels to sit for an interview? . Then what are you for! Come and test how good you are when it comes to interview.",
            "rules": ["1 participant per team", "Time: Will depend on interviewer"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["Based on performance"]
          }),
          EventModel.fromJson({
            "id": 7,
            "image": "007.jpg",
            "name": "Techno Cupid",
            "description":
                "The most awaited couple event from last year is back!. In this a male and a female coder needs to work with each other to defeat other couples. It consists of two rounds each related to programming and partnership.\n\nRound 1: In this round couples will be given a piece if code which they have to type and run within specified time. The code may have errors which they need to correct. Top 10 pairs with fastest performance will be selected for next round.\n\nRound 2: This round is based on mutual understanding and how much do they know about each other.",
            "rules": ["1 male and 1 female per group", "Time: 1 hr per round", "Use of interner is prohibited"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 8,
            "image": "008.jpg",
            "name": "Chanakya Neeti",
            "description":
                "We have all seen an episode of CSI or Law and Order, read a John Grisham book, or listen to a true crime podcast, and thought, \"Yeah, I could do that, I could solve those cases too.\"\n\nIf you want to take your passion of mystery beyond reading books, we have a good news! Use your detective instinct and common sense to solve the 10 real life problems within a given time frame.\n\nCome Decrypt, Defuse, Decode and survive.",
            "rules": ["At max 3 students per group."],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["One who solves all the puzzles first, will win"]
          }),
        ],
        [
          EventModel.fromJson({
            "id": 100,
            "image": "100.jpg",
            "name": "Encantador",
            "description": "\"Being well dressed hasn’t much to do with having good clothes. It’s a question of good balance and good common sense. So in order to be irreplaceable one must always be different.\"\n\nSo wake up beauties its time to beast for we are back with the 4th edition of Encantador, the fashion show.\n\nBe the designer of your own and let the fire inside you burn brighter than the fire around u.",
            "rules": ["Each team will consist of 3-7 members", "Every team will have to base their performance on a specific theme", "Every team will be given a time limit of maximum 3 minutes.", "Every team will have to bring its own music track for the walk.", "Every team will be required to face interaction via questions from the audience after the walk."],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["On the basis of Creativity", "On the basis of Costume design", "On the basis of Relevance to the theme", "On the basis of Originality of concept", "On the basis of Interaction with the audience"]
          }),
          EventModel.fromJson({
            "id": 101,
            "image": "101.jpg",
            "name": "Star Night",
            "description":
                "Come and Enjoy! We have a Special guest waiting to make your night a lifetime experience.",
            "rules": [],
            "coordinators": [
              "Monkey D. Luffy",
              "Roronoa Zoro",
              "Sanji Vinsmoke"
            ],
            "coordinatorsNumber": ["9747897864", "6392785637", "8976545678"],
            "judgement": []
          }),
          EventModel.fromJson({
            "id": 102,
            "image": "102.jpg",
            "name": "Spectacolo-di-Talenti",
            "description":
                "\"The entire world ‘s a stage\", they say. For the people who believe this , for the people with passion ans obsession, we have the right stage for you!. Be it comedy, mimicry, acting, magic, dance or any quirky thing you are passionately curious about, we have the stage ready for you!. Give the crowd and the judges the trime of their lives. ",
            "rules": ["Dance: It may be solo or duet or group performance having maximum 8 members.(Duration: 3-4 min)", "Song: Songs of any language may be sung. (Duration: 2-3 min)", "Instrumental:- All types of instruments are allowed.(Duration: 2-3 min)", "Act:- Mono act or skit can be performed. (Duration: 3-5 min)", "Band Performance"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": []
          }),
          EventModel.fromJson({
            "id": 103,
            "image": "103.jpg",
            "name": "Mr. & Mrs. Technovation",
            "description":
                "“Success is a series of small wins”.\n\nThe most awaited, charismatic, Mr. and Mrs. Technovation is back with a bang. An online event where you will be asked to send a picture of yours And the participant with the highest number of likes will qualify to the next round followed by some other interesting rounds.\n\nThe difference between ordinary and extraordinary is that little “extra”. Go that extra mile, Make it happen . Cause no one is you and that is your superpower.",
            "rules": ["The picture should not have any effect and it should be less than 10mb", "Top participants from boys and from girls will be selected on the basis of the number of likes they get.", "The further rounds will be with many twists and turns.", "Use of auto likers is not allowed and may lead to disqualification"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["Winner of the event will be decided based on the further rounds", "Winners of the first round will be announced on the page"]
          }),
          EventModel.fromJson({
            "id": 104,
            "image": "104.jpg",
            "name": "DJ Night",
            "description":
                "Come and Enjoy! We have a Special guest waiting to rock you to the core!!",
            "rules": [],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": []
          }),
          EventModel.fromJson({
            "id": 105,
            "image": "105.jpg",
            "name": "Nukkad Nattak",
            "description":
                "What is life without art and art without a tinge of drama?\n\nPresenting you Nukkad Natak. For those fond of good cinema and quality drama ,the stage is all set for you to adhere. Be a part of this Natak journey and unravel the whole new experience of artistic talent.",
            "rules": [],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": []
          }),
          EventModel.fromJson({
            "id": 106,
            "image": "106.jpg",
            "name": "Clash of Titans",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": ["How to play rule 1", "How to play rule 2"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 107,
            "image": "107.jpg",
            "name": "Fire and Ice",
            "description":
                "\"Dancing with the feet is one thing, but dancing with the Heart is another.\"\n\nAnd dancing with your favourite partner is a whole another feeling!!\n\nThis is a duet dance competition with a little \"Tadka\" added to it.\n\nCome, show your innovative moves, for the stage is yours. Sweat it out to make your Icy Fire Jodi win the hearts of the judges and the audience.",
            "rules": [],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": []
          }),
          EventModel.fromJson({
            "id": 108,
            "image": "108.jpg",
            "name": "Flashmob",
            "description":
                "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
            "rules": ["How to play rule 1", "How to play rule 2"],
            "coordinators": ["Monkey D. Luffy", "Roronoa Zoro"],
            "coordinatorsNumber": ["9747897864", "6392785637"],
            "judgement": ["This is how you will get points"]
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
            "coordinators": ["Monkey D. Luffy"],
            "coordinatorsNumber": ["9747897864"],
            "judgement": ["The team with highest number of sets cumulated with remaining budget will win"]
          }),
          EventModel.fromJson({
            "id": 201,
            "image": "201.jpg",
            "name": "Gully Cricket",
            "description":
                "Who doesn't love gully cricket? School and college life is virtually incomplete without a cricket match in the streets.\n\nWith strange rules and regulations, gully cricket is excellent entertainment and an integral part of every Indian's childhood.\n\nTake a break from the craze of online games and come to feel the emotions of gully cricket.",
            "rules": [
              "Matches will be played in league style", "All the matches will be knock out", "Number of players per team: 5"
            ],
            "coordinators": ["Monkey D. Luffy"],
            "coordinatorsNumber": ["9747897864"],
            "judgement": ["The team that wins the final is declared the winner "]
          }),
          EventModel.fromJson({
            "id": 202,
            "image": "202.jpg",
            "name": "Minute to Win it",
            "description":
                "You got 60 seconds to prove your worth and beat your opponent in a series of challenges.\n\nThe challenges will be quite innovative and truly take you on a funny enjoyable ride.",
            "rules": [
              "Number of players per team: 1"
            ],
            "coordinators": ["Monkey D. Luffy"],
            "coordinatorsNumber": ["9747897864"],
            "judgement": []
          }),
          EventModel.fromJson({
            "id": 203,
            "image": "203.jpg",
            "name": "Follow my steps",
            "description":
                "\"Follow my steps, only then you can judge me.\"Ohh! sorry, but we kinda modified it...you follow our steps, and then we will judge you.\n\n Small steps in the right direction will take you to the destination.",
            "rules": [
              "Number of player per team: 1"
            ],
            "coordinators": ["Monkey D. Luffy"],
            "coordinatorsNumber": ["9747897864"],
            "judgement": ["One who successfully completes the track in right order will win."]
          }),
          EventModel.fromJson({
            "id": 204,
            "image": "204.jpg",
            "name": "E-roadies",
            "description":
                "The day you start saying that I am a struggler you start losing out. Don't struggle love what you do. You are your own superhero...make adventure your damsel in distress.\n\nInspired from the youth-based reality show MTV Roadies, we bring you E-roadies.\n\nParticipants selected via auditions, compete against each other in various tasks that challenge their physical and mental strength, and go on to win the title.",
            "rules": [
              "Number of players per team: 1"
            ],
            "coordinators": ["Monkey D. Luffy"],
            "coordinatorsNumber": ["9747897864"],
            "judgement": ["On the basis of performances of the participants in various tasks"]
          }),
          EventModel.fromJson({
            "id": 205,
            "image": "205.jpg",
            "name": "Lazer Maze",
            "description":
                "It is a real life heist style game where you dodge lasers and finish the track levels as quickly as possible without setting off the alarm.\n\nYou have to use your body balance and flexibility to reach the end of the room without touching the lasers.",
            "rules": [
              "How to play rule 1",
              "How to play rule 2",
              "How to play rule 3"
            ],
            "coordinators": ["Monkey D. Luffy"],
            "coordinatorsNumber": ["9747897864"],
            "judgement": ["This is how you will get points"]
          }),
          EventModel.fromJson({
            "id": 206,
            "image": "206.jpg",
            "name": "E-Gaming",
            "description":
                "Unleash your gaming capabilities to a whole new level. Compete against the best out there. Games: \n\nPUBG\n\nFIFA\n\nMobile Legends\n\n Call of Duty\n\nNFS\n\nTekken\n\nCS Go",
            "rules": [],
            "coordinators": ["Monkey D. Luffy"],
            "coordinatorsNumber": ["9747897864"],
            "judgement": ["There will be only one winner team per game"]
          }),
          EventModel.fromJson({
            "id": 207,
            "image": "207.jpg",
            "name": "Task Scavenger",
            "description":
                "Do you think you are crazy and daring enough? Then this is your call.\n\nA game in which a team has to complete a series of tasks within 2 days of fest and the one team which will report us,will win.\n\n",
            "rules": [
              "Participants have to take photo or video as proof to show while reporting", "Number of players per team: 5"
            ],
            "coordinators": ["Monkey D. Luffy"],
            "coordinatorsNumber": ["9747897864"],
            "judgement": ["The first team to report with all the tasks done will win."]
          }),
        ],
      ];

      try {
        http.Response res = await http
            .get('https://omega.pythonanywhere.com/android_api/get_events/');
        if (res.statusCode == 200)
          eventProvider.eventDynamic = json.decode(res.body)['events'];
        else
          throw Exception("Failed to load data");
      } catch (e) {
        print(e);
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
        EventModel e = eventDetails[i][j];
        e.location = event['location'];
        int time = int.parse(event['time']);
        e.time = time;
        int p = -1;
        if (time >= 1584037800000 && time <= 1584124199000)
          p = 0;
        else if (time >= 1584124200000 && time <= 1584210599000)
          p = 1;
        else if (time >= 1584210600000 && time <= 1584210600000) p = 2;
        e.day = p + 1;
        res[i].add(e);
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
        else if (time >= 1584210600000 && time <= 1584210600000) p = 2;
        if (p != -1) {
          EventModel e = eventDetails[i][j];
          e.location = event['location'];
          e.time = time;
          e.day = p + 1;
          res[p].add(e);
        }
      });
    }
    return res;
  }

  void close() {
    eventProvider = null;
  }
}
