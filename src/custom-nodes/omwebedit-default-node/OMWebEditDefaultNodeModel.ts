import { NodeModel, NodeModelGenerics, PortModelAlignment } from '@projectstorm/react-diagrams';
import { OMWebEditPortModel } from './OMWebEditPortModel';

export interface OMWebEditDefaultNodeModelGenerics {
	PORT: OMWebEditPortModel;
}

export class OMWebEditDefaultNodeModel extends NodeModel<NodeModelGenerics & OMWebEditDefaultNodeModelGenerics> {

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
