import '/flutter_flow/flutter_flow_util.dart';
import 'cadastro_aviso_widget.dart' show CadastroAvisoWidget;
import 'package:flutter/material.dart';

class CadastroAvisoModel extends FlutterFlowModel<CadastroAvisoWidget> {
  FocusNode? tituloFocusNode;
  TextEditingController? tituloTextController;
  String? Function(BuildContext, String?)? tituloTextControllerValidator;

  FocusNode? descricaoFocusNode;
  TextEditingController? descricaoTextController;
  String? Function(BuildContext, String?)? descricaoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tituloFocusNode?.dispose();
    tituloTextController?.dispose();
    descricaoFocusNode?.dispose();
    descricaoTextController?.dispose();
  }
}
