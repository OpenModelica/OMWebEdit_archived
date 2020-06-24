import { NodeModel, NodeModelGenerics, PortModelAlignment } from '@projectstorm/react-diagrams';
import { OMWebEditPortModel } from './OMWebEditPortModel';

export interface ResistorNodeModelGenerics {
	PORT: OMWebEditPortModel;
}

export class OMWebEditDefaultNodeModel extends NodeModel<NodeModelGenerics & ResistorNodeModelGenerics> {

	icon: string;

	constructor(icon: string) {
		super({
			type: 'omwebedit-default-node'
		});
		this.addPort(new OMWebEditPortModel(PortModelAlignment.LEFT));
		this.addPort(new OMWebEditPortModel(PortModelAlignment.RIGHT));
		this.icon = icon;
	}
}
