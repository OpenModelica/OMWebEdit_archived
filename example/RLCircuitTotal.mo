within;
package Total

model RLCircuit  
  import Modelica;
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {-58, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1 annotation(Placement(visible = true, transformation(origin = {-46, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor1 annotation(Placement(visible = true, transformation(origin = {20, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage1 annotation(Placement(visible = true, transformation(origin = {-74, 12}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(sineVoltage1.n, ground1.p) annotation(Line(points = {{-74, 2}, {-76, 2}, {-76, -34}, {-58, -34}, {-58, -34}}, color = {0, 0, 255}));
  connect(inductor1.n, ground1.p) annotation(Line(points = {{30, 50}, {56, 50}, {56, -32}, {-58, -32}, {-58, -34}, {-58, -34}}, color = {0, 0, 255}));
  connect(resistor1.n, inductor1.p) annotation(Line(points = {{-36, 50}, {10, 50}, {10, 50}, {10, 50}}, color = {0, 0, 255}));
  connect(sineVoltage1.p, resistor1.p) annotation(Line(points = {{-74, 22}, {-76, 22}, {-76, 50}, {-56, 50}, {-56, 50}}, color = {0, 0, 255}));
  annotation(uses(Modelica(version = "3.2.3"))); 
end RLCircuit;

package ModelicaServices  "ModelicaServices (OpenModelica implementation) - Models and functions used in the Modelica Standard Library requiring a tool specific implementation" 
  extends Modelica.Icons.Package;

  package Machine  "Machine dependent constants" 
    extends Modelica.Icons.Package;
    final constant Real eps = 1e-15 "Biggest number such that 1.0 + eps = 1.0";
    final constant Real small = 1e-60 "Smallest number such that small and -small are representable on the machine";
    final constant Real inf = 1e60 "Biggest Real number such that inf and -inf are representable on the machine";
    final constant Integer Integer_inf = OpenModelica.Internal.Architecture.integerMax() "Biggest Integer number such that Integer_inf and -Integer_inf are representable on the machine";
    annotation(Documentation(info = "<html>
  <p>
  Package in which processor specific constants are defined that are needed
  by numerical algorithms. Typically these constants are not directly used,
  but indirectly via the alias definition in
  <a href=\"modelica://Modelica.Constants\">Modelica.Constants</a>.
  </p>
  </html>")); 
  end Machine;
  annotation(preferredView = "info", version = "3.2.3", versionBuild = 3, versionDate = "2019-01-23", dateModified = "2019-09-21 12:00:00Z", revisionId = "$Format:%h %ci$", uses(Modelica(version = "3.2.3")), conversion(noneFromVersion = "1.0", noneFromVersion = "1.1", noneFromVersion = "1.2", noneFromVersion = "3.2.1", noneFromVersion = "3.2.2"), Documentation(info = "<html>
<p>
This package contains a set of functions and models to be used in the
Modelica Standard Library that requires a tool specific implementation.
These are:
</p>

<ul>
<li> <a href=\"modelica://ModelicaServices.Animation.Shape\">Animation.Shape</a>
     provides a 3-dim. visualization of elementary
     mechanical objects. It is used in
<a href=\"modelica://Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape\">Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape</a>
     via inheritance.</li>

<li> <a href=\"modelica://ModelicaServices.Animation.Surface\">Animation.Surface</a>
     provides a 3-dim. visualization of
     moveable parameterized surface. It is used in
<a href=\"modelica://Modelica.Mechanics.MultiBody.Visualizers.Advanced.Surface\">Modelica.Mechanics.MultiBody.Visualizers.Advanced.Surface</a>
     via inheritance.</li>

<li> <a href=\"modelica://ModelicaServices.ExternalReferences.loadResource\">ExternalReferences.loadResource</a>
     provides a function to return the absolute path name of an URI or a local file name. It is used in
<a href=\"modelica://Modelica.Utilities.Files.loadResource\">Modelica.Utilities.Files.loadResource</a>
     via inheritance.</li>

<li> <a href=\"modelica://ModelicaServices.Machine\">Machine</a>
     provides a package of machine constants. It is used in
<a href=\"modelica://Modelica.Constants\">Modelica.Constants</a>.</li>

<li> <a href=\"modelica://ModelicaServices.System.exit\">System.exit</a> provides a function to terminate the execution of the Modelica environment. It is used in <a href=\"modelica://Modelica.Utilities.System.exit\">Modelica.Utilities.System.exit</a> via inheritance.</li>

<li> <a href=\"modelica://ModelicaServices.Types.SolverMethod\">Types.SolverMethod</a>
     provides a string defining the integration method to solve differential equations in
     a clocked discretized continuous-time partition (see Modelica 3.3 language specification).
     It is not yet used in the Modelica Standard Library, but in the Modelica_Synchronous library
     that provides convenience blocks for the clock operators of Modelica version &ge; 3.3.</li>
</ul>

<p>
This is the default implementation, if no tool-specific implementation is available.
This ModelicaServices package provides only \"dummy\" models that do nothing.
</p>

<p>
<strong>Licensed by the Modelica Association under the 3-Clause BSD License</strong><br>
Copyright &copy; 2009-2019, Modelica Association and contributors
</p>

<p>
<em>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the 3-Clause BSD license. For license conditions (including the disclaimer of warranty) visit <a href=\"https://modelica.org/licenses/modelica-3-clause-bsd\">https://modelica.org/licenses/modelica-3-clause-bsd</a>.</em>
</p>

</html>")); 
end ModelicaServices;

package Modelica  "Modelica Standard Library - Version 3.2.3" 
  extends Modelica.Icons.Package;

  package Blocks  "Library of basic input/output control blocks (continuous, discrete, logical, table blocks)" 
    import SI = Modelica.SIunits;
    extends Modelica.Icons.Package;

    package Interfaces  "Library of connectors and partial models for input/output blocks" 
      import Modelica.SIunits;
      extends Modelica.Icons.InterfacesPackage;
      connector RealOutput = output Real "'output Real' as connector" annotation(defaultComponentName = "y", Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100.0, -100.0}, {100.0, 100.0}}), graphics = {Polygon(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-100.0, 100.0}, {100.0, 0.0}, {-100.0, -100.0}})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100.0, -100.0}, {100.0, 100.0}}), graphics = {Polygon(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-100.0, 50.0}, {0.0, 0.0}, {-100.0, -50.0}}), Text(lineColor = {0, 0, 127}, extent = {{30.0, 60.0}, {30.0, 110.0}}, textString = "%name")}), Documentation(info = "<html>
      <p>
      Connector with one output signal of type Real.
      </p>
      </html>"));

      partial block SO  "Single Output continuous control block" 
        extends Modelica.Blocks.Icons.Block;
        RealOutput y "Connector of Real output signal" annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
        annotation(Documentation(info = "<html>
      <p>
      Block has one continuous Real output signal.
      </p>
      </html>")); 
      end SO;

      partial block SignalSource  "Base class for continuous signal source" 
        extends SO;
        parameter Real offset = 0 "Offset of output signal y";
        parameter SIunits.Time startTime = 0 "Output y = offset for time < startTime";
        annotation(Documentation(info = "<html>
      <p>
      Basic block for Real sources of package Blocks.Sources.
      This component has one continuous Real output signal y
      and two parameters (offset, startTime) to shift the
      generated signal.
      </p>
      </html>")); 
      end SignalSource;
      annotation(Documentation(info = "<html>
    <p>
    This package contains interface definitions for
    <strong>continuous</strong> input/output blocks with Real,
    Integer and Boolean signals. Furthermore, it contains
    partial models for continuous and discrete blocks.
    </p>

    </html>", revisions = "<html>
    <ul>
    <li><em>Oct. 21, 2002</em>
           by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
           and Christian Schweiger:<br>
           Added several new interfaces.</li>
    <li><em>Oct. 24, 1999</em>
           by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
           RealInputSignal renamed to RealInput. RealOutputSignal renamed to
           output RealOutput. GraphBlock renamed to BlockIcon. SISOreal renamed to
           SISO. SOreal renamed to SO. I2SOreal renamed to M2SO.
           SignalGenerator renamed to SignalSource. Introduced the following
           new models: MIMO, MIMOs, SVcontrol, MVcontrol, DiscreteBlockIcon,
           DiscreteBlock, DiscreteSISO, DiscreteMIMO, DiscreteMIMOs,
           BooleanBlockIcon, BooleanSISO, BooleanSignalSource, MI2BooleanMOs.</li>
    <li><em>June 30, 1999</em>
           by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
           Realized a first version, based on an existing Dymola library
           of Dieter Moormann and Hilding Elmqvist.</li>
    </ul>
    </html>")); 
    end Interfaces;

    package Sources  "Library of signal source blocks generating Real, Integer and Boolean signals" 
      import Modelica.Blocks.Interfaces;
      import Modelica.SIunits;
      extends Modelica.Icons.SourcesPackage;

      block Sine  "Generate sine signal" 
        import Modelica.Constants.pi;
        parameter Real amplitude = 1 "Amplitude of sine wave" annotation(Dialog(groupImage = "modelica://Modelica/Resources/Images/Blocks/Sources/Sine.png"));
        parameter SIunits.Frequency freqHz(start = 1) "Frequency of sine wave";
        parameter SIunits.Angle phase = 0 "Phase of sine wave";
        extends Interfaces.SignalSource;
      equation
        y = offset + (if time < startTime then 0 else amplitude * Modelica.Math.sin(2 * pi * freqHz * (time - startTime) + phase));
        annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-80, 68}, {-80, -80}}, color = {192, 192, 192}), Polygon(points = {{-80, 90}, {-88, 68}, {-72, 68}, {-80, 90}}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Line(points = {{-90, 0}, {68, 0}}, color = {192, 192, 192}), Polygon(points = {{90, 0}, {68, 8}, {68, -8}, {90, 0}}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Line(points = {{-80, 0}, {-68.7, 34.2}, {-61.5, 53.1}, {-55.1, 66.4}, {-49.4, 74.6}, {-43.8, 79.1}, {-38.2, 79.8}, {-32.6, 76.6}, {-26.9, 69.7}, {-21.3, 59.4}, {-14.9, 44.1}, {-6.83, 21.2}, {10.1, -30.8}, {17.3, -50.2}, {23.7, -64.2}, {29.3, -73.1}, {35, -78.4}, {40.6, -80}, {46.2, -77.6}, {51.9, -71.5}, {57.5, -61.9}, {63.9, -47.2}, {72, -24.8}, {80, 0}}, smooth = Smooth.Bezier), Text(extent = {{-147, -152}, {153, -112}}, textString = "freqHz=%freqHz")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-80, -90}, {-80, 84}}, color = {95, 95, 95}), Polygon(points = {{-80, 97}, {-84, 81}, {-76, 81}, {-80, 97}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Line(points = {{-99, -40}, {85, -40}}, color = {95, 95, 95}), Polygon(points = {{97, -40}, {81, -36}, {81, -45}, {97, -40}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Line(points = {{-41, -2}, {-31.6, 34.2}, {-26.1, 53.1}, {-21.3, 66.4}, {-17.1, 74.6}, {-12.9, 79.1}, {-8.64, 79.8}, {-4.42, 76.6}, {-0.201, 69.7}, {4.02, 59.4}, {8.84, 44.1}, {14.9, 21.2}, {27.5, -30.8}, {33, -50.2}, {37.8, -64.2}, {42, -73.1}, {46.2, -78.4}, {50.5, -80}, {54.7, -77.6}, {58.9, -71.5}, {63.1, -61.9}, {67.9, -47.2}, {74, -24.8}, {80, 0}}, color = {0, 0, 255}, thickness = 0.5, smooth = Smooth.Bezier), Line(points = {{-41, -2}, {-80, -2}}, color = {0, 0, 255}, thickness = 0.5), Text(extent = {{-87, 12}, {-40, 0}}, textString = "offset"), Line(points = {{-41, -2}, {-41, -40}}, color = {95, 95, 95}), Text(extent = {{-60, -43}, {-14, -54}}, textString = "startTime"), Text(extent = {{75, -47}, {100, -60}}, textString = "time"), Text(extent = {{-80, 99}, {-40, 82}}, textString = "y"), Line(points = {{-9, 80}, {43, 80}}, color = {95, 95, 95}), Line(points = {{-41, -2}, {50, -2}}, color = {95, 95, 95}), Polygon(points = {{33, 80}, {30, 67}, {36, 67}, {33, 80}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Text(extent = {{37, 57}, {83, 39}}, textString = "amplitude"), Polygon(points = {{33, -2}, {30, 11}, {36, 11}, {33, -2}, {33, -2}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Line(points = {{33, 80}, {33, -2}}, color = {95, 95, 95})}), Documentation(info = "<html>
      <p>
      The Real output y is a sine signal:
      </p>

      <p>
      <img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/Sine.png\"
           alt=\"Sine.png\">
      </p>
      </html>")); 
      end Sine;
      annotation(Documentation(info = "<html>
    <p>
    This package contains <strong>source</strong> components, i.e., blocks which
    have only output signals. These blocks are used as signal generators
    for Real, Integer and Boolean signals.
    </p>

    <p>
    All Real source signals (with the exception of the Constant source)
    have at least the following two parameters:
    </p>

    <table border=1 cellspacing=0 cellpadding=2>
      <tr><td><strong>offset</strong></td>
          <td>Value which is added to the signal</td>
      </tr>
      <tr><td><strong>startTime</strong></td>
          <td>Start time of signal. For time &lt; startTime,
                    the output y is set to offset.</td>
      </tr>
    </table>

    <p>
    The <strong>offset</strong> parameter is especially useful in order to shift
    the corresponding source, such that at initial time the system
    is stationary. To determine the corresponding value of offset,
    usually requires a trimming calculation.
    </p>
    </html>", revisions = "<html>
    <ul>
    <li><em>October 21, 2002</em>
           by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
           and Christian Schweiger:<br>
           Integer sources added. Step, TimeTable and BooleanStep slightly changed.</li>
    <li><em>Nov. 8, 1999</em>
           by <a href=\"mailto:christoph@clauss-it.com\">Christoph Clau&szlig;</a>,
           <a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>,
           <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
           New sources: Exponentials, TimeTable. Trapezoid slightly enhanced
           (nperiod=-1 is an infinite number of periods).</li>
    <li><em>Oct. 31, 1999</em>
           by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
           <a href=\"mailto:christoph@clauss-it.com\">Christoph Clau&szlig;</a>,
           <a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>,
           All sources vectorized. New sources: ExpSine, Trapezoid,
           BooleanConstant, BooleanStep, BooleanPulse, SampleTrigger.
           Improved documentation, especially detailed description of
           signals in diagram layer.</li>
    <li><em>June 29, 1999</em>
           by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
           Realized a first version, based on an existing Dymola library
           of Dieter Moormann and Hilding Elmqvist.</li>
    </ul>
    </html>")); 
    end Sources;

    package Icons  "Icons for Blocks" 
      extends Modelica.Icons.IconsPackage;

      partial block Block  "Basic graphical layout of input/output block"  annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-150, 150}, {150, 110}}, textString = "%name", lineColor = {0, 0, 255})}), Documentation(info = "<html>
      <p>
      Block that has only the basic icon for an input/output
      block (no declarations, no equations). Most blocks
      of package Modelica.Blocks inherit directly or indirectly
      from this block.
      </p>
      </html>")); end Block;
    end Icons;
    annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100.0, -100.0}, {100.0, 100.0}}), graphics = {Rectangle(origin = {0.0, 35.1488}, fillColor = {255, 255, 255}, extent = {{-30.0, -20.1488}, {30.0, 20.1488}}), Rectangle(origin = {0.0, -34.8512}, fillColor = {255, 255, 255}, extent = {{-30.0, -20.1488}, {30.0, 20.1488}}), Line(origin = {-51.25, 0.0}, points = {{21.25, -35.0}, {-13.75, -35.0}, {-13.75, 35.0}, {6.25, 35.0}}), Polygon(origin = {-40.0, 35.0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{10.0, 0.0}, {-5.0, 5.0}, {-5.0, -5.0}}), Line(origin = {51.25, 0.0}, points = {{-21.25, 35.0}, {13.75, 35.0}, {13.75, -35.0}, {-6.25, -35.0}}), Polygon(origin = {40.0, -35.0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-10.0, 0.0}, {5.0, 5.0}, {5.0, -5.0}})}), Documentation(info = "<html>
  <p>
  This library contains input/output blocks to build up block diagrams.
  </p>

  <dl>
  <dt><strong>Main Author:</strong></dt>
  <dd><a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a><br>
      Deutsches Zentrum f&uuml;r Luft und Raumfahrt e. V. (DLR)<br>
      Oberpfaffenhofen<br>
      Postfach 1116<br>
      D-82230 Wessling<br>
      email: <a href=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</a><br></dd>
  </dl>
  <p>
  Copyright &copy; 1998-2019, Modelica Association and contributors
  </p>
  </html>", revisions = "<html>
  <ul>
  <li><em>June 23, 2004</em>
         by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
         Introduced new block connectors and adapted all blocks to the new connectors.
         Included subpackages Continuous, Discrete, Logical, Nonlinear from
         package ModelicaAdditions.Blocks.
         Included subpackage ModelicaAdditions.Table in Modelica.Blocks.Sources
         and in the new package Modelica.Blocks.Tables.
         Added new blocks to Blocks.Sources and Blocks.Logical.
         </li>
  <li><em>October 21, 2002</em>
         by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
         and Christian Schweiger:<br>
         New subpackage Examples, additional components.
         </li>
  <li><em>June 20, 2000</em>
         by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a> and
         Michael Tiller:<br>
         Introduced a replaceable signal type into
         Blocks.Interfaces.RealInput/RealOutput:
  <pre>
     replaceable type SignalType = Real
  </pre>
         in order that the type of the signal of an input/output block
         can be changed to a physical type, for example:
  <pre>
     Sine sin1(outPort(redeclare type SignalType=Modelica.SIunits.Torque))
  </pre>
        </li>
  <li><em>Sept. 18, 1999</em>
         by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
         Renamed to Blocks. New subpackages Math, Nonlinear.
         Additional components in subpackages Interfaces, Continuous
         and Sources.</li>
  <li><em>June 30, 1999</em>
         by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
         Realized a first version, based on an existing Dymola library
         of Dieter Moormann and Hilding Elmqvist.</li>
  </ul>
  </html>")); 
  end Blocks;

  package Electrical  "Library of electrical models (analog, digital, machines, multi-phase)" 
    extends Modelica.Icons.Package;

    package Analog  "Library for analog electrical models" 
      import SI = Modelica.SIunits;
      extends Modelica.Icons.Package;

      package Basic  "Basic electrical components" 
        extends Modelica.Icons.Package;

        model Ground  "Ground node" 
          Interfaces.Pin p annotation(Placement(transformation(origin = {0, 100}, extent = {{10, -10}, {-10, 10}}, rotation = 270)));
        equation
          p.v = 0;
          annotation(Documentation(info = "<html>
        <p>Ground of an electrical circuit. The potential at the ground node is zero. Every electrical circuit has to contain at least one ground object.</p>
        </html>", revisions = "<html>
        <ul>
        <li><em> 1998   </em>
               by Christoph Clauss<br> initially implemented<br>
               </li>
        </ul>
        </html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-60, 50}, {60, 50}}, color = {0, 0, 255}), Line(points = {{-40, 30}, {40, 30}}, color = {0, 0, 255}), Line(points = {{-20, 10}, {20, 10}}, color = {0, 0, 255}), Line(points = {{0, 90}, {0, 50}}, color = {0, 0, 255}), Text(extent = {{-150, -10}, {150, -50}}, textString = "%name", lineColor = {0, 0, 255})})); 
        end Ground;

        model Resistor  "Ideal linear electrical resistor" 
          parameter SI.Resistance R(start = 1) "Resistance at temperature T_ref";
          parameter SI.Temperature T_ref = 300.15 "Reference temperature";
          parameter SI.LinearTemperatureCoefficient alpha = 0 "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";
          extends Modelica.Electrical.Analog.Interfaces.OnePort;
          extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = T_ref);
          SI.Resistance R_actual "Actual resistance = R*(1 + alpha*(T_heatPort - T_ref))";
        equation
          assert(1 + alpha * (T_heatPort - T_ref) >= Modelica.Constants.eps, "Temperature outside scope of model!");
          R_actual = R * (1 + alpha * (T_heatPort - T_ref));
          v = R_actual * i;
          LossPower = v * i;
          annotation(Documentation(info = "<html>
        <p>The linear resistor connects the branch voltage <em>v</em> with the branch current <em>i</em> by <em>i*R = v</em>. The Resistance <em>R</em> is allowed to be positive, zero, or negative.</p>
        </html>", revisions = "<html>
        <ul>
        <li><em> August 07, 2009   </em>
               by Anton Haumer<br> temperature dependency of resistance added<br>
               </li>
        <li><em> March 11, 2009   </em>
               by Christoph Clauss<br> conditional heat port added<br>
               </li>
        <li><em> 1998   </em>
               by Christoph Clauss<br> initially implemented<br>
               </li>
        </ul>
        </html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-70, 30}, {70, -30}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-90, 0}, {-70, 0}}, color = {0, 0, 255}), Line(points = {{70, 0}, {90, 0}}, color = {0, 0, 255}), Text(extent = {{-150, -40}, {150, -80}}, textString = "R=%R"), Line(visible = useHeatPort, points = {{0, -100}, {0, -30}}, color = {127, 0, 0}, pattern = LinePattern.Dot), Text(extent = {{-150, 90}, {150, 50}}, textString = "%name", lineColor = {0, 0, 255})})); 
        end Resistor;

        model Inductor  "Ideal linear electrical inductor" 
          extends Interfaces.OnePort(i(start = 0));
          parameter SI.Inductance L(start = 1) "Inductance";
        equation
          L * der(i) = v;
          annotation(Documentation(info = "<html>
        <p>The linear inductor connects the branch voltage <em>v</em> with the branch current <em>i</em> by <em>v = L * di/dt</em>. The Inductance <em>L</em> is allowed to be positive, or zero.</p>

        </html>", revisions = "<html>
        <ul>
        <li><em> 1998   </em>
               by Christoph Clauss<br> initially implemented<br>
               </li>
        </ul>
        </html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{60, 0}, {90, 0}}, color = {0, 0, 255}), Line(points = {{-90, 0}, {-60, 0}}, color = {0, 0, 255}), Text(extent = {{-150, -40}, {150, -80}}, textString = "L=%L"), Line(points = {{-60, 0}, {-59, 6}, {-52, 14}, {-38, 14}, {-31, 6}, {-30, 0}}, color = {0, 0, 255}, smooth = Smooth.Bezier), Line(points = {{-30, 0}, {-29, 6}, {-22, 14}, {-8, 14}, {-1, 6}, {0, 0}}, color = {0, 0, 255}, smooth = Smooth.Bezier), Line(points = {{0, 0}, {1, 6}, {8, 14}, {22, 14}, {29, 6}, {30, 0}}, color = {0, 0, 255}, smooth = Smooth.Bezier), Line(points = {{30, 0}, {31, 6}, {38, 14}, {52, 14}, {59, 6}, {60, 0}}, color = {0, 0, 255}, smooth = Smooth.Bezier), Text(extent = {{-150, 90}, {150, 50}}, textString = "%name", lineColor = {0, 0, 255})})); 
        end Inductor;
        annotation(Documentation(info = "<html>
      <p>This package contains very basic analog electrical components such as resistor, conductor, capacitor, inductor, and the ground (which is needed in each electrical circuit description. Furthermore, controlled sources, coupling components, and some improved (but nevertheless basic) are in this package.</p>
      </html>", revisions = "<html>
      <dl>
      <dt>
      <strong>Main Authors:</strong>
      </dt>
      <dd>
      Christoph Clau&szlig;
          &lt;<a href=\"mailto:christoph@clauss-it.com\">christoph@clauss-it.com</a>&gt;<br>
          Andr&eacute; Schneider
          &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
          Fraunhofer Institute for Integrated Circuits<br>
          Design Automation Department<br>
          Zeunerstra&szlig;e 38<br>
          D-01069 Dresden<br>
      </dd>
      </dl>

      <p>
      Copyright &copy; 1998-2019, Modelica Association and contributors
      </p>
      </html>"), Icon(graphics = {Line(points = {{-12, 60}, {-12, -60}}), Line(points = {{-80, 0}, {-12, 0}}), Line(points = {{12, 60}, {12, -60}}), Line(points = {{12, 0}, {80, 0}})})); 
      end Basic;

      package Interfaces  "Connectors and partial models for Analog electrical components" 
        extends Modelica.Icons.InterfacesPackage;

        connector Pin  "Pin of an electrical component" 
          SI.ElectricPotential v "Potential at the pin" annotation(unassignedMessage = "An electrical potential cannot be uniquely calculated.
        The reason could be that
        - a ground object is missing (Modelica.Electrical.Analog.Basic.Ground)
          to define the zero potential of the electrical circuit, or
        - a connector of an electrical component is not connected.");
          flow SI.Current i "Current flowing into the pin" annotation(unassignedMessage = "An electrical current cannot be uniquely calculated.
        The reason could be that
        - a ground object is missing (Modelica.Electrical.Analog.Basic.Ground)
          to define the zero potential of the electrical circuit, or
        - a connector of an electrical component is not connected.");
          annotation(defaultComponentName = "pin", Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-160, 110}, {40, 50}}, lineColor = {0, 0, 255}, textString = "%name")}), Documentation(revisions = "<html>
        <ul>
        <li><em> 1998   </em>
               by Christoph Clauss<br> initially implemented<br>
               </li>
        </ul>
        </html>", info = "<html>
        <p>Pin is the basic electric connector. It includes the voltage which consists between the pin and the ground node. The ground node is the node of (any) ground device (Modelica.Electrical.Basic.Ground). Furthermore, the pin includes the current, which is considered to be <strong>positive</strong> if it is flowing at the pin <strong>into the device</strong>.</p>
        </html>")); 
        end Pin;

        connector PositivePin  "Positive pin of an electrical component" 
          SI.ElectricPotential v "Potential at the pin" annotation(unassignedMessage = "An electrical potential cannot be uniquely calculated.
        The reason could be that
        - a ground object is missing (Modelica.Electrical.Analog.Basic.Ground)
          to define the zero potential of the electrical circuit, or
        - a connector of an electrical component is not connected.");
          flow SI.Current i "Current flowing into the pin" annotation(unassignedMessage = "An electrical current cannot be uniquely calculated.
        The reason could be that
        - a ground object is missing (Modelica.Electrical.Analog.Basic.Ground)
          to define the zero potential of the electrical circuit, or
        - a connector of an electrical component is not connected.");
          annotation(defaultComponentName = "pin_p", Documentation(info = "<html>
        <p>Connectors PositivePin and NegativePin are nearly identical. The only difference is that the icons are different in order to identify more easily the pins of a component. Usually, connector PositivePin is used for the positive and connector NegativePin for the negative pin of an electrical component.</p>
        </html>", revisions = "<html>
        <ul>
        <li><em> 1998   </em>
               by Christoph Clauss<br> initially implemented<br>
               </li>
        </ul>
        </html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-160, 110}, {40, 50}}, lineColor = {0, 0, 255}, textString = "%name")})); 
        end PositivePin;

        connector NegativePin  "Negative pin of an electrical component" 
          SI.ElectricPotential v "Potential at the pin" annotation(unassignedMessage = "An electrical potential cannot be uniquely calculated.
        The reason could be that
        - a ground object is missing (Modelica.Electrical.Analog.Basic.Ground)
          to define the zero potential of the electrical circuit, or
        - a connector of an electrical component is not connected.");
          flow SI.Current i "Current flowing into the pin" annotation(unassignedMessage = "An electrical current cannot be uniquely calculated.
        The reason could be that
        - a ground object is missing (Modelica.Electrical.Analog.Basic.Ground)
          to define the zero potential of the electrical circuit, or
        - a connector of an electrical component is not connected.");
          annotation(defaultComponentName = "pin_n", Documentation(info = "<html>
        <p>Connectors PositivePin and NegativePin are nearly identical. The only difference is that the icons are different in order to identify more easily the pins of a component. Usually, connector PositivePin is used for the positive and connector NegativePin for the negative pin of an electrical component.</p>
        </html>", revisions = "<html>
        <dl>
        <dt><em>1998</em></dt>
        <dd>by Christoph Clauss initially implemented
        </dd>
        </dl>
        </html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-40, 110}, {160, 50}}, textString = "%name", lineColor = {0, 0, 255})})); 
        end NegativePin;

        partial model OnePort  "Component with two electrical pins p and n and current i from p to n" 
          SI.Voltage v "Voltage drop of the two pins (= p.v - n.v)";
          SI.Current i "Current flowing from pin p to pin n";
          PositivePin p "Positive electrical pin" annotation(Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
          NegativePin n "Negative electrical pin" annotation(Placement(transformation(extent = {{110, -10}, {90, 10}})));
        equation
          v = p.v - n.v;
          0 = p.i + n.i;
          i = p.i;
          annotation(Documentation(info = "<html>
        <p>Superclass of elements which have <strong>two</strong> electrical pins: the positive pin connector <em>p</em>, and the negative pin connector <em>n</em>. It is assumed that the current flowing into pin p is identical to the current flowing out of pin n. This current is provided explicitly as current i.</p>
        </html>", revisions = "<html>
        <ul>
        <li><em> 1998   </em>
               by Christoph Clauss<br> initially implemented<br>
               </li>
        </ul>
        </html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-110, 20}, {-85, 20}}, color = {160, 160, 164}), Polygon(points = {{-95, 23}, {-85, 20}, {-95, 17}, {-95, 23}}, lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid), Line(points = {{90, 20}, {115, 20}}, color = {160, 160, 164}), Line(points = {{-125, 0}, {-115, 0}}, color = {160, 160, 164}), Line(points = {{-120, -5}, {-120, 5}}, color = {160, 160, 164}), Text(extent = {{-110, 25}, {-90, 45}}, lineColor = {160, 160, 164}, textString = "i"), Polygon(points = {{105, 23}, {115, 20}, {105, 17}, {105, 23}}, lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid), Line(points = {{115, 0}, {125, 0}}, color = {160, 160, 164}), Text(extent = {{90, 45}, {110, 25}}, lineColor = {160, 160, 164}, textString = "i")})); 
        end OnePort;

        partial model ConditionalHeatPort  "Partial model to include a conditional HeatPort in order to describe the power loss via a thermal network" 
          parameter Boolean useHeatPort = false "=true, if heatPort is enabled" annotation(Evaluate = true, HideResult = true, choices(checkBox = true));
          parameter SI.Temperature T = 293.15 "Fixed device temperature if useHeatPort = false" annotation(Dialog(enable = not useHeatPort));
          Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort(final T = T_heatPort, final Q_flow = -LossPower) if useHeatPort "Conditional heat port" annotation(Placement(transformation(extent = {{-10, -110}, {10, -90}}), iconTransformation(extent = {{-10, -110}, {10, -90}})));
          SI.Power LossPower "Loss power leaving component via heatPort";
          SI.Temperature T_heatPort "Temperature of heatPort";
        equation
          if not useHeatPort then
            T_heatPort = T;
          end if;
          annotation(Documentation(revisions = "<html>
        <ul>
        <li><em>February 17, 2009</em>
               by Christoph Clauss<br> initially implemented<br>
               </li>
        </ul>
        </html>", info = "<html>
        <p>
        This partial model provides a conditional heating port for the connection to a thermal network.
        </p>
        <ul>
        <li> If <strong>useHeatPort</strong> is set to <strong>false</strong> (default), no heat port is available, and the thermal
             loss power flows internally to the ground. In this case, the parameter <strong>T</strong> specifies
             the fixed device temperature (the default for T = 20<sup>o</sup>C).</li>
        <li> If <strong>useHeatPort</strong> is set to <strong>true</strong>, a heat port is available.</li>
        </ul>

        <p>
        If this model is used, the loss power has to be provided by an equation in the model which inherits from
        ConditionalHeatingPort model (<strong>lossPower = ...</strong>). As device temperature
        <strong>T_heatPort</strong> can be used to describe the influence of the device temperature
        on the model behaviour.
        </p>
        </html>")); 
        end ConditionalHeatPort;

        partial model VoltageSource  "Interface for voltage sources" 
          extends OnePort;
          parameter SI.Voltage offset = 0 "Voltage offset";
          parameter SI.Time startTime = 0 "Time offset";
          replaceable Modelica.Blocks.Interfaces.SignalSource signalSource(final offset = offset, final startTime = startTime) annotation(Placement(transformation(extent = {{70, 70}, {90, 90}})));
        equation
          v = signalSource.y;
          annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-150, 60}, {150, 100}}, textString = "%name", lineColor = {0, 0, 255}), Line(points = {{-90, 0}, {90, 0}}, color = {0, 0, 255}), Line(points = {{-80, 20}, {-60, 20}}, color = {0, 0, 255}), Line(points = {{-70, 30}, {-70, 10}}, color = {0, 0, 255}), Line(points = {{60, 20}, {80, 20}}, color = {0, 0, 255})}), Documentation(revisions = "<html>
        <ul>
        <li><em> 1998   </em>
               by Christoph Clauss<br> initially implemented<br>
               </li>
        </ul>
        </html>", info = "<html>
        <p>The VoltageSource partial model prepares voltage sources by providing the pins, and the offset and startTime parameters, which are the same at all voltage sources. The source behavior is taken from Modelica.Blocks signal sources by inheritance and usage of the replaceable possibilities.</p>
        </html>")); 
        end VoltageSource;
        annotation(Documentation(info = "<html>
      <p>This package contains connectors and interfaces (partial models) for analog electrical components. The partial models contain typical combinations of pins, and internal variables which are often used. Furthermore, the thermal heat port is in this package which can be included by inheritance.</p>
      </html>", revisions = "<html>
      <dl>
      <dt>
      <strong>Main Authors:</strong>
      </dt>
      <dd>
      Christoph Clau&szlig;
          &lt;<a href=\"mailto:christoph@clauss-it.com\">christoph@clauss-it.com</a>&gt;<br>
          Andr&eacute; Schneider
          &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
          Fraunhofer Institute for Integrated Circuits<br>
          Design Automation Department<br>
          Zeunerstra&szlig;e 38<br>
          D-01069 Dresden
      </dd>
      </dl>

      <ul>
      <li><em> 1998</em>
             by Christoph Clauss<br> initially implemented<br>
             </li>
      </ul>

      <p>
      Copyright &copy; 1998-2019, Modelica Association and contributors
      </p>
      </html>")); 
      end Interfaces;

      package Sources  "Time-dependent and controlled voltage and current sources" 
        extends Modelica.Icons.SourcesPackage;

        model SineVoltage  "Sine voltage source" 
          parameter SI.Voltage V(start = 1) "Amplitude of sine wave";
          parameter SI.Angle phase = 0 "Phase of sine wave";
          parameter SI.Frequency freqHz(start = 1) "Frequency of sine wave";
          extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.Sine signalSource(final amplitude = V, final freqHz = freqHz, final phase = phase));
          annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-66, 0}, {-56.2, 29.9}, {-49.8, 46.5}, {-44.2, 58.1}, {-39.3, 65.2}, {-34.3, 69.2}, {-29.4, 69.8}, {-24.5, 67}, {-19.6, 61}, {-14.6, 52}, {-9, 38.6}, {-1.98, 18.6}, {12.79, -26.9}, {19.1, -44}, {24.8, -56.2}, {29.7, -64}, {34.6, -68.6}, {39.5, -70}, {44.5, -67.9}, {49.4, -62.5}, {54.3, -54.1}, {59.9, -41.3}, {67, -21.7}, {74, 0}}, color = {192, 192, 192})}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-80, -90}, {-80, 84}}, color = {192, 192, 192}), Polygon(points = {{-80, 100}, {-86, 84}, {-74, 84}, {-80, 100}}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Line(points = {{-99, -40}, {100, -40}}, color = {192, 192, 192}), Polygon(points = {{100, -40}, {84, -34}, {84, -46}, {100, -40}}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Line(points = {{-41, -2}, {-32.6, 32.2}, {-27.1, 51.1}, {-22.3, 64.4}, {-18.1, 72.6}, {-13.9, 77.1}, {-8, 78}, {-5.42, 74.6}, {-1.201, 67.7}, {3.02, 57.4}, {7.84, 42.1}, {13.9, 19.2}, {26.5, -32.8}, {32, -52.2}, {36.8, -66.2}, {41, -75.1}, {45.2, -80.4}, {49.5, -82}, {53.7, -79.6}, {57.9, -73.5}, {62.1, -63.9}, {66.9, -49.2}, {73, -26.8}, {79, -2}}, thickness = 0.5), Line(points = {{-41, -2}, {-80, -2}}, thickness = 0.5), Text(extent = {{-106, -11}, {-60, -29}}, lineColor = {160, 160, 164}, textString = "offset"), Line(points = {{-41, -2}, {-41, -40}}, color = {192, 192, 192}, pattern = LinePattern.Dash), Text(extent = {{-60, -43}, {-14, -61}}, lineColor = {160, 160, 164}, textString = "startTime"), Text(extent = {{76, -52}, {100, -72}}, lineColor = {160, 160, 164}, textString = "time"), Line(points = {{-8, 78}, {45, 78}}, color = {192, 192, 192}, pattern = LinePattern.Dash), Line(points = {{-41, -2}, {52, -2}}, color = {192, 192, 192}, pattern = LinePattern.Dash), Polygon(points = {{33, 78}, {30, 65}, {37, 65}, {33, 78}}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Text(extent = {{37, 57}, {83, 39}}, lineColor = {160, 160, 164}, textString = "V"), Polygon(points = {{33, -2}, {30, 11}, {36, 11}, {33, -2}, {33, -2}}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Line(points = {{33, 78}, {33, -2}}, color = {192, 192, 192}), Text(extent = {{-69, 109}, {-4, 83}}, lineColor = {160, 160, 164}, textString = "v = p.v - n.v")}), Documentation(revisions = "<html>
        <ul>
        <li><em> 1998   </em>
               by Christoph Clauss<br> initially implemented<br>
               </li>
        </ul>
        </html>", info = "<html>
        <p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
        </html>")); 
        end SineVoltage;
        annotation(Documentation(info = "<html>
      <p>This package contains time-dependent and controlled voltage and current sources. Most of the sources use the behavior modeled in the Modelica.Blocks.Sources package. All sources are ideal in the sense that <strong>no</strong> internal resistances are included.</p>
      </html>", revisions = "<html>
      <dl>
      <dt>
      <strong>Main Authors:</strong>
      </dt>
      <dd>
      Christoph Clau&szlig;
          &lt;<a href=\"mailto:christoph@clauss-it.com\">christoph@clauss-it.com</a>&gt;<br>
          Andr&eacute; Schneider
          &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
          Fraunhofer Institute for Integrated Circuits<br>
          Design Automation Department<br>
          Zeunerstra&szlig;e 38<br>
          D-01069 Dresden
      </dd>
      </dl>

      <p>
      Copyright &copy; 1998-2019, Modelica Association and contributors
      </p>
      </html>")); 
      end Sources;
      annotation(Documentation(info = "<html>
    <p>
    This package contains packages for analog electrical components:</p>
    <ul>
    <li>Basic: basic components (resistor, capacitor, conductor, inductor, transformer, gyrator)</li>
    <li>Semiconductors: semiconductor devices (diode, bipolar and MOS transistors)</li>
    <li>Lines: transmission lines (lossy and lossless)</li>
    <li>Ideal: ideal elements (switches, diode, transformer, idle, short, ...)</li>
    <li>Sources: time-dependent and controlled voltage and current sources</li>
    <li>Sensors: sensors to measure potential, voltage, and current</li>
    </ul>
    <dl>
    <dt>
    <strong>Main Authors:</strong>
    </dt>
    <dd>
    Christoph Clau&szlig;
        &lt;<a href=\"mailto:christoph@clauss-it.com\">christoph@clauss-it.com</a>&gt;<br>
        Andr&eacute; Schneider
        &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
        Fraunhofer Institute for Integrated Circuits<br>
        Design Automation Department<br>
        Zeunerstra&szlig;e 38<br>
        D-01069 Dresden, Germany
    </dd>
    </dl>
    </html>"), Icon(graphics = {Line(points = {{12, 60}, {12, -60}}), Line(points = {{-12, 60}, {-12, -60}}), Line(points = {{-80, 0}, {-12, 0}}), Line(points = {{12, 0}, {80, 0}})})); 
    end Analog;
    annotation(Documentation(info = "<html>
  <p>
  This library contains electrical components to build up analog and digital circuits,
  as well as machines to model electrical motors and generators,
  especially three phase induction machines such as an asynchronous motor.
  </p>

  </html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100.0, -100.0}, {100.0, 100.0}}), graphics = {Rectangle(origin = {20.3125, 82.8571}, extent = {{-45.3125, -57.8571}, {4.6875, -27.8571}}), Line(origin = {8.0, 48.0}, points = {{32.0, -58.0}, {72.0, -58.0}}), Line(origin = {9.0, 54.0}, points = {{31.0, -49.0}, {71.0, -49.0}}), Line(origin = {-2.0, 55.0}, points = {{-83.0, -50.0}, {-33.0, -50.0}}), Line(origin = {-3.0, 45.0}, points = {{-72.0, -55.0}, {-42.0, -55.0}}), Line(origin = {1.0, 50.0}, points = {{-61.0, -45.0}, {-61.0, -10.0}, {-26.0, -10.0}}), Line(origin = {7.0, 50.0}, points = {{18.0, -10.0}, {53.0, -10.0}, {53.0, -45.0}}), Line(origin = {6.2593, 48.0}, points = {{53.7407, -58.0}, {53.7407, -93.0}, {-66.2593, -93.0}, {-66.2593, -58.0}})})); 
  end Electrical;

  package Thermal  "Library of thermal system components to model heat transfer and simple thermo-fluid pipe flow" 
    extends Modelica.Icons.Package;

    package HeatTransfer  "Library of 1-dimensional heat transfer with lumped elements" 
      extends Modelica.Icons.Package;

      package Interfaces  "Connectors and partial models" 
        extends Modelica.Icons.InterfacesPackage;

        partial connector HeatPort  "Thermal port for 1-dim. heat transfer" 
          Modelica.SIunits.Temperature T "Port temperature";
          flow Modelica.SIunits.HeatFlowRate Q_flow "Heat flow rate (positive if flowing from outside into the component)";
          annotation(Documentation(info = "<html>

        </html>")); 
        end HeatPort;

        connector HeatPort_a  "Thermal port for 1-dim. heat transfer (filled rectangular icon)" 
          extends HeatPort;
          annotation(defaultComponentName = "port_a", Documentation(info = "<html>
        <p>This connector is used for 1-dimensional heat flow between components.
        The variables in the connector are:</p>
        <pre>
           T       Temperature in [Kelvin].
           Q_flow  Heat flow rate in [Watt].
        </pre>
        <p>According to the Modelica sign convention, a <strong>positive</strong> heat flow
        rate <strong>Q_flow</strong> is considered to flow <strong>into</strong> a component. This
        convention has to be used whenever this connector is used in a model
        class.</p>
        <p>Note, that the two connector classes <strong>HeatPort_a</strong> and
        <strong>HeatPort_b</strong> are identical with the only exception of the different
        <strong>icon layout</strong>.</p></html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {191, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-50, 50}, {50, -50}}, lineColor = {191, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid), Text(extent = {{-120, 120}, {100, 60}}, lineColor = {191, 0, 0}, textString = "%name")})); 
        end HeatPort_a;
        annotation(Documentation(info = "<html>

      </html>")); 
      end Interfaces;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(origin = {13.758, 27.517}, lineColor = {128, 128, 128}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{-54, -6}, {-61, -7}, {-75, -15}, {-79, -24}, {-80, -34}, {-78, -42}, {-73, -49}, {-64, -51}, {-57, -51}, {-47, -50}, {-41, -43}, {-38, -35}, {-40, -27}, {-40, -20}, {-42, -13}, {-47, -7}, {-54, -5}, {-54, -6}}), Polygon(origin = {13.758, 27.517}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid, points = {{-75, -15}, {-79, -25}, {-80, -34}, {-78, -42}, {-72, -49}, {-64, -51}, {-57, -51}, {-47, -50}, {-57, -47}, {-65, -45}, {-71, -40}, {-74, -33}, {-76, -23}, {-75, -15}, {-75, -15}}), Polygon(origin = {13.758, 27.517}, lineColor = {160, 160, 164}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{39, -6}, {32, -7}, {18, -15}, {14, -24}, {13, -34}, {15, -42}, {20, -49}, {29, -51}, {36, -51}, {46, -50}, {52, -43}, {55, -35}, {53, -27}, {53, -20}, {51, -13}, {46, -7}, {39, -5}, {39, -6}}), Polygon(origin = {13.758, 27.517}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid, points = {{18, -15}, {14, -25}, {13, -34}, {15, -42}, {21, -49}, {29, -51}, {36, -51}, {46, -50}, {36, -47}, {28, -45}, {22, -40}, {19, -33}, {17, -23}, {18, -15}, {18, -15}}), Polygon(origin = {13.758, 27.517}, lineColor = {191, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid, points = {{-9, -23}, {-9, -10}, {18, -17}, {-9, -23}}), Line(origin = {13.758, 27.517}, points = {{-41, -17}, {-9, -17}}, color = {191, 0, 0}, thickness = 0.5), Line(origin = {13.758, 27.517}, points = {{-17, -40}, {15, -40}}, color = {191, 0, 0}, thickness = 0.5), Polygon(origin = {13.758, 27.517}, lineColor = {191, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid, points = {{-17, -46}, {-17, -34}, {-40, -40}, {-17, -46}})}), Documentation(info = "<html>
    <p>
    This package contains components to model <strong>1-dimensional heat transfer</strong>
    with lumped elements. This allows especially to model heat transfer in
    machines provided the parameters of the lumped elements, such as
    the heat capacity of a part, can be determined by measurements
    (due to the complex geometries and many materials used in machines,
    calculating the lumped element parameters from some basic analytic
    formulas is usually not possible).
    </p>
    <p>
    Example models how to use this library are given in subpackage <strong>Examples</strong>.<br>
    For a first simple example, see <strong>Examples.TwoMasses</strong> where two masses
    with different initial temperatures are getting in contact to each
    other and arriving after some time at a common temperature.<br>
    <strong>Examples.ControlledTemperature</strong> shows how to hold a temperature
    within desired limits by switching on and off an electric resistor.<br>
    A more realistic example is provided in <strong>Examples.Motor</strong> where the
    heating of an electrical motor is modelled, see the following screen shot
    of this example:
    </p>

    <p>
    <img src=\"modelica://Modelica/Resources/Images/Thermal/HeatTransfer/driveWithHeatTransfer.png\" alt=\"driveWithHeatTransfer\">
    </p>

    <p>
    The <strong>filled</strong> and <strong>non-filled red squares</strong> at the left and
    right side of a component represent <strong>thermal ports</strong> (connector HeatPort).
    Drawing a line between such squares means that they are thermally connected.
    The variables of a HeatPort connector are the temperature <strong>T</strong> at the port
    and the heat flow rate <strong>Q_flow</strong> flowing into the component (if Q_flow is positive,
    the heat flows into the element, otherwise it flows out of the element):
    </p>
    <pre>   Modelica.SIunits.Temperature  T  \"absolute temperature at port in Kelvin\";
       Modelica.SIunits.HeatFlowRate Q_flow  \"flow rate at the port in Watt\";
    </pre>
    <p>
    Note, that all temperatures of this package, including initial conditions,
    are given in Kelvin. For convenience, in subpackages <strong>HeatTransfer.Celsius</strong>,
     <strong>HeatTransfer.Fahrenheit</strong> and <strong>HeatTransfer.Rankine</strong> components are provided such that source and
    sensor information is available in degree Celsius, degree Fahrenheit, or degree Rankine,
    respectively. Additionally, in package <strong>SIunits.Conversions</strong> conversion
    functions between the units Kelvin and Celsius, Fahrenheit, Rankine are
    provided. These functions may be used in the following way:
    </p>
    <pre>  <strong>import</strong> SI=Modelica.SIunits;
      <strong>import</strong> Modelica.SIunits.Conversions.*;
         ...
      <strong>parameter</strong> SI.Temperature T = from_degC(25);  // convert 25 degree Celsius to Kelvin
    </pre>

    <p>
    There are several other components available, such as AxialConduction (discretized PDE in
    axial direction), which have been temporarily removed from this library. The reason is that
    these components reference material properties, such as thermal conductivity, and currently
    the Modelica design group is discussing a general scheme to describe material properties.
    </p>
    <p>
    For technical details in the design of this library, see the following reference:<br>
    <strong>Michael Tiller (2001)</strong>: <a href=\"http://www.amazon.de\">
    Introduction to Physical Modeling with Modelica</a>.
    Kluwer Academic Publishers Boston.
    </p>
    <p>
    <strong>Acknowledgements:</strong><br>
    Several helpful remarks from the following persons are acknowledged:
    John Batteh, Ford Motors, Dearborn, U.S.A;
    <a href=\"https://www.haumer.at/\">Anton Haumer</a>, Technical Consulting &amp; Electrical Engineering, Germany;
    Ludwig Marvan, VA TECH ELIN EBG Elektronik GmbH, Wien, Austria;
    Hans Olsson, Dassault Syst&egrave;mes AB, Sweden;
    Hubertus Tummescheit, Lund Institute of Technology, Lund, Sweden.
    </p>
    <dl>
      <dt><strong>Main Authors:</strong></dt>
      <dd>
      <p>
      <a href=\"https://www.haumer.at/\">Anton Haumer</a><br>
      Technical Consulting &amp; Electrical Engineering<br>
      D-93049 Regensburg, Germany<br>
      email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
    </p>
      </dd>
    </dl>
    <p>
    Copyright &copy; 2001-2019, Modelica Association and contributors
    </p>
    </html>", revisions = "<html>
    <ul>
    <li><em>July 15, 2002</em>
           by Michael Tiller, <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
           and Nikolaus Sch&uuml;rmann:<br>
           Implemented.
    </li>
    <li><em>June 13, 2005</em>
           by <a href=\"https://www.haumer.at/\">Anton Haumer</a><br>
           Refined placing of connectors (cosmetic).<br>
           Refined all Examples; removed Examples.FrequencyInverter, introducing Examples.Motor<br>
           Introduced temperature dependent correction (1 + alpha*(T - T_ref)) in Fixed/PrescribedHeatFlow<br>
    </li>
      <li> v1.1.1 2007/11/13 Anton Haumer<br>
           components moved to sub-packages</li>
      <li> v1.2.0 2009/08/26 Anton Haumer<br>
           added component ThermalCollector</li>

    </ul>
    </html>")); 
    end HeatTransfer;
    annotation(Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}), graphics = {Line(origin = {-47.5, 11.6667}, points = {{-2.5, -91.6667}, {17.5, -71.6667}, {-22.5, -51.6667}, {17.5, -31.6667}, {-22.5, -11.667}, {17.5, 8.3333}, {-2.5, 28.3333}, {-2.5, 48.3333}}, smooth = Smooth.Bezier), Polygon(origin = {-50.0, 68.333}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{0.0, 21.667}, {-10.0, -8.333}, {10.0, -8.333}}), Line(origin = {2.5, 11.6667}, points = {{-2.5, -91.6667}, {17.5, -71.6667}, {-22.5, -51.6667}, {17.5, -31.6667}, {-22.5, -11.667}, {17.5, 8.3333}, {-2.5, 28.3333}, {-2.5, 48.3333}}, smooth = Smooth.Bezier), Polygon(origin = {0.0, 68.333}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{0.0, 21.667}, {-10.0, -8.333}, {10.0, -8.333}}), Line(origin = {52.5, 11.6667}, points = {{-2.5, -91.6667}, {17.5, -71.6667}, {-22.5, -51.6667}, {17.5, -31.6667}, {-22.5, -11.667}, {17.5, 8.3333}, {-2.5, 28.3333}, {-2.5, 48.3333}}, smooth = Smooth.Bezier), Polygon(origin = {50.0, 68.333}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{0.0, 21.667}, {-10.0, -8.333}, {10.0, -8.333}})}), Documentation(info = "<html>
  <p>
  This package contains libraries to model heat transfer
  and fluid heat flow.
  </p>
  </html>")); 
  end Thermal;

  package Math  "Library of mathematical functions (e.g., sin, cos) and of functions operating on vectors and matrices" 
    import SI = Modelica.SIunits;
    extends Modelica.Icons.Package;

    package Icons  "Icons for Math" 
      extends Modelica.Icons.IconsPackage;

      partial function AxisLeft  "Basic icon for mathematical function with y-axis on left side"  annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-80, -80}, {-80, 68}}, color = {192, 192, 192}), Polygon(points = {{-80, 90}, {-88, 68}, {-72, 68}, {-80, 90}}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Text(extent = {{-150, 150}, {150, 110}}, textString = "%name", lineColor = {0, 0, 255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-80, 80}, {-88, 80}}, color = {95, 95, 95}), Line(points = {{-80, -80}, {-88, -80}}, color = {95, 95, 95}), Line(points = {{-80, -90}, {-80, 84}}, color = {95, 95, 95}), Text(extent = {{-75, 104}, {-55, 84}}, lineColor = {95, 95, 95}, textString = "y"), Polygon(points = {{-80, 98}, {-86, 82}, {-74, 82}, {-80, 98}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid)}), Documentation(info = "<html>
      <p>
      Icon for a mathematical function, consisting of an y-axis on the left side.
      It is expected, that an x-axis is added and a plot of the function.
      </p>
      </html>")); end AxisLeft;

      partial function AxisCenter  "Basic icon for mathematical function with y-axis in the center"  annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{0, -80}, {0, 68}}, color = {192, 192, 192}), Polygon(points = {{0, 90}, {-8, 68}, {8, 68}, {0, 90}}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Text(extent = {{-150, 150}, {150, 110}}, textString = "%name", lineColor = {0, 0, 255})}), Diagram(graphics = {Line(points = {{0, 80}, {-8, 80}}, color = {95, 95, 95}), Line(points = {{0, -80}, {-8, -80}}, color = {95, 95, 95}), Line(points = {{0, -90}, {0, 84}}, color = {95, 95, 95}), Text(extent = {{5, 104}, {25, 84}}, lineColor = {95, 95, 95}, textString = "y"), Polygon(points = {{0, 98}, {-6, 82}, {6, 82}, {0, 98}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid)}), Documentation(info = "<html>
      <p>
      Icon for a mathematical function, consisting of an y-axis in the middle.
      It is expected, that an x-axis is added and a plot of the function.
      </p>
      </html>")); end AxisCenter;
    end Icons;

    function sin  "Sine" 
      extends Modelica.Math.Icons.AxisLeft;
      input Modelica.SIunits.Angle u;
      output Real y;
      external "builtin" y = sin(u) annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-90, 0}, {68, 0}}, color = {192, 192, 192}), Polygon(points = {{90, 0}, {68, 8}, {68, -8}, {90, 0}}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Line(points = {{-80, 0}, {-68.7, 34.2}, {-61.5, 53.1}, {-55.1, 66.4}, {-49.4, 74.6}, {-43.8, 79.1}, {-38.2, 79.8}, {-32.6, 76.6}, {-26.9, 69.7}, {-21.3, 59.4}, {-14.9, 44.1}, {-6.83, 21.2}, {10.1, -30.8}, {17.3, -50.2}, {23.7, -64.2}, {29.3, -73.1}, {35, -78.4}, {40.6, -80}, {46.2, -77.6}, {51.9, -71.5}, {57.5, -61.9}, {63.9, -47.2}, {72, -24.8}, {80, 0}}), Text(extent = {{12, 84}, {84, 36}}, lineColor = {192, 192, 192}, textString = "sin")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-100, 0}, {84, 0}}, color = {95, 95, 95}), Polygon(points = {{100, 0}, {84, 6}, {84, -6}, {100, 0}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Line(points = {{-80, 0}, {-68.7, 34.2}, {-61.5, 53.1}, {-55.1, 66.4}, {-49.4, 74.6}, {-43.8, 79.1}, {-38.2, 79.8}, {-32.6, 76.6}, {-26.9, 69.7}, {-21.3, 59.4}, {-14.9, 44.1}, {-6.83, 21.2}, {10.1, -30.8}, {17.3, -50.2}, {23.7, -64.2}, {29.3, -73.1}, {35, -78.4}, {40.6, -80}, {46.2, -77.6}, {51.9, -71.5}, {57.5, -61.9}, {63.9, -47.2}, {72, -24.8}, {80, 0}}, color = {0, 0, 255}, thickness = 0.5), Text(extent = {{-105, 72}, {-85, 88}}, textString = "1", lineColor = {0, 0, 255}), Text(extent = {{70, 25}, {90, 5}}, textString = "2*pi", lineColor = {0, 0, 255}), Text(extent = {{-103, -72}, {-83, -88}}, textString = "-1", lineColor = {0, 0, 255}), Text(extent = {{82, -6}, {102, -26}}, lineColor = {95, 95, 95}, textString = "u"), Line(points = {{-80, 80}, {-28, 80}}, color = {175, 175, 175}), Line(points = {{-80, -80}, {50, -80}}, color = {175, 175, 175})}), Documentation(info = "<html>
    <p>
    This function returns y = sin(u), with -&infin; &lt; u &lt; &infin;:
    </p>

    <p>
    <img src=\"modelica://Modelica/Resources/Images/Math/sin.png\">
    </p>
    </html>"));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-90, 0}, {68, 0}}, color = {192, 192, 192}), Polygon(points = {{90, 0}, {68, 8}, {68, -8}, {90, 0}}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Line(points = {{-80, 0}, {-68.7, 34.2}, {-61.5, 53.1}, {-55.1, 66.4}, {-49.4, 74.6}, {-43.8, 79.1}, {-38.2, 79.8}, {-32.6, 76.6}, {-26.9, 69.7}, {-21.3, 59.4}, {-14.9, 44.1}, {-6.83, 21.2}, {10.1, -30.8}, {17.3, -50.2}, {23.7, -64.2}, {29.3, -73.1}, {35, -78.4}, {40.6, -80}, {46.2, -77.6}, {51.9, -71.5}, {57.5, -61.9}, {63.9, -47.2}, {72, -24.8}, {80, 0}}), Text(extent = {{12, 84}, {84, 36}}, lineColor = {192, 192, 192}, textString = "sin")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-100, 0}, {84, 0}}, color = {95, 95, 95}), Polygon(points = {{100, 0}, {84, 6}, {84, -6}, {100, 0}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Line(points = {{-80, 0}, {-68.7, 34.2}, {-61.5, 53.1}, {-55.1, 66.4}, {-49.4, 74.6}, {-43.8, 79.1}, {-38.2, 79.8}, {-32.6, 76.6}, {-26.9, 69.7}, {-21.3, 59.4}, {-14.9, 44.1}, {-6.83, 21.2}, {10.1, -30.8}, {17.3, -50.2}, {23.7, -64.2}, {29.3, -73.1}, {35, -78.4}, {40.6, -80}, {46.2, -77.6}, {51.9, -71.5}, {57.5, -61.9}, {63.9, -47.2}, {72, -24.8}, {80, 0}}, color = {0, 0, 255}, thickness = 0.5), Text(extent = {{-105, 72}, {-85, 88}}, textString = "1", lineColor = {0, 0, 255}), Text(extent = {{70, 25}, {90, 5}}, textString = "2*pi", lineColor = {0, 0, 255}), Text(extent = {{-103, -72}, {-83, -88}}, textString = "-1", lineColor = {0, 0, 255}), Text(extent = {{82, -6}, {102, -26}}, lineColor = {95, 95, 95}, textString = "u"), Line(points = {{-80, 80}, {-28, 80}}, color = {175, 175, 175}), Line(points = {{-80, -80}, {50, -80}}, color = {175, 175, 175})}), Documentation(info = "<html>
    <p>
    This function returns y = sin(u), with -&infin; &lt; u &lt; &infin;:
    </p>

    <p>
    <img src=\"modelica://Modelica/Resources/Images/Math/sin.png\">
    </p>
    </html>")); 
    end sin;

    function asin  "Inverse sine (-1 <= u <= 1)" 
      extends Modelica.Math.Icons.AxisCenter;
      input Real u;
      output SI.Angle y;
      external "builtin" y = asin(u) annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-90, 0}, {68, 0}}, color = {192, 192, 192}), Polygon(points = {{90, 0}, {68, 8}, {68, -8}, {90, 0}}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Line(points = {{-80, -80}, {-79.2, -72.8}, {-77.6, -67.5}, {-73.6, -59.4}, {-66.3, -49.8}, {-53.5, -37.3}, {-30.2, -19.7}, {37.4, 24.8}, {57.5, 40.8}, {68.7, 52.7}, {75.2, 62.2}, {77.6, 67.5}, {80, 80}}), Text(extent = {{-88, 78}, {-16, 30}}, lineColor = {192, 192, 192}, textString = "asin")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-40, -72}, {-15, -88}}, textString = "-pi/2", lineColor = {0, 0, 255}), Text(extent = {{-38, 88}, {-13, 72}}, textString = " pi/2", lineColor = {0, 0, 255}), Text(extent = {{68, -9}, {88, -29}}, textString = "+1", lineColor = {0, 0, 255}), Text(extent = {{-90, 21}, {-70, 1}}, textString = "-1", lineColor = {0, 0, 255}), Line(points = {{-100, 0}, {84, 0}}, color = {95, 95, 95}), Polygon(points = {{98, 0}, {82, 6}, {82, -6}, {98, 0}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Line(points = {{-80, -80}, {-79.2, -72.8}, {-77.6, -67.5}, {-73.6, -59.4}, {-66.3, -49.8}, {-53.5, -37.3}, {-30.2, -19.7}, {37.4, 24.8}, {57.5, 40.8}, {68.7, 52.7}, {75.2, 62.2}, {77.6, 67.5}, {80, 80}}, color = {0, 0, 255}, thickness = 0.5), Text(extent = {{82, 24}, {102, 4}}, lineColor = {95, 95, 95}, textString = "u"), Line(points = {{0, 80}, {86, 80}}, color = {175, 175, 175}), Line(points = {{80, 86}, {80, -10}}, color = {175, 175, 175})}), Documentation(info = "<html>
    <p>
    This function returns y = asin(u), with -1 &le; u &le; +1:
    </p>

    <p>
    <img src=\"modelica://Modelica/Resources/Images/Math/asin.png\">
    </p>
    </html>"));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-90, 0}, {68, 0}}, color = {192, 192, 192}), Polygon(points = {{90, 0}, {68, 8}, {68, -8}, {90, 0}}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Line(points = {{-80, -80}, {-79.2, -72.8}, {-77.6, -67.5}, {-73.6, -59.4}, {-66.3, -49.8}, {-53.5, -37.3}, {-30.2, -19.7}, {37.4, 24.8}, {57.5, 40.8}, {68.7, 52.7}, {75.2, 62.2}, {77.6, 67.5}, {80, 80}}), Text(extent = {{-88, 78}, {-16, 30}}, lineColor = {192, 192, 192}, textString = "asin")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-40, -72}, {-15, -88}}, textString = "-pi/2", lineColor = {0, 0, 255}), Text(extent = {{-38, 88}, {-13, 72}}, textString = " pi/2", lineColor = {0, 0, 255}), Text(extent = {{68, -9}, {88, -29}}, textString = "+1", lineColor = {0, 0, 255}), Text(extent = {{-90, 21}, {-70, 1}}, textString = "-1", lineColor = {0, 0, 255}), Line(points = {{-100, 0}, {84, 0}}, color = {95, 95, 95}), Polygon(points = {{98, 0}, {82, 6}, {82, -6}, {98, 0}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Line(points = {{-80, -80}, {-79.2, -72.8}, {-77.6, -67.5}, {-73.6, -59.4}, {-66.3, -49.8}, {-53.5, -37.3}, {-30.2, -19.7}, {37.4, 24.8}, {57.5, 40.8}, {68.7, 52.7}, {75.2, 62.2}, {77.6, 67.5}, {80, 80}}, color = {0, 0, 255}, thickness = 0.5), Text(extent = {{82, 24}, {102, 4}}, lineColor = {95, 95, 95}, textString = "u"), Line(points = {{0, 80}, {86, 80}}, color = {175, 175, 175}), Line(points = {{80, 86}, {80, -10}}, color = {175, 175, 175})}), Documentation(info = "<html>
    <p>
    This function returns y = asin(u), with -1 &le; u &le; +1:
    </p>

    <p>
    <img src=\"modelica://Modelica/Resources/Images/Math/asin.png\">
    </p>
    </html>")); 
    end asin;

    function exp  "Exponential, base e" 
      extends Modelica.Math.Icons.AxisCenter;
      input Real u;
      output Real y;
      external "builtin" y = exp(u) annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-90, -80.3976}, {68, -80.3976}}, color = {192, 192, 192}), Polygon(points = {{90, -80.3976}, {68, -72.3976}, {68, -88.3976}, {90, -80.3976}}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Line(points = {{-80, -80}, {-31, -77.9}, {-6.03, -74}, {10.9, -68.4}, {23.7, -61}, {34.2, -51.6}, {43, -40.3}, {50.3, -27.8}, {56.7, -13.5}, {62.3, 2.23}, {67.1, 18.6}, {72, 38.2}, {76, 57.6}, {80, 80}}), Text(extent = {{-86, 50}, {-14, 2}}, lineColor = {192, 192, 192}, textString = "exp")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-100, -80.3976}, {84, -80.3976}}, color = {95, 95, 95}), Polygon(points = {{98, -80.3976}, {82, -74.3976}, {82, -86.3976}, {98, -80.3976}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Line(points = {{-80, -80}, {-31, -77.9}, {-6.03, -74}, {10.9, -68.4}, {23.7, -61}, {34.2, -51.6}, {43, -40.3}, {50.3, -27.8}, {56.7, -13.5}, {62.3, 2.23}, {67.1, 18.6}, {72, 38.2}, {76, 57.6}, {80, 80}}, color = {0, 0, 255}, thickness = 0.5), Text(extent = {{-31, 72}, {-11, 88}}, textString = "20", lineColor = {0, 0, 255}), Text(extent = {{-92, -81}, {-72, -101}}, textString = "-3", lineColor = {0, 0, 255}), Text(extent = {{66, -81}, {86, -101}}, textString = "3", lineColor = {0, 0, 255}), Text(extent = {{2, -69}, {22, -89}}, textString = "1", lineColor = {0, 0, 255}), Text(extent = {{78, -54}, {98, -74}}, lineColor = {95, 95, 95}, textString = "u"), Line(points = {{0, 80}, {88, 80}}, color = {175, 175, 175}), Line(points = {{80, 84}, {80, -84}}, color = {175, 175, 175})}), Documentation(info = "<html>
    <p>
    This function returns y = exp(u), with -&infin; &lt; u &lt; &infin;:
    </p>

    <p>
    <img src=\"modelica://Modelica/Resources/Images/Math/exp.png\">
    </p>
    </html>"));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-90, -80.3976}, {68, -80.3976}}, color = {192, 192, 192}), Polygon(points = {{90, -80.3976}, {68, -72.3976}, {68, -88.3976}, {90, -80.3976}}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Line(points = {{-80, -80}, {-31, -77.9}, {-6.03, -74}, {10.9, -68.4}, {23.7, -61}, {34.2, -51.6}, {43, -40.3}, {50.3, -27.8}, {56.7, -13.5}, {62.3, 2.23}, {67.1, 18.6}, {72, 38.2}, {76, 57.6}, {80, 80}}), Text(extent = {{-86, 50}, {-14, 2}}, lineColor = {192, 192, 192}, textString = "exp")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-100, -80.3976}, {84, -80.3976}}, color = {95, 95, 95}), Polygon(points = {{98, -80.3976}, {82, -74.3976}, {82, -86.3976}, {98, -80.3976}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Line(points = {{-80, -80}, {-31, -77.9}, {-6.03, -74}, {10.9, -68.4}, {23.7, -61}, {34.2, -51.6}, {43, -40.3}, {50.3, -27.8}, {56.7, -13.5}, {62.3, 2.23}, {67.1, 18.6}, {72, 38.2}, {76, 57.6}, {80, 80}}, color = {0, 0, 255}, thickness = 0.5), Text(extent = {{-31, 72}, {-11, 88}}, textString = "20", lineColor = {0, 0, 255}), Text(extent = {{-92, -81}, {-72, -101}}, textString = "-3", lineColor = {0, 0, 255}), Text(extent = {{66, -81}, {86, -101}}, textString = "3", lineColor = {0, 0, 255}), Text(extent = {{2, -69}, {22, -89}}, textString = "1", lineColor = {0, 0, 255}), Text(extent = {{78, -54}, {98, -74}}, lineColor = {95, 95, 95}, textString = "u"), Line(points = {{0, 80}, {88, 80}}, color = {175, 175, 175}), Line(points = {{80, 84}, {80, -84}}, color = {175, 175, 175})}), Documentation(info = "<html>
    <p>
    This function returns y = exp(u), with -&infin; &lt; u &lt; &infin;:
    </p>

    <p>
    <img src=\"modelica://Modelica/Resources/Images/Math/exp.png\">
    </p>
    </html>")); 
    end exp;
    annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-80, 0}, {-68.7, 34.2}, {-61.5, 53.1}, {-55.1, 66.4}, {-49.4, 74.6}, {-43.8, 79.1}, {-38.2, 79.8}, {-32.6, 76.6}, {-26.9, 69.7}, {-21.3, 59.4}, {-14.9, 44.1}, {-6.83, 21.2}, {10.1, -30.8}, {17.3, -50.2}, {23.7, -64.2}, {29.3, -73.1}, {35, -78.4}, {40.6, -80}, {46.2, -77.6}, {51.9, -71.5}, {57.5, -61.9}, {63.9, -47.2}, {72, -24.8}, {80, 0}}, color = {0, 0, 0}, smooth = Smooth.Bezier)}), Documentation(info = "<html>
  <p>
  This package contains <strong>basic mathematical functions</strong> (such as sin(..)),
  as well as functions operating on
  <a href=\"modelica://Modelica.Math.Vectors\">vectors</a>,
  <a href=\"modelica://Modelica.Math.Matrices\">matrices</a>,
  <a href=\"modelica://Modelica.Math.Nonlinear\">nonlinear functions</a>, and
  <a href=\"modelica://Modelica.Math.BooleanVectors\">Boolean vectors</a>.
  </p>

  <h4>Main Authors</h4>
  <p><a href=\"http://www.robotic.dlr.de/Martin.Otter/\"><strong>Martin Otter</strong></a>
  and <strong>Marcus Baur</strong><br>
  Deutsches Zentrum f&uuml;r Luft- und Raumfahrt e.V. (DLR)<br>
  Institut f&uuml;r Systemdynamik und Regelungstechnik (DLR-SR)<br>
  Forschungszentrum Oberpfaffenhofen<br>
  D-82234 Wessling<br>
  Germany<br>
  email: <a href=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</a>
  </p>

  <p>
  Copyright &copy; 1998-2019, Modelica Association and contributors
  </p>
  </html>", revisions = "<html>
  <ul>
  <li><em>August 24, 2016</em>
         by Christian Kral: added wrapAngle</li>
  <li><em>October 21, 2002</em>
         by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
         and Christian Schweiger:<br>
         Function tempInterpol2 added.</li>
  <li><em>Oct. 24, 1999</em>
         by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
         Icons for icon and diagram level introduced.</li>
  <li><em>June 30, 1999</em>
         by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
         Realized.</li>
  </ul>

  </html>")); 
  end Math;

  package Constants  "Library of mathematical constants and constants of nature (e.g., pi, eps, R, sigma)" 
    import SI = Modelica.SIunits;
    import NonSI = Modelica.SIunits.Conversions.NonSIunits;
    extends Modelica.Icons.Package;
    final constant Real pi = 2 * Modelica.Math.asin(1.0);
    final constant Real eps = ModelicaServices.Machine.eps "Biggest number such that 1.0 + eps = 1.0";
    final constant SI.Velocity c = 299792458 "Speed of light in vacuum";
    final constant SI.FaradayConstant F = 9.648533289e4 "Faraday constant, C/mol (previous value: 9.64853399e4)";
    final constant Real N_A(final unit = "1/mol") = 6.022140857e23 "Avogadro constant (previous value: 6.0221415e23)";
    final constant Real mue_0(final unit = "N/A2") = 4 * pi * 1.e-7 "Magnetic constant";
    annotation(Documentation(info = "<html>
  <p>
  This package provides often needed constants from mathematics, machine
  dependent constants and constants from nature. The latter constants
  (name, value, description) are from the following source:
  </p>

  <dl>
  <dt>Peter J. Mohr, David B. Newell, and Barry N. Taylor:</dt>
  <dd><strong>CODATA Recommended Values of the Fundamental Physical Constants: 2014</strong>.
  <a href= \"http://dx.doi.org/10.5281/zenodo.22826\">http://dx.doi.org/10.5281/zenodo.22826</a>, 2015. See also <a href=
  \"http://physics.nist.gov/cuu/Constants/index.html\">http://physics.nist.gov/cuu/Constants/index.html</a></dd>
  </dl>

  <p>CODATA is the Committee on Data for Science and Technology.</p>

  <dl>
  <dt><strong>Main Author:</strong></dt>
  <dd><a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a><br>
      Deutsches Zentrum f&uuml;r Luft und Raumfahrt e. V. (DLR)<br>
      Oberpfaffenhofen<br>
      Postfach 1116<br>
      D-82230 We&szlig;ling<br>
      email: <a href=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</a></dd>
  </dl>

  <p>
  Copyright &copy; 1998-2019, Modelica Association and contributors
  </p>
  </html>", revisions = "<html>
  <ul>
  <li><em>Nov 4, 2015</em>
         by Thomas Beutlich:<br>
         Constants updated according to 2014 CODATA values.</li>
  <li><em>Nov 8, 2004</em>
         by Christian Schweiger:<br>
         Constants updated according to 2002 CODATA values.</li>
  <li><em>Dec 9, 1999</em>
         by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
         Constants updated according to 1998 CODATA values. Using names, values
         and description text from this source. Included magnetic and
         electric constant.</li>
  <li><em>Sep 18, 1999</em>
         by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
         Constants eps, inf, small introduced.</li>
  <li><em>Nov 15, 1997</em>
         by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
         Realized.</li>
  </ul>
  </html>"), Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}), graphics = {Polygon(origin = {-9.2597, 25.6673}, fillColor = {102, 102, 102}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{48.017, 11.336}, {48.017, 11.336}, {10.766, 11.336}, {-25.684, 10.95}, {-34.944, -15.111}, {-34.944, -15.111}, {-32.298, -15.244}, {-32.298, -15.244}, {-22.112, 0.168}, {11.292, 0.234}, {48.267, -0.097}, {48.267, -0.097}}, smooth = Smooth.Bezier), Polygon(origin = {-19.9923, -8.3993}, fillColor = {102, 102, 102}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{3.239, 37.343}, {3.305, 37.343}, {-0.399, 2.683}, {-16.936, -20.071}, {-7.808, -28.604}, {6.811, -22.519}, {9.986, 37.145}, {9.986, 37.145}}, smooth = Smooth.Bezier), Polygon(origin = {23.753, -11.5422}, fillColor = {102, 102, 102}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-10.873, 41.478}, {-10.873, 41.478}, {-14.048, -4.162}, {-9.352, -24.8}, {7.912, -24.469}, {16.247, 0.27}, {16.247, 0.27}, {13.336, 0.071}, {13.336, 0.071}, {7.515, -9.983}, {-3.134, -7.271}, {-2.671, 41.214}, {-2.671, 41.214}}, smooth = Smooth.Bezier)})); 
  end Constants;

  package Icons  "Library of icons" 
    extends Icons.Package;

    partial package Package  "Icon for standard packages"  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(lineColor = {200, 200, 200}, fillColor = {248, 248, 248}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 25.0), Rectangle(lineColor = {128, 128, 128}, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 25.0)}), Documentation(info = "<html>
    <p>Standard package icon.</p>
    </html>")); end Package;

    partial package InterfacesPackage  "Icon for packages containing interfaces" 
      extends Modelica.Icons.Package;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(origin = {20.0, 0.0}, lineColor = {64, 64, 64}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-10.0, 70.0}, {10.0, 70.0}, {40.0, 20.0}, {80.0, 20.0}, {80.0, -20.0}, {40.0, -20.0}, {10.0, -70.0}, {-10.0, -70.0}}), Polygon(fillColor = {102, 102, 102}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-100.0, 20.0}, {-60.0, 20.0}, {-30.0, 70.0}, {-10.0, 70.0}, {-10.0, -70.0}, {-30.0, -70.0}, {-60.0, -20.0}, {-100.0, -20.0}})}), Documentation(info = "<html>
    <p>This icon indicates packages containing interfaces.</p>
    </html>")); 
    end InterfacesPackage;

    partial package SourcesPackage  "Icon for packages containing sources" 
      extends Modelica.Icons.Package;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(origin = {23.3333, 0.0}, fillColor = {128, 128, 128}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-23.333, 30.0}, {46.667, 0.0}, {-23.333, -30.0}}), Rectangle(fillColor = {128, 128, 128}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-70, -4.5}, {0, 4.5}})}), Documentation(info = "<html>
    <p>This icon indicates a package which contains sources.</p>
    </html>")); 
    end SourcesPackage;

    partial package IconsPackage  "Icon for packages containing icons" 
      extends Modelica.Icons.Package;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(origin = {-8.167, -17}, fillColor = {128, 128, 128}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-15.833, 20.0}, {-15.833, 30.0}, {14.167, 40.0}, {24.167, 20.0}, {4.167, -30.0}, {14.167, -30.0}, {24.167, -30.0}, {24.167, -40.0}, {-5.833, -50.0}, {-15.833, -30.0}, {4.167, 20.0}, {-5.833, 20.0}}, smooth = Smooth.Bezier), Ellipse(origin = {-0.5, 56.5}, fillColor = {128, 128, 128}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-12.5, -12.5}, {12.5, 12.5}})})); 
    end IconsPackage;
    annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(origin = {-8.167, -17}, fillColor = {128, 128, 128}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-15.833, 20.0}, {-15.833, 30.0}, {14.167, 40.0}, {24.167, 20.0}, {4.167, -30.0}, {14.167, -30.0}, {24.167, -30.0}, {24.167, -40.0}, {-5.833, -50.0}, {-15.833, -30.0}, {4.167, 20.0}, {-5.833, 20.0}}, smooth = Smooth.Bezier), Ellipse(origin = {-0.5, 56.5}, fillColor = {128, 128, 128}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-12.5, -12.5}, {12.5, 12.5}})}), Documentation(info = "<html>
  <p>This package contains definitions for the graphical layout of components which may be used in different libraries. The icons can be utilized by inheriting them in the desired class using &quot;extends&quot; or by directly copying the &quot;icon&quot; layer.</p>

  <h4>Main Authors:</h4>

  <dl>
  <dt><a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a></dt>
      <dd>Deutsches Zentrum fuer Luft und Raumfahrt e.V. (DLR)</dd>
      <dd>Oberpfaffenhofen</dd>
      <dd>Postfach 1116</dd>
      <dd>D-82230 Wessling</dd>
      <dd>email: <a href=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</a></dd>
  <dt>Christian Kral</dt>

      <dd>  <a href=\"https://christiankral.net/\">Electric Machines, Drives and Systems</a><br>
  </dd>
      <dd>1060 Vienna, Austria</dd>
      <dd>email: <a href=\"mailto:dr.christian.kral@gmail.com\">dr.christian.kral@gmail.com</a></dd>
  <dt>Johan Andreasson</dt>
      <dd><a href=\"http://www.modelon.se/\">Modelon AB</a></dd>
      <dd>Ideon Science Park</dd>
      <dd>22370 Lund, Sweden</dd>
      <dd>email: <a href=\"mailto:johan.andreasson@modelon.se\">johan.andreasson@modelon.se</a></dd>
  </dl>

  <p>
  Copyright &copy; 1998-2019, Modelica Association and contributors
  </p>
  </html>")); 
  end Icons;

  package SIunits  "Library of type and unit definitions based on SI units according to ISO 31-1992" 
    extends Modelica.Icons.Package;

    package Conversions  "Conversion functions to/from non SI units and type definitions of non SI units" 
      extends Modelica.Icons.Package;

      package NonSIunits  "Type definitions of non SI units" 
        extends Modelica.Icons.Package;
        type Temperature_degC = Real(final quantity = "ThermodynamicTemperature", final unit = "degC") "Absolute temperature in degree Celsius (for relative temperature use SIunits.TemperatureDifference)" annotation(absoluteValue = true);
        annotation(Documentation(info = "<html>
      <p>
      This package provides predefined types, such as <strong>Angle_deg</strong> (angle in
      degree), <strong>AngularVelocity_rpm</strong> (angular velocity in revolutions per
      minute) or <strong>Temperature_degF</strong> (temperature in degree Fahrenheit),
      which are in common use but are not part of the international standard on
      units according to ISO 31-1992 \"General principles concerning quantities,
      units and symbols\" and ISO 1000-1992 \"SI units and recommendations for
      the use of their multiples and of certain other units\".</p>
      <p>If possible, the types in this package should not be used. Use instead
      types of package Modelica.SIunits. For more information on units, see also
      the book of Francois Cardarelli <strong>Scientific Unit Conversion - A
      Practical Guide to Metrication</strong> (Springer 1997).</p>
      <p>Some units, such as <strong>Temperature_degC/Temp_C</strong> are both defined in
      Modelica.SIunits and in Modelica.Conversions.NonSIunits. The reason is that these
      definitions have been placed erroneously in Modelica.SIunits although they
      are not SIunits. For backward compatibility, these type definitions are
      still kept in Modelica.SIunits.</p>
      </html>"), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Text(origin = {15.0, 51.8518}, extent = {{-105.0, -86.8518}, {75.0, -16.8518}}, textString = "[km/h]")})); 
      end NonSIunits;
      annotation(Documentation(info = "<html>
    <p>This package provides conversion functions from the non SI Units
    defined in package Modelica.SIunits.Conversions.NonSIunits to the
    corresponding SI Units defined in package Modelica.SIunits and vice
    versa. It is recommended to use these functions in the following
    way (note, that all functions have one Real input and one Real output
    argument):</p>
    <pre>
      <strong>import</strong> SI = Modelica.SIunits;
      <strong>import</strong> Modelica.SIunits.Conversions.*;
         ...
      <strong>parameter</strong> SI.Temperature     T   = from_degC(25);   // convert 25 degree Celsius to Kelvin
      <strong>parameter</strong> SI.Angle           phi = from_deg(180);   // convert 180 degree to radian
      <strong>parameter</strong> SI.AngularVelocity w   = from_rpm(3600);  // convert 3600 revolutions per minutes
                                                          // to radian per seconds
    </pre>

    </html>")); 
    end Conversions;

    type Angle = Real(final quantity = "Angle", final unit = "rad", displayUnit = "deg");
    type Time = Real(final quantity = "Time", final unit = "s");
    type Velocity = Real(final quantity = "Velocity", final unit = "m/s");
    type Acceleration = Real(final quantity = "Acceleration", final unit = "m/s2");
    type Frequency = Real(final quantity = "Frequency", final unit = "Hz");
    type Power = Real(final quantity = "Power", final unit = "W");
    type ThermodynamicTemperature = Real(final quantity = "ThermodynamicTemperature", final unit = "K", min = 0.0, start = 288.15, nominal = 300, displayUnit = "degC") "Absolute temperature (use type TemperatureDifference for relative temperatures)" annotation(absoluteValue = true);
    type Temperature = ThermodynamicTemperature;
    type LinearTemperatureCoefficient = Real(final quantity = "LinearTemperatureCoefficient", final unit = "1/K");
    type HeatFlowRate = Real(final quantity = "Power", final unit = "W");
    type ElectricCurrent = Real(final quantity = "ElectricCurrent", final unit = "A");
    type Current = ElectricCurrent;
    type ElectricCharge = Real(final quantity = "ElectricCharge", final unit = "C");
    type ElectricPotential = Real(final quantity = "ElectricPotential", final unit = "V");
    type Voltage = ElectricPotential;
    type Inductance = Real(final quantity = "Inductance", final unit = "H");
    type Resistance = Real(final quantity = "Resistance", final unit = "Ohm");
    type FaradayConstant = Real(final quantity = "FaradayConstant", final unit = "C/mol");
    annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(fillColor = {128, 128, 128}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-80, -40}, {-80, -40}, {-55, 50}, {-52.5, 62.5}, {-65, 60}, {-65, 65}, {-35, 77.5}, {-32.5, 60}, {-50, 0}, {-50, 0}, {-30, 15}, {-20, 27.5}, {-32.5, 27.5}, {-32.5, 27.5}, {-32.5, 32.5}, {-32.5, 32.5}, {2.5, 32.5}, {2.5, 32.5}, {2.5, 27.5}, {2.5, 27.5}, {-7.5, 27.5}, {-30, 7.5}, {-30, 7.5}, {-25, -25}, {-17.5, -28.75}, {-10, -25}, {-5, -26.25}, {-5, -32.5}, {-16.25, -41.25}, {-31.25, -43.75}, {-40, -33.75}, {-45, -5}, {-45, -5}, {-52.5, -10}, {-52.5, -10}, {-60, -40}, {-60, -40}}, smooth = Smooth.Bezier), Polygon(fillColor = {128, 128, 128}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{87.5, 30}, {62.5, 30}, {62.5, 30}, {55, 33.75}, {36.25, 35}, {16.25, 25}, {7.5, 6.25}, {11.25, -7.5}, {22.5, -12.5}, {22.5, -12.5}, {6.25, -22.5}, {6.25, -35}, {16.25, -38.75}, {16.25, -38.75}, {21.25, -41.25}, {21.25, -41.25}, {45, -48.75}, {47.5, -61.25}, {32.5, -70}, {12.5, -65}, {7.5, -51.25}, {21.25, -41.25}, {21.25, -41.25}, {16.25, -38.75}, {16.25, -38.75}, {6.25, -41.25}, {-6.25, -50}, {-3.75, -68.75}, {30, -76.25}, {65, -62.5}, {63.75, -35}, {27.5, -26.25}, {22.5, -20}, {27.5, -15}, {27.5, -15}, {30, -7.5}, {30, -7.5}, {27.5, -2.5}, {28.75, 11.25}, {36.25, 27.5}, {47.5, 30}, {53.75, 22.5}, {51.25, 8.75}, {45, -6.25}, {35, -11.25}, {30, -7.5}, {30, -7.5}, {27.5, -15}, {27.5, -15}, {43.75, -16.25}, {65, -6.25}, {72.5, 10}, {70, 20}, {70, 20}, {80, 20}}, smooth = Smooth.Bezier)}), Documentation(info = "<html>
  <p>This package provides predefined types, such as <em>Mass</em>,
  <em>Angle</em>, <em>Time</em>, based on the international standard
  on units, e.g.,
  </p>

  <pre>   <strong>type</strong> Angle = Real(<strong>final</strong> quantity = \"Angle\",
                       <strong>final</strong> unit     = \"rad\",
                       displayUnit    = \"deg\");
  </pre>

  <p>
  Some of the types are derived SI units that are utilized in package Modelica
  (such as ComplexCurrent, which is a complex number where both the real and imaginary
  part have the SI unit Ampere).
  </p>

  <p>
  Furthermore, conversion functions from non SI-units to SI-units and vice versa
  are provided in subpackage
  <a href=\"modelica://Modelica.SIunits.Conversions\">Conversions</a>.
  </p>

  <p>
  For an introduction how units are used in the Modelica standard library
  with package SIunits, have a look at:
  <a href=\"modelica://Modelica.SIunits.UsersGuide.HowToUseSIunits\">How to use SIunits</a>.
  </p>

  <p>
  Copyright &copy; 1998-2019, Modelica Association and contributors
  </p>
  </html>", revisions = "<html>
  <ul>
  <li><em>May 25, 2011</em> by Stefan Wischhusen:<br/>Added molar units for energy and enthalpy.</li>
  <li><em>Jan. 27, 2010</em> by Christian Kral:<br/>Added complex units.</li>
  <li><em>Dec. 14, 2005</em> by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br/>Add User&#39;s Guide and removed &quot;min&quot; values for Resistance and Conductance.</li>
  <li><em>October 21, 2002</em> by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a> and Christian Schweiger:<br/>Added new package <strong>Conversions</strong>. Corrected typo <em>Wavelenght</em>.</li>
  <li><em>June 6, 2000</em> by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br/>Introduced the following new types<br/>type Temperature = ThermodynamicTemperature;<br/>types DerDensityByEnthalpy, DerDensityByPressure, DerDensityByTemperature, DerEnthalpyByPressure, DerEnergyByDensity, DerEnergyByPressure<br/>Attribute &quot;final&quot; removed from min and max values in order that these values can still be changed to narrow the allowed range of values.<br/>Quantity=&quot;Stress&quot; removed from type &quot;Stress&quot;, in order that a type &quot;Stress&quot; can be connected to a type &quot;Pressure&quot;.</li>
  <li><em>Oct. 27, 1999</em> by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br/>New types due to electrical library: Transconductance, InversePotential, Damping.</li>
  <li><em>Sept. 18, 1999</em> by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br/>Renamed from SIunit to SIunits. Subpackages expanded, i.e., the SIunits package, does no longer contain subpackages.</li>
  <li><em>Aug 12, 1999</em> by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br/>Type &quot;Pressure&quot; renamed to &quot;AbsolutePressure&quot; and introduced a new type &quot;Pressure&quot; which does not contain a minimum of zero in order to allow convenient handling of relative pressure. Redefined BulkModulus as an alias to AbsolutePressure instead of Stress, since needed in hydraulics.</li>
  <li><em>June 29, 1999</em> by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br/>Bug-fix: Double definition of &quot;Compressibility&quot; removed and appropriate &quot;extends Heat&quot; clause introduced in package SolidStatePhysics to incorporate ThermodynamicTemperature.</li>
  <li><em>April 8, 1998</em> by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a> and Astrid Jaschinski:<br/>Complete ISO 31 chapters realized.</li>
  <li><em>Nov. 15, 1997</em> by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a> and Hubertus Tummescheit:<br/>Some chapters realized.</li>
  </ul>
  </html>")); 
  end SIunits;
  annotation(preferredView = "info", version = "3.2.3", versionBuild = 3, versionDate = "2019-01-23", dateModified = "2019-09-21 12:00:00Z", revisionId = "$Format:%h %ci$", uses(Complex(version = "3.2.3"), ModelicaServices(version = "3.2.3")), conversion(noneFromVersion = "3.2.2", noneFromVersion = "3.2.1", noneFromVersion = "3.2", noneFromVersion = "3.1", noneFromVersion = "3.0.1", noneFromVersion = "3.0", from(version = "2.1", script = "modelica://Modelica/Resources/Scripts/Dymola/ConvertModelica_from_2.2.2_to_3.0.mos"), from(version = "2.2", script = "modelica://Modelica/Resources/Scripts/Dymola/ConvertModelica_from_2.2.2_to_3.0.mos"), from(version = "2.2.1", script = "modelica://Modelica/Resources/Scripts/Dymola/ConvertModelica_from_2.2.2_to_3.0.mos"), from(version = "2.2.2", script = "modelica://Modelica/Resources/Scripts/Dymola/ConvertModelica_from_2.2.2_to_3.0.mos")), Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}), graphics = {Polygon(origin = {-6.9888, 20.048}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-93.0112, 10.3188}, {-93.0112, 10.3188}, {-73.011, 24.6}, {-63.011, 31.221}, {-51.219, 36.777}, {-39.842, 38.629}, {-31.376, 36.248}, {-25.819, 29.369}, {-24.232, 22.49}, {-23.703, 17.463}, {-15.501, 25.135}, {-6.24, 32.015}, {3.02, 36.777}, {15.191, 39.423}, {27.097, 37.306}, {32.653, 29.633}, {35.035, 20.108}, {43.501, 28.046}, {54.085, 35.19}, {65.991, 39.952}, {77.897, 39.688}, {87.422, 33.338}, {91.126, 21.696}, {90.068, 9.525}, {86.099, -1.058}, {79.749, -10.054}, {71.283, -21.431}, {62.816, -33.337}, {60.964, -32.808}, {70.489, -16.14}, {77.368, -2.381}, {81.072, 10.054}, {79.749, 19.05}, {72.605, 24.342}, {61.758, 23.019}, {49.587, 14.817}, {39.003, 4.763}, {29.214, -6.085}, {21.012, -16.669}, {13.339, -26.458}, {5.401, -36.777}, {-1.213, -46.037}, {-6.24, -53.446}, {-8.092, -52.387}, {-0.684, -40.746}, {5.401, -30.692}, {12.81, -17.198}, {19.424, -3.969}, {23.658, 7.938}, {22.335, 18.785}, {16.514, 23.283}, {8.047, 23.019}, {-1.478, 19.05}, {-11.267, 11.113}, {-19.734, 2.381}, {-29.259, -8.202}, {-38.519, -19.579}, {-48.044, -31.221}, {-56.511, -43.392}, {-64.449, -55.298}, {-72.386, -66.939}, {-77.678, -74.612}, {-79.53, -74.083}, {-71.857, -61.383}, {-62.861, -46.037}, {-52.278, -28.046}, {-44.869, -15.346}, {-38.784, -2.117}, {-35.344, 8.731}, {-36.403, 19.844}, {-42.488, 23.813}, {-52.013, 22.49}, {-60.744, 16.933}, {-68.947, 10.054}, {-76.884, 2.646}, {-93.0112, -12.1707}, {-93.0112, -12.1707}}, smooth = Smooth.Bezier), Ellipse(origin = {40.8208, -37.7602}, fillColor = {161, 0, 4}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-17.8562, -17.8563}, {17.8563, 17.8562}})}), Documentation(info = "<html>
<p>
Package <strong>Modelica&reg;</strong> is a <strong>standardized</strong> and <strong>free</strong> package
that is developed together with the Modelica&reg; language from the
Modelica Association, see
<a href=\"https://www.Modelica.org\">https://www.Modelica.org</a>.
It is also called <strong>Modelica Standard Library</strong>.
It provides model components in many domains that are based on
standardized interface definitions. Some typical examples are shown
in the next figure:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/UsersGuide/ModelicaLibraries.png\">
</p>

<p>
For an introduction, have especially a look at:
</p>
<ul>
<li> <a href=\"modelica://Modelica.UsersGuide.Overview\">Overview</a>
  provides an overview of the Modelica Standard Library
  inside the <a href=\"modelica://Modelica.UsersGuide\">User's Guide</a>.</li>
<li><a href=\"modelica://Modelica.UsersGuide.ReleaseNotes\">Release Notes</a>
 summarizes the changes of new versions of this package.</li>
<li> <a href=\"modelica://Modelica.UsersGuide.Contact\">Contact</a>
  lists the contributors of the Modelica Standard Library.</li>
<li> The <strong>Examples</strong> packages in the various libraries, demonstrate
  how to use the components of the corresponding sublibrary.</li>
</ul>

<p>
This version of the Modelica Standard Library consists of
</p>
<ul>
<li><strong>1288</strong> component models and blocks,</li>
<li><strong>404</strong> example models, and</li>
<li><strong>1227</strong> functions</li>
</ul>
<p>
that are directly usable (= number of public, non-partial, non-internal and non-obsolete classes). It is fully compliant
to <a href=\"https://www.modelica.org/documents/ModelicaSpec32Revision2.pdf\">Modelica Specification Version 3.2 Revision 2</a>
and it has been tested with Modelica tools from different vendors.
</p>

<p>
<strong>Licensed by the Modelica Association under the 3-Clause BSD License</strong><br>
Copyright &copy; 1998-2019, Modelica Association and <a href=\"modelica://Modelica.UsersGuide.Contact\">contributors</a>.
</p>

<p>
<em>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the 3-Clause BSD license. For license conditions (including the disclaimer of warranty) visit <a href=\"https://modelica.org/licenses/modelica-3-clause-bsd\">https://modelica.org/licenses/modelica-3-clause-bsd</a>.</em>
</p>

<p>
<strong>Modelica&reg;</strong> is a registered trademark of the Modelica Association.
</p>
</html>")); 
end Modelica;

end Total;