
import 'package:flutter/material.dart';

void main() {
  runApp(const HealthAppointmentApp());
}

// -------------------- DATA MODELS --------------------

class Doctor {
  final String name;
  final String specialization;
  final String experience;
  final String fee;
  final String image;
  final String about;

  const Doctor({
    required this.name,
    required this.specialization,
    required this.experience,
    required this.fee,
    required this.image,
    required this.about,
  });
}

class Appointment {
  final String doctorName;
  final String specialization;
  final String date;
  final String time;

  Appointment({
    required this.doctorName,
    required this.specialization,
    required this.date,
    required this.time,
  });
}

// -------------------- APP DATA --------------------

final List<Doctor> allDoctors = [
  Doctor(
    name: 'Dr. Ananya Sharma',
    specialization: 'Cardiologist',
    experience: '8 years',
    fee: '500',
    image: '❤️',
    about: 'Specialist in heart health and cardiovascular care.',
  ),
  Doctor(
    name: 'Dr. Rahul Verma',
    specialization: 'Dermatologist',
    experience: '6 years',
    fee: '400',
    image: '🩺',
    about: 'Specialist in skin, hair and nail treatments.',
  ),
  Doctor(
    name: 'Dr. Priya Reddy',
    specialization: 'Pediatrician',
    experience: '10 years',
    fee: '450',
    image: '👶',
    about: 'Provides medical care for infants and children.',
  ),
  Doctor(
    name: 'Dr. Arjun Rao',
    specialization: 'Neurologist',
    experience: '12 years',
    fee: '600',
    image: '🧠',
    about: 'Specialist in brain and nervous system disorders.',
  ),
  Doctor(
    name: 'Dr. Sneha Gupta',
    specialization: 'Dentist',
    experience: '5 years',
    fee: '350',
    image: '🦷',
    about: 'Provides dental care and oral health treatments.',
  ),
  Doctor(
    name: 'Dr. Kiran Kumar',
    specialization: 'General Physician',
    experience: '9 years',
    fee: '300',
    image: '👨‍⚕️',
    about: 'Provides general medical consultations and health advice.',
  ),
];

final List<Appointment> bookedAppointments = [];

final Map<String, String> profileDetails = {
  'Name': 'Your Name',
  'Student ID': '24WH1A05Z9',
  'Email': 'yourname@gmail.com',
  'Phone': '9876543210',
  'Age': '20',
};

// -------------------- MAIN APP --------------------

class HealthAppointmentApp extends StatefulWidget {
  const HealthAppointmentApp({super.key});

  @override
  State<HealthAppointmentApp> createState() =>
      _HealthAppointmentAppState();
}

class _HealthAppointmentAppState
    extends State<HealthAppointmentApp> {
  int selectedIndex = 0;

  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  void refreshApp() {
    setState(() {});
  }

  void openDoctor(Doctor doctor) {
    navigatorKey.currentState!.push(
      MaterialPageRoute(
        builder: (_) => DoctorDetailsPage(doctor: doctor),
      ),
    ).then((_) => refreshApp());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Health Appointment App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF5F8FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: [
            HomePage(
              onDoctorSelected: openDoctor,
              onViewDoctors: () {
                setState(() => selectedIndex = 1);
              },
            ),
            DoctorsPage(onDoctorSelected: openDoctor),
            AppointmentsPage(onChanged: refreshApp),
            ProfilePage(onChanged: refreshApp),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() => selectedIndex = index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.medical_services),
              label: 'Doctors',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Appointments',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------- HOME PAGE --------------------

class HomePage extends StatefulWidget {
  final Function(Doctor) onDoctorSelected;
  final VoidCallback onViewDoctors;

  const HomePage({
    super.key,
    required this.onDoctorSelected,
    required this.onViewDoctors,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final filteredDoctors = allDoctors.where((doctor) {
      final query = searchText.toLowerCase();
      return doctor.name.toLowerCase().contains(query) ||
          doctor.specialization.toLowerCase().contains(query);
    }).toList();

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.teal,
                child: Icon(Icons.favorite, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hello,',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      profileDetails['Name'] ?? 'User',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.notifications_none, size: 28),
            ],
          ),
          const SizedBox(height: 25),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Health Matters!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Find the right doctor and book your appointment easily.',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 15),
                Icon(
                  Icons.health_and_safety,
                  color: Colors.white,
                  size: 45,
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'Find a Doctor',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          TextField(
            onChanged: (value) {
              setState(() => searchText = value);
            },
            decoration: InputDecoration(
              hintText: 'Search doctor or specialization',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Available Doctors',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: widget.onViewDoctors,
                child: const Text('See All'),
              ),
            ],
          ),
          if (filteredDoctors.isEmpty)
            const Padding(
              padding: EdgeInsets.all(20),
              child: Center(child: Text('No doctors found.')),
            ),
          ...filteredDoctors.take(4).map(
                (doctor) => DoctorCard(
                  doctor: doctor,
                  onTap: () => widget.onDoctorSelected(doctor),
                ),
              ),
        ],
      ),
    );
  }
}

