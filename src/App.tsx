import React from "react";

import createEngine, {
  DiagramModel, PortModelAlignment,
} from "@projectstorm/react-diagrams";
import { CanvasWidget } from "@projectstorm/react-canvas-core";
import "./App.css";
import {SimplePortFactory} from "./components/common/SimplePortFactory";
import {ResistorPortModel} from "./components/resistor/ResistorPortModel";
import {ResistorNodeFactory} from "./components/resistor/ResistorNodeFactory";
import {ResistorNodeModel} from "./components/resistor/ResistorNodeModel";

function App() {

  // setup the diagram engine
  var engine = createEngine();

  // register some other factories as well
  engine
      .getPortFactories()
      .registerFactory(new SimplePortFactory('omwebedit-default', (config) => new ResistorPortModel(PortModelAlignment.LEFT)));
  engine.getNodeFactories().registerFactory(new ResistorNodeFactory());

  // setup the diagram model
  var model = new DiagramModel();

  // setup nodes
  var node1 = new ResistorNodeModel("sine-voltage");
  node1.setPosition(100, 200);

  var node2 = new ResistorNodeModel("resistor");
  node2.setPosition(250, 108);

  var node3 = new ResistorNodeModel("inductor");
  node3.setPosition(500, 100);

  var node4 = new ResistorNodeModel("ground");
  node3.setPosition(500, 100);

  // add nodes to model
  model.addAll(node1, node2, node3, node4);

  // load model into engine
  engine.setModel(model);

  return <CanvasWidget engine={engine} className="canvas" />;
}

export default App;
