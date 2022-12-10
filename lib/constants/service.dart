const String baseHost =
    String.fromEnvironment("BE-HOST", defaultValue: "http://localhost");
const String port = String.fromEnvironment("BE-PORT", defaultValue: "8181");

String baseUrl = "$baseHost:$port";
