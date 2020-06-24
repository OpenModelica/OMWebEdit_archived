import { NodeModel, NodeModelGenerics, PortModelAlignment } from '@projectstorm/react-diagrams';
import { ResistorPortModel } from './ResistorPortModel';

export interface ResistorNodeModelGenerics {
	PORT: ResistorPortModel;
}

export class ResistorNodeModel extends NodeModel<NodeModelGenerics & ResistorNodeModelGenerics> {
	constructor() {
		super({
			type: 'resistor'
		});
		this.addPort(new ResistorPortModel(PortModelAlignment.TOP));
		this.addPort(new ResistorPortModel(PortModelAlignment.LEFT));
		this.addPort(new ResistorPortModel(PortModelAlignment.BOTTOM));
		this.addPort(new ResistorPortModel(PortModelAlignment.RIGHT));
	}
}
