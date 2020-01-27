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
        post: 'Sponsorship',
      ),
      TeamModel(
        name: 'Jhalsa Mishra',
        post: 'Sponsorship',
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
        image: 'chief3.jpg',
      ),
      TeamModel(
        name: 'Swaraji Patnaik',
        post: 'Deputy Chief Coordinator',
        image: 'chief4.jpg',
      ),
      TeamModel(
        name: 'Amit Kumar Maharana',
        post: 'Chief Event',
        image: 'event3.jpg',
      ),
      TeamModel(
        name: 'Ronimama Baghar',
        post: 'Chief Event',
        image: 'event4.jpg',
      ),
      TeamModel(
        name: 'Pradosh Kumar Lenka',
        post: 'Treasurer',
        image: 'treasurer3.jpg',
      ),
      TeamModel(
        name: 'Anuranjita Kund',
        post: 'Treasurer',
        image: 'treasurer4.jpg',
      ),
      TeamModel(
        name: 'Utkal Rout',
        post: 'Chief Admin',
        image: 'admin3.jpg',
      ),
      TeamModel(
        name: 'Amisa Samal',
        post: 'Chief Admin',
        image: 'admin4.jpg',
      ),
      TeamModel(
        name: 'Satya Sarathi Barik',
        post: 'Public Relation',
        image: 'public3.jpg',
      ),
      TeamModel(
        name: 'Simarani Rout',
        post: 'Public Relation',
        image: 'public4.jpg',
      ),
      TeamModel(
        name: 'Pankaj Kumar Mohanta',
        post: 'Technical Event',
        image: 'technical3.jpg',
      ),
      TeamModel(
        name: 'Alina Rout',
        post: 'Technical Event',
        image: 'technical4.jpg',
      ),
      TeamModel(
        name: 'Satyaprakash Rout',
        post: 'Cultural Event',
        image: 'cultural3.jpg',
      ),
      TeamModel(
        name: 'Swatika Nayak',
        post: 'Cultural Event',
        image: 'cultural4.jpg',
      ),
      TeamModel(
        name: 'Nirmalya Behura',
        post: 'Fun Event',
        image: 'fun3.jpg',
      ),
      TeamModel(
        name: 'Supratika Bhuyan',
        post: 'Fun Event',
        image: 'fun4.jpg',
      ),
      TeamModel(
        name: 'Neelesh Mohanty',
        post: 'Sponsorship',
        image: 'sponsorship3.jpg',
      ),
      TeamModel(
        name: 'Sumitra Singh',
        post: 'Sponsorship',
        image: 'sponsorship4.jpg',
      ),
      TeamModel(
        name: 'Srinivash Prayag Sahu',
        post: 'Design',
        image: 'design3.jpg',
      ),
      TeamModel(
        name: 'Poonam Das',
        post: 'Design',
        image: 'design4.jpg',
      ),
      TeamModel(
        name: 'Amulyaraj Sahoo',
        post: 'Logistics',
        image: 'logistics3.jpg',
      ),
      TeamModel(
        name: 'Prangya Paramita Madali',
        post: 'Logistics',
        image: 'logistics4.jpg',
      ),
      TeamModel(
        name: 'Dibakar Nayak',
        post: 'Website',
        image: 'website3.jpg',
      ),
      TeamModel(
        name: 'Jogamaya Mishra',
        post: 'Website',
        image: 'website4.jpg',
      ),
      TeamModel(
        name: 'Kaushik Kumar Behera',
        post: 'Media & Publicity',
        image: 'media3.jpg',
      ),
      TeamModel(
        name: 'Sushree Nibedita Pradhan',
        post: 'Media & Publicity',
        image: 'media4.jpg',
      ),
      TeamModel(
        name: 'Nirmalya Samant',
        post: 'Decoration',
        image: 'decoration3.jpg',
      ),
      TeamModel(
        name: 'Pujarani Rout',
        post: 'Decoration',
        image: 'decoration4.jpg',
      ),
      TeamModel(
        name: 'Bibekananda Pradhan',
        post: 'Arena',
        image: 'arena3.jpg',
      ),
      TeamModel(
        name: 'Suryakanti Parhi',
        post: 'Arena',
        image: 'arena4.jpg',
      ),
      TeamModel(
        name: 'Rajib Kumar Behera',
        post: 'Hospitality',
        image: 'hospitality3.jpg',
      ),
      TeamModel(
        name: 'Rashmi Rekha Das',
        post: 'Hospitality',
        image: 'hospitality4.jpg',
      ),
      TeamModel(
        name: 'Gyana Ranjan Behera',
        post: 'Workforce',
        image: 'workforce3.jpg'
      ),
      TeamModel(
        name: 'Trupti Prava Patra',
        post: 'Workforce',
        image: 'workforce4.jpg'
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
