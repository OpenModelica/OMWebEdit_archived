import {
  LinkModel,
  PortModel,
  DefaultLinkModel,
  PortModelAlignment,
} from "@projectstorm/react-diagrams";

export class OMWebEditPortModel extends PortModel {
  constructor(alignment: PortModelAlignment) {
    super({
      type: "omwebedit-default-node",
      name: alignment,
      alignment: alignment,
    });
  }

  createLinkModel(): LinkModel {
    return new DefaultLinkModel();
  }
}
