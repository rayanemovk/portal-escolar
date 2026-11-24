import 'package:cloud_firestore/cloud_firestore.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cadastro_aviso_model.dart';
export 'cadastro_aviso_model.dart';

class CadastroAvisoWidget extends StatefulWidget {
  const CadastroAvisoWidget({super.key});

  static String routeName = 'CadastroAviso';
  static String routePath = '/cadastroAviso';

  @override
  State<CadastroAvisoWidget> createState() => _CadastroAvisoWidgetState();
}

class _CadastroAvisoWidgetState extends State<CadastroAvisoWidget> {
  late CadastroAvisoModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CadastroAvisoModel());

    _model.tituloTextController ??= TextEditingController();
    _model.tituloFocusNode ??= FocusNode();

    _model.descricaoTextController ??= TextEditingController();
    _model.descricaoFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
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
              context.safePop();
            },
          ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.campaign_rounded,
                color: Color(0xFFE91E8C),
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'Novo Aviso',
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
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 16,
                          color: Color(0x1AE91E8C),
                          offset: Offset(0, 4),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Preencha as informações do aviso',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                                  color: const Color(0xFFB5477A),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _model.tituloTextController,
                            focusNode: _model.tituloFocusNode,
                            decoration: InputDecoration(
                              labelText: 'Título do Aviso',
                              labelStyle: const TextStyle(color: Color(0xFF880E4F)),
                              hintText: 'Ex: Reunião de Pais',
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFFFCE4EF), width: 1.5),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFFE91E8C), width: 2),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              filled: true,
                              fillColor: const Color(0xFFFFF8FB),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _model.descricaoTextController,
                            focusNode: _model.descricaoFocusNode,
                            maxLines: 4,
                            decoration: InputDecoration(
                              labelText: 'Descrição do Aviso',
                              labelStyle: const TextStyle(color: Color(0xFF880E4F)),
                              hintText: 'Digite o comunicado detalhado...',
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFFFCE4EF), width: 1.5),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFFE91E8C), width: 2),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              filled: true,
                              fillColor: const Color(0xFFFFF8FB),
                            ),
                          ),
                          const SizedBox(height: 28),
                          FFButtonWidget(
                            onPressed: () async {
                              final titulo = _model.tituloTextController.text.trim();
                              final desc = _model.descricaoTextController.text.trim();

                              if (titulo.isEmpty || desc.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Preencha todos os campos antes de salvar!'),
                                    backgroundColor: Color(0xFFD81B60),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                return;
                              }

                              await FirebaseFirestore.instance.collection('avisos').add({
                                'titulo': titulo,
                                'descricao': desc,
                                'data_criacao': FieldValue.serverTimestamp(),
                              });

                              _model.tituloTextController?.clear();
                              _model.descricaoTextController?.clear();

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Aviso cadastrado com sucesso!'),
                                  backgroundColor: Color(0xFFE91E8C),
                                  duration: Duration(seconds: 2),
                                ),
                              );

                              context.safePop();
                            },
                            text: 'Salvar Aviso',
                            icon: const Icon(Icons.check_circle_outline, size: 20),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 54,
                              color: const Color(0xFFE91E8C),
                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.interTight(fontWeight: FontWeight.bold),
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                              elevation: 2,
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                        ],
                      ),
                    ),
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
