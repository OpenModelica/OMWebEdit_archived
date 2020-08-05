# Example - RLCircuit.mo

Simple circuit with an resistor, an inductor a source and a ground.
It is build via drag and drop of components which are then connected together.

- [Resistor icon](RLCircuit-Resistor-icon.svg)
  - getIconAnnotation(Modelica.Electrical.Analog.Basic.Resistor)
- [Inductor icon](RLCircuit-Inductor-icon.svg)
  - getIconAnnotation(Modelica.Electrical.Analog.Basic.Inductor)
- [Ground icon](RLCircuit-Ground-icon.svg)
  - getIconAnnotation(Modelica.Electrical.Analog.Basic.Ground)
- [SineVoltage icon](RLCircuit-SineVoltage-icon.svg)
  - getIconAnnotation(Modelica.Electrical.Analog.Sources.SineVoltage)
- [RLCircuit diagram](RLCircuit-Diagram.svg)
  - the icons are placed at the coordinates from Placement annotation retrieved via
    getComponentAnnotations(RLCircuit);
  - the connections are obtained via
    getConnectionCount(RLCircuit); getErrorString();
    getNthConnection(RLCircuit,1); getErrorString();
    getNthConnectionAnnotation(RLCircuit, 1); getErrorString();
    getNthConnection(RLCircuit,2); getErrorString();
    getNthConnectionAnnotation(RLCircuit, 2); getErrorString();
    getNthConnection(RLCircuit,3); getErrorString();
    getNthConnectionAnnotation(RLCircuit, 3); getErrorString();
    getNthConnection(RLCircuit,4); getErrorString();
    getNthConnectionAnnotation(RLCircuit, 4); getErrorString();

See the API used by OMEdit to ask all the needed information from OMC:

- [getIconAndDiagramInformation.mos](getIconAndDiagramInformation.mos)
- [getIconAndDiagramInformation.mos.log](getIconAndDiagramInformation.mos.log) (with the response from OMC)

You can also use [generate_icons.py](generate_icons.py) (or .bat / .sh) to generate icons for an entire library.
