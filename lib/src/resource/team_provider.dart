import 'package:technovation2020/src/model/team_model.dart';

enum TeamType { BTECH, MCA }

class TeamProvider {
  List<TeamModel> _btech, _mca;

  TeamProvider() {
    _btech = [
      TeamModel(
        name: 'Sankalp Rath',
        post: 'Chief Coordinator',
      ),
      TeamModel(
        name: 'Aradhana Behera',
        post: 'Deputy Chief Coordinator',
      ),
      TeamModel(
        name: 'Azazul Haque',
        post: 'Chief Event',
      ),
      TeamModel(
        name: 'Neha Rai',
        post: 'Chief Event',
        image: 'event2.jpg'
      ),
      TeamModel(
        name: 'Abinash Sahoo',
        post: 'Treasurer',
      ),
      TeamModel(
        name: 'Andhavarapu Supriya',
        post: 'Treasurer',
      ),
      TeamModel(
        name: 'Soumya Ranjan Naik',
        post: 'Chief Admin',
      ),
      TeamModel(
        name: 'Srutismita Naik',
        post: 'Chief Admin',
        image: 'admin2.jpg'
      ),
      TeamModel(
        name: 'Ashutosh Das Adhikari',
        post: 'Public Relation',
      ),
      TeamModel(
        name: 'Gayatri Jena',
        post: 'Public Relation',
      ),
      TeamModel(
        name: 'Md.Azharuddin',
        post: 'Technical Event',
      ),
      TeamModel(
        name: 'Sonali Mishra',
        post: 'Technical Event',
      ),
      TeamModel(
        name: 'Prasant Kumar Dey',
        post: 'Cultural Event',
      ),TeamModel(
        name: 'Monalisha Sahoo',
        post: 'Cultural Event',
      ),
      TeamModel(
        name: 'Nachiketa Dhal',
        post: 'Fun Event',
      ),
      TeamModel(
        name: 'Smruti Swagatika Muduli',
        post: 'Fun Event',
        image: 'fun2.jpg'
      ),
      TeamModel(
        name: 'Shiba Prasad Mallick',
        post: 'Sponshorship',
      ),
      TeamModel(
        name: 'Jhalsa Mishra',
        post: 'Sponshorship',
      ),
      TeamModel(
        name: 'Sekhar Das',
        post: 'Design',
      ),
      TeamModel(
        name: 'Monalisa Giri',
        post: 'Design',
      ),
      TeamModel(
        name: 'Maitri Ranjan Behera',
        post: 'Logistics',
      ),
      TeamModel(
        name: 'Shreeya Sethi',
        post: 'Logistics',
      ),
      TeamModel(
        name: 'Yashobanta Kumar Behera',
        post: 'Website',
      ),
      TeamModel(
        name: 'Supriya Panda',
        post: 'Website',
      ),
      TeamModel(
        name: 'Saswat Ranjan Hota',
        post: 'Media & Publicity',
      ),
      TeamModel(
        name: 'Debasmita Debadarshani',
        post: 'Media & Publicity',
      ),
      TeamModel(
        name: 'Abhinab Kumar Nayak',
        post: 'Decoration',
      ),
      TeamModel(
        name: 'Moumita Panda',
        post: 'Decoration',
      ),
      TeamModel(
        name: 'Debasish Moharana',
        post: 'Arena',
      ),
      TeamModel(
        name: 'Sonali Rashmirekha',
        post: 'Arena',
        image: 'arena2.jpg'
      ),
      TeamModel(
        name: 'Amit Tripathi',
        post: 'Hospitality',
      ),
      TeamModel(
        name: 'Ashmita Dora',
        post: 'Hospitality',
      ),
      TeamModel(
        name: 'Sibaram Sahoo',
        post: 'Workforce',
      ),
      TeamModel(
        name: 'Rozaleen Satpathy',
        post: 'Workforce',
      ),
    ];

    // ---------------------------MCA-----------------------------

    _mca = [
      TeamModel(
        name: 'Sitakanta Bej',
        post: 'Deputy Chief Coordinator',
      ),
      TeamModel(
        name: 'Swaraji Patnaik',
        post: 'Deputy Chief Coordinator',
      ),
      TeamModel(
        name: 'Amit Kumar Maharana',
        post: 'Chief Event',
      ),
      TeamModel(
        name: 'Ronimama Baghar',
        post: 'Chief Event',
      ),
      TeamModel(
        name: 'Pradosh Kumar Lenka',
        post: 'Treasurer',
      ),
      TeamModel(
        name: 'Anuranjita Kund',
        post: 'Treasurer',
      ),
      TeamModel(
        name: 'Utkal Rout',
        post: 'Chief Admin',
      ),
      TeamModel(
        name: 'Amisa Samal',
        post: 'Chief Admin',
      ),
      TeamModel(
        name: 'Satya Sarathi Barik',
        post: 'Public Relation',
      ),
      TeamModel(
        name: 'Simarani Rout',
        post: 'Public Relation',
      ),
      TeamModel(
        name: 'Pankaj Kumar Mohanta',
        post: 'Technical Event',
      ),
      TeamModel(
        name: 'Alina Rout',
        post: 'Technical Event',
      ),
      TeamModel(
        name: 'Satyaprakash Rout',
        post: 'Cultural Event',
      ),TeamModel(
        name: 'Swatika Nayak',
        post: 'Cultural Event',
      ),
      TeamModel(
        name: 'Nirmalya Behura',
        post: 'Fun Event',
      ),
      TeamModel(
        name: 'Supratika Bhuyan',
        post: 'Fun Event',
      ),
      TeamModel(
        name: 'Neelesh Mohanty',
        post: 'Sponshorship',
      ),
      TeamModel(
        name: 'Kareesma Pradhan',
        post: 'Sponshorship',
      ),
      TeamModel(
        name: 'Srinivash Prayag Sahu',
        post: 'Design',
      ),
      TeamModel(
        name: 'Poonam Das',
        post: 'Design',
      ),
      TeamModel(
        name: 'Amulyaraj Sahoo',
        post: 'Logistics',
      ),
      TeamModel(
        name: 'Prangya Paramita Madali',
        post: 'Logistics',
      ),
      TeamModel(
        name: 'Dibakar Nayak',
        post: 'Website',
      ),
      TeamModel(
        name: 'Jogamaya Mishra',
        post: 'Website',
      ),
      TeamModel(
        name: 'Kaushik Kumar Behera',
        post: 'Media & Publicity',
      ),
      TeamModel(
        name: 'Sushree Nibedita Pradhan',
        post: 'Media & Publicity',
      ),
      TeamModel(
        name: 'Nirmalya Samant',
        post: 'Decoration',
      ),
      TeamModel(
        name: 'Pujarani Rout',
        post: 'Decoration',
      ),
      TeamModel(
        name: 'Bibekananda Pradhan',
        post: 'Arena',
      ),
      TeamModel(
        name: 'Suryakanti Padhi',
        post: 'Arena',
      ),
      TeamModel(
        name: 'Rajib Kumar Behera',
        post: 'Hospitality',
      ),
      TeamModel(
        name: 'Rashmi Rekha Das',
        post: 'Hospitality',
      ),
      TeamModel(
        name: 'Gyana Ranjan Behera',
        post: 'Workforce',
      ),
      TeamModel(
        name: 'Trupti Prava Patra',
        post: 'Workforce',
      ),
    ];
  }

  getTeamDetails(TeamType tt) {
    if (tt == TeamType.BTECH)
      return _btech;
    else
      return _mca;
  }
}
