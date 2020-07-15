import { NodeModel, NodeModelGenerics } from "@projectstorm/react-diagrams";
import { OMPortModel } from "./OMPortModel";
import { merge } from "lodash";
import { DeserializeEvent } from "@projectstorm/react-canvas-core";
import { OMPort } from "../../domain-model/OMPort";

export interface OMWebEditDefaultNodeModelGenerics {
  PORT: OMPortModel;
}

interface size {
  width: number;
  height: number;
}

export class OMComponentModel extends NodeModel<
  NodeModelGenerics & OMWebEditDefaultNodeModelGenerics
> {
  icon: string;
  rotation: string;
  size: size;
  customPorts: OMPort[];
  data: object;

  constructor(icon: string, size: size, ports: OMPort[]) {
    super({
      type: "om-component",
    });
    this.icon = icon;
    this.size = size;
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
