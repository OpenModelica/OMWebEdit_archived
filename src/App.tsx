import React from "react";

import createEngine, {
  DiagramModel, PortModelAlignment,
} from "@projectstorm/react-diagrams";
import { CanvasWidget } from "@projectstorm/react-canvas-core";
import "./App.css";
import {SimplePortFactory} from "./custom-nodes/common/SimplePortFactory";
import {OMWebEditPortModel} from "./custom-nodes/omwebedit-default-node/OMWebEditPortModel";
import {OMWebEditDefaultNodeFactory} from "./custom-nodes/omwebedit-default-node/OMWebEditDefaultNodeFactory";
import {OMWebEditDefaultNodeModel} from "./custom-nodes/omwebedit-default-node/OMWebEditDefaultNodeModel";

function App() {

  // setup the diagram engine
  var engine = createEngine();

  // register some other factories as well
  engine
      .getPortFactories()
      .registerFactory(new SimplePortFactory('omwebedit-default', (config) => new OMWebEditPortModel(PortModelAlignment.LEFT)));
  engine.getNodeFactories().registerFactory(new OMWebEditDefaultNodeFactory());

  // setup the diagram model
  var model = new DiagramModel();

  // setup nodes
  var node1 = new OMWebEditDefaultNodeModel("sine-voltage");
  node1.setPosition(100, 200);

  var node2 = new OMWebEditDefaultNodeModel("resistor");
  node2.setPosition(250, 108);

  var node3 = new OMWebEditDefaultNodeModel("inductor");
  node3.setPosition(500, 100);

  var node4 = new OMWebEditDefaultNodeModel("ground");
  node3.setPosition(500, 100);

  // add nodes to model
  model.addAll(node1, node2, node3, node4);

  // load model into engine
  engine.setModel(model);

  return <CanvasWidget engine={engine} className="canvas" />;
}

export default App;
