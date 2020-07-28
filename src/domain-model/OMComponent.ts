import { NodeModel, NodeModelGenerics } from "@projectstorm/react-diagrams";
import { OMPortModel } from "./OMPortModel";
import { merge } from "lodash";
import { DeserializeEvent } from "@projectstorm/react-canvas-core";
import { OMPort } from "./OMPort";

export interface OMWebEditDefaultNodeModelGenerics {
  PORT: OMPortModel;
}

interface size {
  width: number;
  height: number;
}

export class OMComponent extends NodeModel<
  NodeModelGenerics & OMWebEditDefaultNodeModelGenerics
> {
  iconId: string;
  svgPath: string;
  rotation: string;
  size: size;
  customPorts: OMPort[];
  data: object;

  constructor(iconId: string, svgPath: string, size: size, ports: OMPort[]) {
    super({
      type: "om-component",
    });
    this.iconId = iconId;
    this.svgPath = svgPath;
    this.size = size;
    this.customPorts = ports;
    this.data = {};

    ports.forEach((port) => {
      this.addPort(new OMPortModel(port));
    });
  }

  serialize() {
    return merge(super.serialize(), {
      id: this.iconId,
      svgPath: this.svgPath,
      rotation: this.rotation,
      customPorts: this.customPorts,
    });
  }

  deserialize(event: DeserializeEvent<this>): void {
    super.deserialize(event);
    this.iconId = event.data.iconId;
    this.svgPath = event.data.svgPath;
    this.rotation = event.data.rotation;
    this.customPorts = event.data.customPorts;
  }
}
