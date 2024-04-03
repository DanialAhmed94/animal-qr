import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String imagePath;
  final Color imageBackgroundColor;
  final String title;
  final String count;
  final String percentCount;
  final Color percentColor;

  final String trailingText;
  final double progressIndicatorValue;
  final Color progressIndicatorBarColor;
  final Color progressIndicatorBackgroundColor;
  const InfoCard({
    super.key,
    required this.imagePath,
    required this.imageBackgroundColor,
    required this.title,
    required this.count,
    required this.percentCount,
    required this.percentColor,
    required this.trailingText,
    required this.progressIndicatorValue,
    required this.progressIndicatorBarColor,
    required this.progressIndicatorBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 140,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 6.0, top: 20, right: 15, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: imageBackgroundColor,
                      radius: 38,
                      child: SizedBox(
                        height: 45,
                        child: Image.asset(
                          imagePath,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Colors.grey[700],
                                ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                count,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontSize: 24,
                                    ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: percentColor,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 14),
                                child: const Text(
                                  "4%",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: LinearProgressIndicator(
                              minHeight: 8,
                              value: progressIndicatorValue,
                              color: progressIndicatorBarColor,
                              backgroundColor: progressIndicatorBackgroundColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  trailingText,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.grey[700],
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
