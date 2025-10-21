import 'dart:math';

import 'package:braga_resolve/Presentation/Bloc/UserCommentBloc/user_comment_bloc.dart';
import 'package:braga_resolve/Presentation/Widgets/comment_list_tile.dart';
import 'package:braga_resolve/Presentation/Widgets/logo_progress_indicator.dart';
import 'package:braga_resolve/Data/user_comment_repository.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  final userCommentsBloc = UserCommentsBloc(UserCommentsRepository());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 48),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Visão geral', style: TextStyle(fontSize: 28)),
            const SizedBox(height: 32),
            budgetCard(),
            const SizedBox(height: 24),
            jobsCard(),
            const SizedBox(height: 24),
            avaliationCard(),
          ],
        ),
      ),
    );
  }

  Widget budgetCard() {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Orçamentos pendentes', style: TextStyle(fontSize: 18)),
              Text(
                Random().nextInt(10).toString(),
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              Text(
                'Último recebido há 1h',
                style: TextStyle(color: Colors.grey.shade600),
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: () {},
                child: Text(
                  'Ver todos',
                  style: TextStyle(
                    color: Colors.yellow.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget jobsCard() {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Serviços em andamento', style: TextStyle(fontSize: 18)),
              Text(
                Random().nextInt(10).toString(),
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              Text(
                'Próximo serviço em 2 dias',
                style: TextStyle(color: Colors.grey.shade600),
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: () {},
                child: Text(
                  'Abrir calendário',
                  style: TextStyle(
                    color: Colors.yellow.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget avaliationCard() {
    return BlocProvider(
      create: (context) => userCommentsBloc,
      child: GestureDetector(
        onTap: () {
          userCommentsBloc.add(LoadUserComments(10));

          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.horizontal_rule),
                    Expanded(
                      child: BlocBuilder<UserCommentsBloc, UserCommentsState>(
                        bloc: userCommentsBloc,
                        builder: (context, state) {
                          if (state is UserCommentsLoading) {
                            return Center(child: LogoProgressIndicator());
                          } else if (state is UserCommentsLoaded) {
                            return Column(
                              children: [
                                Text(
                                  'Sua avaliação nos últimos meses (média)',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 32),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 32,
                                  ),
                                  child: SizedBox(
                                    height: 200,
                                    child: LineChart(
                                      LineChartData(
                                        minY: 1.0,
                                        maxY: 5.0,
                                        titlesData: FlTitlesData(
                                          rightTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: false,
                                            ),
                                          ),
                                          topTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: false,
                                            ),
                                          ),
                                          bottomTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: true,
                                              getTitlesWidget: (value, meta) {
                                                const lastMonths = [
                                                  'abr',
                                                  'mai',
                                                  'jun',
                                                  'jul',
                                                  'ago',
                                                  'set',
                                                ];
                                                return Text(
                                                  lastMonths[value.toInt()],
                                                );
                                              },
                                              interval: 1,
                                            ),
                                          ),
                                          leftTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: true,
                                              interval: 1,
                                              getTitlesWidget: (value, meta) {
                                                return Text(
                                                  value.toStringAsFixed(1),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        lineBarsData: [
                                          LineChartBarData(
                                            spots: [
                                              FlSpot(0, 4.5),
                                              FlSpot(1, 4.0),
                                              FlSpot(2, 4.3),
                                              FlSpot(3, 5.0),
                                              FlSpot(4, 4.7),
                                              FlSpot(5, 4.2),
                                            ],
                                            isCurved: true,
                                            color: Colors.yellow,
                                            barWidth: 4,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width / 6,
                                    vertical: 18,
                                  ),
                                  child: Divider(),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: state.comments.length,
                                    itemBuilder: (context, index) =>
                                        CommentListTile(
                                          avatar: state.comments[index].avatar,
                                          name: state.comments[index].name
                                              .split(' ')
                                              .take(2)
                                              .toString(),
                                          comment:
                                              state.comments[index].comment,
                                        ),
                                  ),
                                ),
                              ],
                            );
                          } else if (state is UserCommentsError) {
                            return Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(state.message),
                                  const SizedBox(height: 12),
                                  ElevatedButton(
                                    onPressed: () => userCommentsBloc.add(
                                      RefreshComments(10),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                        Colors.amber,
                                      ),
                                    ),
                                    child: Text(
                                      'Tentar novamente',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Center(child: Text('Estado não mapeado'));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: SizedBox(
          width: double.infinity,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sua Avaliação', style: TextStyle(fontSize: 18)),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        (Random().nextDouble() * 5)
                            .toStringAsFixed(1)
                            .toString(),
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(Icons.star, color: Colors.yellow.shade700),
                    ],
                  ),
                  Text(
                    'Baseado em ${Random().nextInt(100)} avaliações',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
