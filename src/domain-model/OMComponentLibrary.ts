import inductorJson from "../component-inductor.json";
import resistorJson from "../component-resistor.json";
import groundJson from "../component-ground.json";
import { OMComponent } from "./OMComponent";
import { OMPort } from "./OMPort";

export class OMComponentLibrary {
  private components: Map<String, OMComponent>;

  public constructor() {
    this.getAllComponents();
  }

  public getComponentById(id: string): OMComponent {
    return this.components.get(id);
  }

  public getAllComponents(): Map<String, OMComponent> {
    this.components = new Map<String, OMComponent>();
    const node1: OMComponent = this.getNodeFromServerResponse(inductorJson);
    const node2: OMComponent = this.getNodeFromServerResponse(resistorJson);
    const node3: OMComponent = this.getNodeFromServerResponse(groundJson);
    this.components.set(node1.iconId, node1);
    this.components.set(node2.iconId, node2);
    this.components.set(node3.iconId, node3);
    return this.components;
  }

  private getNodeFromServerResponse(nodeJson): OMComponent {
    const node: OMComponent = new OMComponent(
      nodeJson.id,
      nodeJson.displayLabel,
      nodeJson.svgPath,
      nodeJson.size
    );
    nodeJson.connectors.forEach((connector) => {
      node.addPort(
        new OMPort(connector.id, connector.svgPath, connector.placement)
      );
    });
    return node;
  }
}
