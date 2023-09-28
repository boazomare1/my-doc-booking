import 'package:flutter/material.dart';
import 'package:oasis_doctor_appointment/components/custom_appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oasis_doctor_appointment/utils/config.dart';

import '../components/button.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Doctor Details',
        icon: const FaIcon(Icons.arrow_back_ios),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isFav = !isFav;
                });
              },
              icon: FaIcon(
                isFav ? Icons.favorite_rounded : Icons.favorite_outline,
                color: Colors.red,
              ))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          const AboutDoctor(),
          const DetailBody(),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Button(
              width: double.infinity,
              title: 'Book Appointment',
              onPressed: () {
                // NAVIGATE TO BOOKING
                Navigator.of(context).pushNamed('booking_page');
              },
              disable: false,
            ),
          )
        ],
      )),
    );
  }
}

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      width: double.infinity,
      child: Column(children: <Widget>[
        const CircleAvatar(
          radius: 65.0,
          backgroundImage: AssetImage('assets/profile.jpg'),
          backgroundColor: Colors.white,
        ),
        Config.spaceSmall,
        const Text(
          'Dr Brian Beller',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Config.spaceSmall,
        SizedBox(
          width: Config.widthSize * 0.65,
          child: const Text(
            'MBBS(International Medical University,Malaysia),MRCP(Royal College of Physicians,United KIngdom)',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
        Config.spaceSmall,
        SizedBox(
          width: Config.widthSize * 0.45,
          child: const Text(
            'Tabaka Mission Hospital',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        )
      ]),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Config.spaceSmall,
          DoctorInfo(),
          Config.spaceSmall,
          Text(
            'About Doctor',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Dr Beller is an experienced Nurse at TMH. He has worked with us since 2008, and he completed his training here.',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
            softWrap: true,
            textAlign: TextAlign.justify,
          )

          //doc experience,patient and rating
        ],
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        InfoCard(label: 'Patients', value: '109'),
        SizedBox(
          width: 15,
        ),
        InfoCard(label: 'Experience', value: '10 Years'),
        SizedBox(
          width: 15,
        ),
        InfoCard(label: 'Rating', value: '4.6')
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Config.primaryColor,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      child: Column(
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ));
  }
}
