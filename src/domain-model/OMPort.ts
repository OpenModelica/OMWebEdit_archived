import {
  LinkModel,
  PortModel,
  DefaultLinkModel,
} from "@projectstorm/react-diagrams";

export class OMPort extends PortModel {
  constructor(id: string, svgPath: string, placement: OMPortPlacement) {
    super({
      type: "om-port",
      name: id,
      svgPath: svgPath,
      placement: placement,
    });
  }

  createLinkModel(): LinkModel {
    return new DefaultLinkModel();
  }
}

interface OMPortPlacement {
  bottomLeft: {
    x: number;
    y: number;
  };
  rotation: number;
}
