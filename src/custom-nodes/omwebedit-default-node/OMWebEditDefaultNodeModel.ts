import { NodeModel, NodeModelGenerics, PortModelAlignment } from '@projectstorm/react-diagrams';
import { OMWebEditPortModel } from './OMWebEditPortModel';
import { merge} from 'lodash';
import {
	DeserializeEvent
} from '@projectstorm/react-canvas-core';

export interface OMWebEditDefaultNodeModelGenerics {
	PORT: OMWebEditPortModel;
}

export class OMWebEditDefaultNodeModel extends NodeModel<NodeModelGenerics & OMWebEditDefaultNodeModelGenerics> {

	icon: string;
	rotation: string;
	data: object;

	constructor(icon: string, rotation: string) {
		super({
			type: 'omwebedit-default-node'
		});
		this.addPort(new OMWebEditPortModel(PortModelAlignment.LEFT));
		this.addPort(new OMWebEditPortModel(PortModelAlignment.RIGHT));
		this.icon = icon;
		this.rotation = rotation;
        this.data = {};
	}

	serialize() {
		return merge(super.serialize(), {
			icon: this.icon,
			rotation: this.rotation
		});
	}

	deserialize(event: DeserializeEvent<this>): void {
		super.deserialize(event);
		this.icon = event.data.icon;
		this.rotation = event.data.rotation;
	}
}
