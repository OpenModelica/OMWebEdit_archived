import { NodeModel, NodeModelGenerics } from "@projectstorm/react-diagrams";
import { OMPortModel } from "./OMPortModel";
import { merge } from "lodash";
import { DeserializeEvent } from "@projectstorm/react-canvas-core";
import { OMPort } from "../../domain-model/OMPort";

export interface OMWebEditDefaultNodeModelGenerics {
  PORT: OMPortModel;
}

export class OMComponentModel extends NodeModel<
  NodeModelGenerics & OMWebEditDefaultNodeModelGenerics
> {
  icon: string;
  rotation: string;
  customPorts: OMPort[];
  data: object;

  constructor(icon: string, ports: OMPort[]) {
    super({
      type: "om-component",
    });
    this.icon = icon;
    this.customPorts = ports;
    this.data = {};

    ports.forEach((port) => {
      this.addPort(new OMPortModel(port));
    });
  }

  serialize() {
    return merge(super.serialize(), {
      icon: this.icon,
      rotation: this.rotation,
      customPorts: this.customPorts,
    });
  }

  deserialize(event: DeserializeEvent<this>): void {
    super.deserialize(event);
    this.icon = event.data.icon;
    this.rotation = event.data.rotation;
    this.customPorts = event.data.customPorts;
  }
}
