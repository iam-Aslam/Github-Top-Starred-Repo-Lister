import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.user,
    required this.starCount,
  }) : super(key: key);
  final String title;
  final String description;
  final String imageUrl;
  final String user;
  final String starCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Card(
        elevation: 3,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 8,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.amberAccent,
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 40,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'REPO:   $title',
                      style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 120,
                    ),
                    Text(
                      'DESCRIPTION: $description',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.1,
                          child: Text(
                            'User Name:   $user',
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            style: GoogleFonts.bitter(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 70,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.orangeAccent,
                              ),
                              Text(
                                starCount,
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
