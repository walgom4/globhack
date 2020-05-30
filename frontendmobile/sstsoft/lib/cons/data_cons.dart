class DataCons {
  static final List<String> documentTypeList = [
    "Cédula de ciudadanía",
    "Cédula de extranjería",
    "Pasaporte"
  ];
  static final List<String> genreList = ["Masculino", "Femenino", "Otro"];
  static final List<String> transportTypeList = [
    "Transporte público",
    "Carro particular",
    "Taxi",
    "Bicicleta",
    "A pie",
  ];

  ///All health status questions
  static final Map<String, String> healthStatusQuestions = {
    "symptomQuestion":
        "¿En los últimos tres días has presentado alguno de estos síntomas?",
    "previousHealthConditionQuestion":
        "¿Tienes alguna enfermedad o condición de salud previa (enfermedad pulmonar -Epoc-, enfermedad cardíaca, hipertensión arterial, enfermedad renal, diabetes, enfermedades inmunosupresoras, cáncer, trasplante previo, lupus, entre otras) o estado de embarazo que represente un riesgo para contagio por Covid-19?",
    "recentlyContactQuestion":
        "¿Has tenido contacto estrecho (a menos de 2m de distancia y durante un tiempo mayor a 15 minutos) en los últimos 14 días con una persona “Caso” confirmado o sospechoso de Covid-19?",
    "elderPeopleEpocConditionQuestion":
        "¿Convives con personas mayores de 60 años y/o que presenten alguna alteración (enfermedad pulmonar -Epoc-, enfermedad cardíaca, hipertensión arterial, enfermedad renal, diabetes, enfermedades inmunosupresoras, cáncer, trasplante previo, lupus, entre otras) en su salud?",
    "healthServicesWorkingQuestion":
        "¿Convives con personas que estén trabajando de manera presencial en los servicios o atención de salud?",
    "emergencyContactQuestion":
        "¿Convives con personas que estén trabajando de manera presencial en los servicios o atención de salud?",
    "livingPlaceQuestion": "¿Donde vives?",
    "workTransportQuestion": "¿Cómo te desplazas al lugar de trabajo?",
  };

  static final String disclaimer =
      "La identificación temprana de personas sintomáticos es fundamental para facilitar el seguimiento de casos. Con el diligenciamiento y firma del presente formulario, autorizo de manera expresa e informada a EMPRESA 01, para que recolecte, almacene, use, disponga o eventualmente llegue a transmitir o transferir a nivel nacional o internacional información personal referida a mis datos de identificación, contacto y de salud.\n Tengo conocimiento que los datos serán empleados para la detección temprana de personas sintomáticas mediante control diario de los síntomas asociados con Covid-19. Esta forma parte de las estrategias de prevención, protección y mitigación para todo el personal de la empresa, y en el evento en que se requiera, podrán ser compartidos con las autoridades sanitarias gubernamentales o distritales.";
}

enum yesNo { yes, no }

convertYesNoToValue(yesNo result) {
  switch (result) {
    case yesNo.yes:
      return "Sí";
    case yesNo.no:
      return "No";
  }
}
