import { OMComponentWidget } from "./OMComponentWidget";
import { OMComponent } from "../../domain-model/OMComponent";
import * as React from "react";
import { AbstractReactFactory } from "@projectstorm/react-canvas-core";
import { DiagramEngine } from "@projectstorm/react-diagrams-core";

export class OMComponentFactory extends AbstractReactFactory<
  OMComponent,
  DiagramEngine
> {
  constructor() {
    super("om-nodeEventData");
  }

  generateReactWidget(event): JSX.Element {
    return (
      <OMComponentWidget engine={this.engine} size={100} node={event.model} />
    );
  }

  generateModel(event) {
    return new OMComponent("default", "displayLabel", "svgPath", null);
  }
}
