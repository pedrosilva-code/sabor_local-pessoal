import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'tela_endereco_widget.dart' show TelaEnderecoWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TelaEnderecoModel extends FlutterFlowModel<TelaEnderecoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldCEP widget.
  FocusNode? textFieldCEPFocusNode;
  TextEditingController? textFieldCEPTextController;
  late MaskTextInputFormatter textFieldCEPMask;
  String? Function(BuildContext, String?)? textFieldCEPTextControllerValidator;
  String? _textFieldCEPTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório.';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 10) {
      return 'Este campo apenas aceita 10 caracteres.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (ViaCEP)] action in TextFieldCEP widget.
  ApiCallResponse? apiResult7n7;
  // State field(s) for TextFieldLogradouro widget.
  FocusNode? textFieldLogradouroFocusNode;
  TextEditingController? textFieldLogradouroTextController;
  String? Function(BuildContext, String?)?
      textFieldLogradouroTextControllerValidator;
  String? _textFieldLogradouroTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for TextFieldNumero widget.
  FocusNode? textFieldNumeroFocusNode;
  TextEditingController? textFieldNumeroTextController;
  String? Function(BuildContext, String?)?
      textFieldNumeroTextControllerValidator;
  String? _textFieldNumeroTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório';
    }

    if (val.length < 1) {
      return 'Caso não tenha numero coloque S/N';
    }

    return null;
  }

  // State field(s) for TextFieldBairro widget.
  FocusNode? textFieldBairroFocusNode;
  TextEditingController? textFieldBairroTextController;
  String? Function(BuildContext, String?)?
      textFieldBairroTextControllerValidator;
  String? _textFieldBairroTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório!';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for TextFieldComplemento widget.
  FocusNode? textFieldComplementoFocusNode;
  TextEditingController? textFieldComplementoTextController;
  String? Function(BuildContext, String?)?
      textFieldComplementoTextControllerValidator;
  // State field(s) for TextFieldReferencia widget.
  FocusNode? textFieldReferenciaFocusNode;
  TextEditingController? textFieldReferenciaTextController;
  String? Function(BuildContext, String?)?
      textFieldReferenciaTextControllerValidator;
  // Stores action output result for [Backend Call - API (CadastrarEndereco)] action in ButtonEntrar widget.
  ApiCallResponse? apiResultu07;

  @override
  void initState(BuildContext context) {
    textFieldCEPTextControllerValidator = _textFieldCEPTextControllerValidator;
    textFieldLogradouroTextControllerValidator =
        _textFieldLogradouroTextControllerValidator;
    textFieldNumeroTextControllerValidator =
        _textFieldNumeroTextControllerValidator;
    textFieldBairroTextControllerValidator =
        _textFieldBairroTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldCEPFocusNode?.dispose();
    textFieldCEPTextController?.dispose();

    textFieldLogradouroFocusNode?.dispose();
    textFieldLogradouroTextController?.dispose();

    textFieldNumeroFocusNode?.dispose();
    textFieldNumeroTextController?.dispose();

    textFieldBairroFocusNode?.dispose();
    textFieldBairroTextController?.dispose();

    textFieldComplementoFocusNode?.dispose();
    textFieldComplementoTextController?.dispose();

    textFieldReferenciaFocusNode?.dispose();
    textFieldReferenciaTextController?.dispose();
  }
}
