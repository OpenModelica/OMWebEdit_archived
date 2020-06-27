import React from "react";

import createEngine, {DiagramModel, PortModelAlignment} from "@projectstorm/react-diagrams";
import {CanvasWidget} from "@projectstorm/react-canvas-core";
import "./App.css";
import {SimplePortFactory} from "./custom-nodes/common/SimplePortFactory";
import {OMWebEditPortModel} from "./custom-nodes/omwebedit-default-node/OMWebEditPortModel";
import {OMWebEditDefaultNodeFactory} from "./custom-nodes/omwebedit-default-node/OMWebEditDefaultNodeFactory";
import {OMWebEditDefaultNodeModel} from "./custom-nodes/omwebedit-default-node/OMWebEditDefaultNodeModel";
import modelJson from "./sample-rlc-circuit-model.json";

function App() {

  // setup the diagram engine
  const engine = createEngine();

  // register some other factories as well
  engine
      .getPortFactories()
      .registerFactory(new SimplePortFactory('omwebedit-default-node', (config) => new OMWebEditPortModel(PortModelAlignment.LEFT)));
  engine.getNodeFactories().registerFactory(new OMWebEditDefaultNodeFactory());

  // setup the diagram model
  const model = new DiagramModel();

  // // setup nodes
  // const voltageNode = new OMWebEditDefaultNodeModel("sine-voltage", "clockwise-90");
  // voltageNode.setPosition(100, 200);
  //
  // const resistorNode = new OMWebEditDefaultNodeModel("resistor", "default");
  // resistorNode.setPosition(300, 100);
  //
  // const inductorNode = new OMWebEditDefaultNodeModel("inductor", "default");
  // inductorNode.setPosition(600, 100);
  //
  // let ports: PortModelAlignment[]  = [PortModelAlignment.TOP];
  // const groundNode = new OMWebEditDefaultNodeModel("ground", "default", ports);
  // groundNode.setPosition(300, 400);
  //
  // // setup links
  // const resistorLeftPort = resistorNode.getPort(PortModelAlignment.LEFT);
  // const resistorRightPort = resistorNode.getPort(PortModelAlignment.RIGHT);
  // const inductorLeftPort = inductorNode.getPort(PortModelAlignment.LEFT);
  // const inductorRightPort = inductorNode.getPort(PortModelAlignment.RIGHT);
  // const groundTopPort = groundNode.getPort(PortModelAlignment.TOP);
  // const voltageLeftPort = voltageNode.getPort(PortModelAlignment.LEFT);
  // const voltageRightPort = voltageNode.getPort(PortModelAlignment.RIGHT);
  //
  // const resistorInductorLink = resistorLeftPort.createLinkModel();
  // resistorInductorLink.setSourcePort(resistorRightPort);
  // resistorInductorLink.setTargetPort(inductorLeftPort);
  //
  // const inductorGroundLink = inductorRightPort.createLinkModel();
  // inductorGroundLink.setSourcePort(inductorRightPort);
  // inductorGroundLink.setTargetPort(groundTopPort);
  //
  // const voltageResistorLink = voltageLeftPort.createLinkModel();
  // voltageResistorLink.setSourcePort(voltageLeftPort);
  // voltageResistorLink.setTargetPort(resistorLeftPort);
  //
  // const voltageGroundLink = voltageRightPort.createLinkModel();
  // voltageGroundLink.setSourcePort(voltageRightPort);
  // voltageGroundLink.setTargetPort(groundTopPort);
  //
  // // add everything to model
  // model.addAll(voltageNode, resistorNode, inductorNode, groundNode);
  // model.addAll(resistorInductorLink, inductorGroundLink, voltageResistorLink, voltageGroundLink);
  //
  // // load model into engine
  // engine.setModel(model);

  const model2 = new DiagramModel();
  const str = JSON.stringify(modelJson);
  model2.deserializeModel(JSON.parse(str), engine);
  engine.setModel(model2);

  return (
      <div>
        <CanvasWidget engine={engine} className="canvas" />
        <button onClick={() => {
            console.log(JSON.stringify(model.serialize()));
        }}>
          Serialise Model
        </button>
      </div>
      );
}

export default App;
