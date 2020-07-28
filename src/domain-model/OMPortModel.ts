import {
  LinkModel,
  PortModel,
  DefaultLinkModel,
} from "@projectstorm/react-diagrams";
import { OMPort } from "./OMPort";

export class OMPortModel extends PortModel {
  constructor(port: OMPort) {
    super({
      type: "om-port",
      name: port.id,
      svgPath: port.svgPath,
      placement: port.placement,
    });
  }

  createLinkModel(): LinkModel {
    return new DefaultLinkModel();
  }
}