// -------------------- DOCTORS PAGE --------------------

class DoctorsPage extends StatefulWidget {
  final Function(Doctor) onDoctorSelected;

  const DoctorsPage({
    super.key,
    required this.onDoctorSelected,
  });

  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final doctors = allDoctors.where((doctor) {
      final query = searchText.toLowerCase();
      return doctor.name.toLowerCase().contains(query) ||
          doctor.specialization.toLowerCase().contains(query);
    }).toList();

    return SafeArea(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.teal,
            child: const Text(
              'Our Doctors',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) {
                setState(() => searchText = value);
              },
              decoration: InputDecoration(
                hintText: 'Search doctors...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: doctors.isEmpty
                ? const Center(child: Text('No doctors found.'))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      return DoctorCard(
                        doctor: doctors[index],
                        onTap: () =>
                            widget.onDoctorSelected(doctors[index]),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// -------------------- DOCTOR CARD --------------------

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  final VoidCallback onTap;

  const DoctorCard({
    super.key,
    required this.doctor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 27,
          backgroundColor: Colors.teal.shade50,
          child: Text(
            doctor.image,
            style: const TextStyle(fontSize: 25),
          ),
        ),
        title: Text(
          doctor.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${doctor.specialization}\n${doctor.experience} experience',
        ),
        isThreeLine: true,
        trailing: const Icon(Icons.arrow_forward_ios, size: 17),
        onTap: onTap,
      ),
    );
  }
}

// -------------------- DOCTOR DETAILS PAGE --------------------

class DoctorDetailsPage extends StatelessWidget {
  final Doctor doctor;

  const DoctorDetailsPage({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Doctor Details')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 15),
          CircleAvatar(
            radius: 55,
            backgroundColor: Colors.teal.shade50,
            child: Text(
              doctor.image,
              style: const TextStyle(fontSize: 48),
            ),
          ),
          const SizedBox(height: 18),
          Center(
            child: Text(
              doctor.name,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Text(
              doctor.specialization,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.teal,
              ),
            ),
          ),
          const SizedBox(height: 25),
          detailTile(Icons.work, 'Experience', doctor.experience),
          detailTile(
            Icons.currency_rupee,
            'Consultation Fee',
            '₹${doctor.fee}',
          ),
          detailTile(Icons.medical_information, 'About', doctor.about),
          const SizedBox(height: 25),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BookAppointmentPage(doctor: doctor),
                ),
              );
            },
            child: const Text('Book Appointment'),
          ),
        ],
      ),
    );
  }

  Widget detailTile(IconData icon, String title, String value) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }
}

// -------------------- BOOK APPOINTMENT PAGE --------------------

class BookAppointmentPage extends StatefulWidget {
  final Doctor doctor;

  const BookAppointmentPage({
    super.key,
    required this.doctor,
  });

  @override
  State<BookAppointmentPage> createState() =>
      _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  DateTime? selectedDate;
  String? selectedTime;

  final List<String> timeSlots = [
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
    '05:00 PM',
  ];

  Future<void> chooseDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 90)),
    );

    if (date != null && mounted) {
      setState(() => selectedDate = date);
    }
  }

  void confirmBooking() {
    if (selectedDate == null || selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select both date and time.'),
        ),
      );
      return;
    }

    bookedAppointments.add(
      Appointment(
        doctorName: widget.doctor.name,
        specialization: widget.doctor.specialization,
        date:
            '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
        time: selectedTime!,
      ),
    );

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Appointment Confirmed!'),
        content: Text(
          'Your appointment with ${widget.doctor.name} has been booked.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Appointment')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal.shade50,
                child: Text(widget.doctor.image),
              ),
              title: Text(
                widget.doctor.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(widget.doctor.specialization),
              trailing: Text('₹${widget.doctor.fee}'),
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'Select Appointment Date',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: chooseDate,
            icon: const Icon(Icons.calendar_month),
            label: Text(
              selectedDate == null
                  ? 'Choose Date'
                  : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'Select Time Slot',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: timeSlots.map((time) {
              final isSelected = selectedTime == time;
              return ChoiceChip(
                label: Text(time),
                selected: isSelected,
                selectedColor: Colors.teal.shade100,
                onSelected: (_) {
                  setState(() => selectedTime = time);
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 35),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16),
            ),
            onPressed: confirmBooking,
            child: const Text('Confirm Appointment'),
          ),
        ],
      ),
    );
  }
}

