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
	customPorts: PortModelAlignment[];
	data: object;

	constructor(icon: string, rotation?: string, cutomPorts?: PortModelAlignment[]) {
		super({
			type: 'omwebedit-default-node'
		});
		this.icon = icon;
		this.customPorts = cutomPorts;
		this.data = {};

		if (cutomPorts) {
			cutomPorts.forEach((port) => {
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
			rotation: this.rotation,
			customPorts: this.customPorts
		});
	}

	deserialize(event: DeserializeEvent<this>): void {
		super.deserialize(event);
		this.icon = event.data.icon;
		this.rotation = event.data.rotation;
		this.customPorts = event.data.customPorts;
	}
}
