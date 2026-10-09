import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'tela_cadastro_widget.dart' show TelaCadastroWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TelaCadastroModel extends FlutterFlowModel<TelaCadastroWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldNome widget.
  FocusNode? textFieldNomeFocusNode;
  TextEditingController? textFieldNomeTextController;
  String? Function(BuildContext, String?)? textFieldNomeTextControllerValidator;
  String? _textFieldNomeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'O nome é obrigatório!';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for TextFieldCPF widget.
  FocusNode? textFieldCPFFocusNode;
  TextEditingController? textFieldCPFTextController;
  late MaskTextInputFormatter textFieldCPFMask;
  String? Function(BuildContext, String?)? textFieldCPFTextControllerValidator;
  String? _textFieldCPFTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Esse campo é obrigatório!';
    }

    if (val.length < 1) {
      return 'Preencha esse campo completo.';
    }
    if (val.length > 14) {
      return 'O máximo é 11 Caracteres.';
    }

    return null;
  }

  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode;
  TextEditingController? textFieldEmailTextController;
  String? Function(BuildContext, String?)?
      textFieldEmailTextControllerValidator;
  String? _textFieldEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'O e-mail é obrigatório!';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Formato de e-mail inválido!';
    }
    return null;
  }

  // State field(s) for TextFieldCelular widget.
  FocusNode? textFieldCelularFocusNode;
  TextEditingController? textFieldCelularTextController;
  late MaskTextInputFormatter textFieldCelularMask;
  String? Function(BuildContext, String?)?
      textFieldCelularTextControllerValidator;
  String? _textFieldCelularTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Um número é obrigatório!';
    }

    return null;
  }

  // State field(s) for TextFieldSenha widget.
  FocusNode? textFieldSenhaFocusNode;
  TextEditingController? textFieldSenhaTextController;
  late bool textFieldSenhaVisibility;
  String? Function(BuildContext, String?)?
      textFieldSenhaTextControllerValidator;
  String? _textFieldSenhaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Uma senha é obrigatório!';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in ButtonContinuarCD widget.
  bool? formValidate;

  @override
  void initState(BuildContext context) {
    textFieldNomeTextControllerValidator =
        _textFieldNomeTextControllerValidator;
    textFieldCPFTextControllerValidator = _textFieldCPFTextControllerValidator;
    textFieldEmailTextControllerValidator =
        _textFieldEmailTextControllerValidator;
    textFieldCelularTextControllerValidator =
        _textFieldCelularTextControllerValidator;
    textFieldSenhaVisibility = false;
    textFieldSenhaTextControllerValidator =
        _textFieldSenhaTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldNomeFocusNode?.dispose();
    textFieldNomeTextController?.dispose();

    textFieldCPFFocusNode?.dispose();
    textFieldCPFTextController?.dispose();

    textFieldEmailFocusNode?.dispose();
    textFieldEmailTextController?.dispose();

    textFieldCelularFocusNode?.dispose();
    textFieldCelularTextController?.dispose();

    textFieldSenhaFocusNode?.dispose();
    textFieldSenhaTextController?.dispose();
  }
}