// -------------------- APPOINTMENTS PAGE --------------------

class AppointmentsPage extends StatelessWidget {
  final VoidCallback onChanged;

  const AppointmentsPage({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.teal,
            child: const Text(
              'My Appointments',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: bookedAppointments.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 65,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 15),
                        Text(
                          'No appointments yet!',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        Text('Book an appointment with a doctor.'),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: bookedAppointments.length,
                    itemBuilder: (context, index) {
                      final appointment = bookedAppointments[index];

                      return Card(
                        color: Colors.white,
                        margin: const EdgeInsets.only(bottom: 14),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              ListTile(
                                leading: const CircleAvatar(
                                  backgroundColor: Color(0xFFE0F2F1),
                                  child: Icon(
                                    Icons.medical_services,
                                    color: Colors.teal,
                                  ),
                                ),
                                title: Text(
                                  appointment.doctorName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  appointment.specialization,
                                ),
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_month,
                                    color: Colors.teal,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(appointment.date),
                                  const SizedBox(width: 20),
                                  const Icon(
                                    Icons.access_time,
                                    color: Colors.teal,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(appointment.time),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (dialogContext) =>
                                          AlertDialog(
                                        title: const Text(
                                          'Cancel Appointment?',
                                        ),
                                        content: const Text(
                                          'Are you sure you want to cancel this appointment?',
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(dialogContext);
                                            },
                                            child: const Text('No'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              bookedAppointments.removeAt(index);
                                              Navigator.pop(dialogContext);
                                              onChanged();
                                            },
                                            child: const Text(
                                              'Yes, Cancel',
                                              style: TextStyle(
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Cancel Appointment',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// -------------------- PROFILE PAGE --------------------

class ProfilePage extends StatelessWidget {
  final VoidCallback onChanged;

  const ProfilePage({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 55,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  profileDetails['Name'] ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Health Appointment App User',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'Personal Information',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          profileTile(Icons.person, 'Name'),
          profileTile(Icons.badge, 'Student ID'),
          profileTile(Icons.email, 'Email'),
          profileTile(Icons.phone, 'Phone'),
          profileTile(Icons.cake, 'Age'),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => EditProfilePage(
                    onChanged: onChanged,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.edit),
            label: const Text('Edit Profile'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(15),
            ),
          ),
        ],
      ),
    );
  }

  Widget profileTile(IconData icon, String field) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(field),
        subtitle: Text(profileDetails[field] ?? ''),
      ),
    );
  }
}

// -------------------- EDIT PROFILE PAGE --------------------

class EditProfilePage extends StatefulWidget {
  final VoidCallback onChanged;

  const EditProfilePage({
    super.key,
    required this.onChanged,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late final TextEditingController nameController;
  late final TextEditingController idController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController ageController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(
      text: profileDetails['Name'],
    );
    idController = TextEditingController(
      text: profileDetails['Student ID'],
    );
    emailController = TextEditingController(
      text: profileDetails['Email'],
    );
    phoneController = TextEditingController(
      text: profileDetails['Phone'],
    );
    ageController = TextEditingController(
      text: profileDetails['Age'],
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    idController.dispose();
    emailController.dispose();
    phoneController.dispose();
    ageController.dispose();
    super.dispose();
  }

  void saveProfile() {
    if (nameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty ||
        ageController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all required fields.'),
        ),
      );
      return;
    }

    profileDetails['Name'] = nameController.text.trim();
    profileDetails['Student ID'] = idController.text.trim();
    profileDetails['Email'] = emailController.text.trim();
    profileDetails['Phone'] = phoneController.text.trim();
    profileDetails['Age'] = ageController.text.trim();

    widget.onChanged();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile updated successfully!'),
      ),
    );

    Navigator.of(context).pop();
  }

  Widget buildField(
    String label,
    TextEditingController controller,
    IconData icon, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.teal),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Center(
            child: CircleAvatar(
              radius: 42,
              backgroundColor: Color(0xFFE0F2F1),
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.teal,
              ),
            ),
          ),
          const SizedBox(height: 25),
          buildField('Full Name', nameController, Icons.person),
          buildField('Student ID', idController, Icons.badge),
          buildField(
            'Email Address',
            emailController,
            Icons.email,
            keyboardType: TextInputType.emailAddress,
          ),
          buildField(
            'Phone Number',
            phoneController,
            Icons.phone,
            keyboardType: TextInputType.phone,
          ),
          buildField(
            'Age',
            ageController,
            Icons.cake,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: saveProfile,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16),
            ),
            child: const Text('Save Changes'),
          ),
        ],
      ),
    );
  }
}

