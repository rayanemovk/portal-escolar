import '/flutter_flow/flutter_flow_util.dart';
import 'cadastro_nota_widget.dart' show CadastroNotaWidget;
import 'package:flutter/material.dart';

class CadastroNotaModel extends FlutterFlowModel<CadastroNotaWidget> {
  FocusNode? alunoFocusNode;
  TextEditingController? alunoTextController;
  String? Function(BuildContext, String?)? alunoTextControllerValidator;

  FocusNode? disciplinaFocusNode;
  TextEditingController? disciplinaTextController;
  String? Function(BuildContext, String?)? disciplinaTextControllerValidator;

  FocusNode? notaFocusNode;
  TextEditingController? notaTextController;
  String? Function(BuildContext, String?)? notaTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    alunoFocusNode?.dispose();
    alunoTextController?.dispose();
    disciplinaFocusNode?.dispose();
    disciplinaTextController?.dispose();
    notaFocusNode?.dispose();
    notaTextController?.dispose();
  }
}
