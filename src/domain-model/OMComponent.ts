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
  componentId: string;
  displayLabel: string;
  svgPath: string;
  size: size;
  data: object;

  constructor(
    componentId: string,
    displayLabel: string,
    svgPath: string,
    size: size
  ) {
    super({
      type: "om-nodeEventData",
    });
    this.componentId = componentId;
    this.displayLabel = displayLabel;
    this.svgPath = svgPath;
    this.size = size;
    this.data = {};
  }

  serialize() {
    return merge(super.serialize(), {
      componentId: this.componentId,
      svgPath: this.svgPath,
    });
  }

  deserialize(event: DeserializeEvent<this>): void {
    super.deserialize(event);
    this.componentId = event.data.componentId;
    this.svgPath = event.data.svgPath;
  }
}
