import 'package:cloud_firestore/cloud_firestore.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cadastro_nota_model.dart';
export 'cadastro_nota_model.dart';

class CadastroNotaWidget extends StatefulWidget {
  const CadastroNotaWidget({super.key});

  static String routeName = 'CadastroNota';
  static String routePath = '/cadastroNota';

  @override
  State<CadastroNotaWidget> createState() => _CadastroNotaWidgetState();
}

class _CadastroNotaWidgetState extends State<CadastroNotaWidget> {
  late CadastroNotaModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CadastroNotaModel());

    _model.alunoTextController ??= TextEditingController();
    _model.alunoFocusNode ??= FocusNode();

    _model.disciplinaTextController ??= TextEditingController();
    _model.disciplinaFocusNode ??= FocusNode();

    _model.notaTextController ??= TextEditingController();
    _model.notaFocusNode ??= FocusNode();
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
              const Icon(Icons.grade_rounded, color: Color(0xFFE91E8C), size: 24),
              const SizedBox(width: 8),
              Text(
                'Lançar Nota',
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
                            'Preencha os dados do lançamento',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                                  color: const Color(0xFFB5477A),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _model.alunoTextController,
                            focusNode: _model.alunoFocusNode,
                            decoration: InputDecoration(
                              labelText: 'Nome do Aluno',
                              labelStyle: const TextStyle(color: Color(0xFF880E4F)),
                              hintText: 'Ex: Rayane Vieira',
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
                            controller: _model.disciplinaTextController,
                            focusNode: _model.disciplinaFocusNode,
                            decoration: InputDecoration(
                              labelText: 'Disciplina',
                              labelStyle: const TextStyle(color: Color(0xFF880E4F)),
                              hintText: 'Ex: Tópicos Especiais',
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
                            controller: _model.notaTextController,
                            focusNode: _model.notaFocusNode,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              labelText: 'Nota (0 a 10)',
                              labelStyle: const TextStyle(color: Color(0xFF880E4F)),
                              hintText: 'Ex: 9.5',
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
                              final aluno = _model.alunoTextController.text.trim();
                              final disciplina = _model.disciplinaTextController.text.trim();
                              final nota = _model.notaTextController.text.trim();

                              if (aluno.isEmpty || disciplina.isEmpty || nota.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Preencha todos os campos antes de salvar!'),
                                    backgroundColor: Color(0xFFD81B60),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                return;
                              }

                              await FirebaseFirestore.instance.collection('notas').add({
                                'nome_aluno': aluno,
                                'disciplina': disciplina,
                                'valor_nota': nota,
                                'data_criacao': FieldValue.serverTimestamp(),
                              });

                              _model.alunoTextController?.clear();
                              _model.disciplinaTextController?.clear();
                              _model.notaTextController?.clear();

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Nota salva com sucesso!'),
                                  backgroundColor: Color(0xFFE91E8C),
                                  duration: Duration(seconds: 2),
                                ),
                              );

                              context.safePop();
                            },
                            text: 'Salvar Nota',
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
