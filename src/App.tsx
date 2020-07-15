import React from "react";

import createEngine, { DiagramModel } from "@projectstorm/react-diagrams";
import { CanvasWidget } from "@projectstorm/react-canvas-core";
import "./App.css";
import { OMComponentFactory } from "./custom-nodes/omcomponent/OMComponentFactory";
import { OMComponentModel } from "./custom-nodes/omcomponent/OMComponentModel";
import { OMPort } from "./domain-model/OMPort";

function App() {
  const engine = createEngine();
  engine.getNodeFactories().registerFactory(new OMComponentFactory());
  const model = new DiagramModel();

  const port1: OMPort = {
    id: "Modelica.Electrical.Analog.Interfaces.PositivePin",
    svgUrl: "./Modelica.Electrical.Analog.Interfaces.PositivePin.svg",
    placement: {
      bottomLeft: {
        x: 50,
        y: 105,
      },
    },
    rotation: 0,
  };
  const port2: OMPort = {
    id: "Modelica.Electrical.Analog.Interfaces.NegativePin",
    svgUrl: "./Modelica.Electrical.Analog.Interfaces.NegativePin.svg",
    placement: {
      bottomLeft: {
        x: 245,
        y: 105,
      },
    },
    rotation: 0,
  };
  const ports: OMPort[] = [port1, port2];
  const inductorNode = new OMComponentModel(
    "Modelica.Electrical.Analog.Basic.Inductor",
    { width: 310, height: 210 },
    ports
  );
  inductorNode.setPosition(600, 100);

  // add everything to model
  model.addAll(inductorNode);

  // load model into engine
  engine.setModel(model);

  return (
    <div>
      <CanvasWidget engine={engine} className="canvas" />
      <button
        onClick={() => {
          console.log(JSON.stringify(model.serialize()));
        }}
      >
        Serialise Model
      </button>
    </div>
  );
}

export default App;
