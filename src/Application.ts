import createEngine, {
  DiagramModel,
  DiagramEngine,
} from "@projectstorm/react-diagrams";
import { OMComponentFactory } from "./custom-nodes/omcomponent/OMComponentFactory";

export class Application {
  protected activeModel: DiagramModel;
  protected diagramEngine: DiagramEngine;

  constructor() {
    this.diagramEngine = createEngine();
    this.init();
  }

  public init() {
    this.activeModel = new DiagramModel();
    this.diagramEngine.setModel(this.activeModel);

    this.diagramEngine
      .getNodeFactories()
      .registerFactory(new OMComponentFactory());
  }

  public getDiagramEngine(): DiagramEngine {
    return this.diagramEngine;
  }
}
