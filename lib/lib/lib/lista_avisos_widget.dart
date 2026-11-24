import 'package:cloud_firestore/cloud_firestore.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'lista_avisos_model.dart';
export 'lista_avisos_model.dart';

class ListaAvisosWidget extends StatefulWidget {
  const ListaAvisosWidget({super.key});

  static String routeName = 'ListaAvisos';
  static String routePath = '/listaAvisos';

  @override
  State<ListaAvisosWidget> createState() => _ListaAvisosWidgetState();
}

class _ListaAvisosWidgetState extends State<ListaAvisosWidget> {
  late ListaAvisosModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaAvisosModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF8F0F4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFCE4EC),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 22,
          buttonSize: 48,
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFFB5477A),
            size: 24,
          ),
          onPressed: () async {
            context.pushNamed(PrinciWidget.routeName);
          },
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.campaign_rounded, color: Color(0xFFE91E8C), size: 24),
            const SizedBox(width: 8),
            Text(
              'Avisos Escolares',
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    font: GoogleFonts.interTight(fontWeight: FontWeight.bold),
                    color: const Color(0xFFD81B60),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFE91E8C),
        elevation: 4,
        child: const Icon(Icons.add, color: Colors.white, size: 28),
        onPressed: () async {
          context.pushNamed(CadastroAvisoWidget.routeName);
        },
      ),
      body: SafeArea(
        top: true,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('avisos')
              .orderBy('data_criacao', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFFE91E8C)),
              );
            }

            final docs = snapshot.data!.docs;

            if (docs.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.mark_email_read_outlined, size: 64, color: Color(0xFFB5477A)),
                      const SizedBox(height: 16),
                      Text(
                        'Nenhum aviso cadastrado ainda.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).titleMedium.override(
                              font: GoogleFonts.interTight(fontWeight: FontWeight.w600),
                              color: const Color(0xFF7A2A52),
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Clique no botão + abaixo para cadastrar um novo aviso.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(),
                              color: const Color(0xFFBF7A9A),
                            ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return ListView.separated(
              padding: const EdgeInsets.fromSTEB(20, 20, 20, 80),
              itemCount: docs.length,
              separatorBuilder: (_, __) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                final data = docs[index].data() as Map<String, dynamic>;
                final titulo = data['titulo'] ?? 'Sem título';
                final descricao = data['descricao'] ?? '';

                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 12,
                        color: Color(0x14E91E8C),
                        offset: Offset(0, 4),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFFCE4EF), width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFCE4EF),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.notifications_active_rounded,
                                color: Color(0xFFE91E8C),
                                size: 18,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                titulo,
                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                      font: GoogleFonts.interTight(fontWeight: FontWeight.bold),
                                      color: const Color(0xFF880E4F),
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          descricao,
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(),
                                color: const Color(0xFF6D4C5E),
                                fontSize: 14,
                                lineHeight: 1.5,
                              ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
