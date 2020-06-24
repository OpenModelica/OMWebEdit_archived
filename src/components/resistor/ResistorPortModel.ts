import { LinkModel, PortModel, DefaultLinkModel, PortModelAlignment } from '@projectstorm/react-diagrams';

export class ResistorPortModel extends PortModel {
	constructor(alignment: PortModelAlignment) {
		super({
			type: 'resistor',
			name: alignment,
			alignment: alignment
		});
	}

	createLinkModel(): LinkModel {
		return new DefaultLinkModel();
	}
}
