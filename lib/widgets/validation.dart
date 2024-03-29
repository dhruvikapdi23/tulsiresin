

class Validation {
  //validate for email
  bool isEmail(String str) {
    RegExp _email = RegExp(
        r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");
    return _email.hasMatch(str.toLowerCase());
  }

//validate for password
  bool isPassword(String str) {
    RegExp _pwd = RegExp(r"^(?:(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).*)$");
    return _pwd.hasMatch(str);
  }

// Check Id Validation
  String? checkEmailValidation(value) {
    if (value.isEmpty) {
      return "Email is Required";
    } else if (Validation().isEmail(value) == false) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

// Check Password Validation
  String? checkPasswordValidation(value) {
    if (value.isEmpty) {
      return "Password is Required";
    }else{
      return null;
    }
    return null;
  }

  // Check First Name Validation
  String? checkFirstNameValidation(value) {
    if (value.isEmpty) {
      return "First Name is Required";
    }else{
      return null;
    }
  }

  // Check  Name Validation
  String? checkNameValidation(value) {
    if (value.isEmpty) {
      return "Name is Required";
    }else{
      return null;
    }
  }

  // Check Second Name Validation
  String? checkLastNameValidation(value) {
    if (value.isEmpty) {
      return "Last Name is Required";
    }else{
      return null;
    }
  }

  // Check Country Validation
  String? checkCountryValidation(value) {
    if (value.isEmpty) {
      return "Country is Required";
    }else{
      return null;
    }
  }

  // Check StreetName Validation
  String? checkStreetNameValidation(value) {
    if (value.isEmpty) {
      return "Street Name is Required";
    }else{
      return null;
    }
  }

  // Check StateProvision Validation
  String? checkStateProvisionValidation(value) {
    if (value.isEmpty) {
      return "State / Province is Required";
    }else{
      return null;
    }
  }

  // Check ZipCode Validation
  String? checkZipCodeValidation(value) {
    if (value.isEmpty) {
      return "Zip-code is Required";
    }else{
      return null;
    }
  }

  // Check Phone Validation
  String? checkPhoneValidation(value) {
    if (value.isEmpty) {
      return "Phone No. is Required";
    }else if(value.length <= 10){
      return "Enter valid Phone No.";
    }else{
      return null;
    }
  }
}
