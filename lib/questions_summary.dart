import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                    100), 
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 255, 255),
                    borderRadius: BorderRadius.circular(
                        100), 
                    border: Border.all(
                      color: Colors.blue, 
                      width: 4, 
                    ),
                  ),
                  padding: const EdgeInsets.only(
                      top: 12, right: 12, left: 12, bottom: 12),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      data["question"] as String,
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        color: const Color.fromARGB(204, 255, 255, 255),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      data["user_answer"] as String,
                      style: GoogleFonts.lato(
                        fontSize: 15,
                        color: const Color.fromARGB(155, 255, 0, 0),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      data["correct_answer"] as String,
                      style: GoogleFonts.lato(
                        fontSize: 15,
                        color: const Color.fromARGB(189, 89, 255, 0),
                      ),
                    ),
                  ],
                ),
              )
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
