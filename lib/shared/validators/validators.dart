class Validators {
  String? requiredValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo de email obrigatório.';
    }

    // Regex for email
    final emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Por favor, insira um email válido.';
    }

    return null;
  }

  String? confirmEmailValidator(String? email, String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo de confirmação de email obrigatório';
    }
    if (email != value) {
      return 'Os emails não coincidem.';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo de senha obrigatório.';
    }

    // Check if password has at least 8 characters
    if (value.length < 8) {
      return 'A senha deve ter pelo menos 8 caracteres.';
    }

    // Check if password contains at least one uppercase letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'A senha deve conter pelo menos uma letra maiúscula.';
    }

    // Check if password contains at least one of the special characters
    if (!value.contains(RegExp(r'[-;,._@!]'))) {
      return 'A senha deve conter pelo menos um dos caracteres especiais: -;,._@!';
    }

    return null;
  }

  String? confirmPasswordValidator(String? password, String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo de confirmação de senha obrigatório';
    }
    if (password != value) {
      return 'As senhas não coincidem';
    }
    return null;
  }
}
