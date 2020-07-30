import componentJson from "../components.json";
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
    componentJson.forEach((componentJson) => {
      const node: OMComponent = this.getNodeFromServerResponse(componentJson);
      this.components.set(node.componentId, node);
    });
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
