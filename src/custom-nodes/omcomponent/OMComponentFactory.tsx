import { OMComponentWidget } from "./OMComponentWidget";
import { OMComponentModel } from "./OMComponentModel";
import * as React from "react";
import { AbstractReactFactory } from "@projectstorm/react-canvas-core";
import { DiagramEngine } from "@projectstorm/react-diagrams-core";

export class OMComponentFactory extends AbstractReactFactory<
  OMComponentModel,
  DiagramEngine
> {
  constructor() {
    super("om-component");
  }

  generateReactWidget(event): JSX.Element {
    return (
      <OMComponentWidget engine={this.engine} size={100} node={event.model} />
    );
  }

  generateModel(event) {
    return new OMComponentModel("default", "svgPath", null, []);
  }
}
