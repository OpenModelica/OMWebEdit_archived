model RLCircuit
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-58, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1 annotation(
    Placement(visible = true, transformation(origin = {-46, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor1 annotation(
    Placement(visible = true, transformation(origin = {20, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage1 annotation(
    Placement(visible = true, transformation(origin = {-74, 12}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(sineVoltage1.n, ground1.p) annotation(
    Line(points = {{-74, 2}, {-76, 2}, {-76, -34}, {-58, -34}, {-58, -34}}, color = {0, 0, 255}));
  connect(inductor1.n, ground1.p) annotation(
    Line(points = {{30, 50}, {56, 50}, {56, -32}, {-58, -32}, {-58, -34}, {-58, -34}}, color = {0, 0, 255}));
  connect(resistor1.n, inductor1.p) annotation(
    Line(points = {{-36, 50}, {10, 50}, {10, 50}, {10, 50}}, color = {0, 0, 255}));
  connect(sineVoltage1.p, resistor1.p) annotation(
    Line(points = {{-74, 22}, {-76, 22}, {-76, 50}, {-56, 50}, {-56, 50}}, color = {0, 0, 255}));

  annotation(uses(Modelica(version = "3.2.3")));
end RLCircuit;
