import {
  LinkModel,
  PortModel,
  DefaultLinkModel,
} from "@projectstorm/react-diagrams";
import { OMPort } from "../../domain-model/OMPort";

export class OMPortModel extends PortModel {
  constructor(port: OMPort) {
    super({
      type: "om-port",
      name: port.id,
      placement: port.placement,
      rotation: port.rotation,
    });
  }

  createLinkModel(): LinkModel {
    return new DefaultLinkModel();
  }
}
