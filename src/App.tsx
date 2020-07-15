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

  let port1: OMPort = {
    id: "foo-port1",
    placement: {
      bottomLeft: {
        x: 0,
        y: 60,
      },
    },
    rotation: 0,
  };
  let ports: OMPort[] = [port1];
  const inductorNode = new OMComponentModel("inductor", ports);
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
