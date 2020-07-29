import { NodeModel, NodeModelGenerics } from "@projectstorm/react-diagrams";
import { OMPort } from "./OMPort";
import { merge } from "lodash";
import { DeserializeEvent } from "@projectstorm/react-canvas-core";

export interface OMWebEditDefaultNodeModelGenerics {
  PORT: OMPort;
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
  size: size;
  data: object;

  constructor(iconId: string, svgPath: string, size: size) {
    super({
      type: "om-nodeEventData",
    });
    this.iconId = iconId;
    this.svgPath = svgPath;
    this.size = size;
    this.data = {};
  }

  serialize() {
    return merge(super.serialize(), {
      id: this.iconId,
      svgPath: this.svgPath,
    });
  }

  deserialize(event: DeserializeEvent<this>): void {
    super.deserialize(event);
    this.iconId = event.data.iconId;
    this.svgPath = event.data.svgPath;
  }
}
