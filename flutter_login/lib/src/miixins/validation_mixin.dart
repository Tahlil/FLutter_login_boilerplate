class ValidationMixin {
  String validateEmail(String value) {
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(value))
          return 'Please Enter Valid Email';
        else
          return null;
  }

  String validatePassword (String value) {
        if (value.length < 8) {
          return "Password must be at least 8 characters";
        }
        else{
          return null;
        }
    }
}