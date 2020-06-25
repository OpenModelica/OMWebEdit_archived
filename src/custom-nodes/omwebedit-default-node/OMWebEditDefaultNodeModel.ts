import {NodeModel, NodeModelGenerics, PortModelAlignment} from '@projectstorm/react-diagrams';
import {OMWebEditPortModel} from './OMWebEditPortModel';
import {merge} from 'lodash';
import {DeserializeEvent} from '@projectstorm/react-canvas-core';

export interface OMWebEditDefaultNodeModelGenerics {
	PORT: OMWebEditPortModel;
}

export class OMWebEditDefaultNodeModel extends NodeModel<NodeModelGenerics & OMWebEditDefaultNodeModelGenerics> {

	icon: string;
	rotation: string;
	data: object;

	// constructor(icon: string);
	// constructor(icon: string, rotation?: string);
	// constructor(icon: string, rotation?: string, ports?: PortModelAlignment[]);
	constructor(icon: string, rotation?: string, ports?: PortModelAlignment[]) {
		super({
			type: 'omwebedit-default-node'
		});
		this.icon = icon;
		this.data = {};

		if (ports) {
			ports.forEach((port) => {
				this.addPort(new OMWebEditPortModel(port));
			});
        } else {
			this.addPort(new OMWebEditPortModel(PortModelAlignment.LEFT));
			this.addPort(new OMWebEditPortModel(PortModelAlignment.RIGHT));
		}

		if(rotation) {
			this.rotation = rotation;
		} else {
			this.rotation = 'default';
		}
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
