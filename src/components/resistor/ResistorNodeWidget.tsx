import * as React from 'react';
import { ResistorNodeModel } from './ResistorNodeModel';
import { DiagramEngine, PortModelAlignment, PortWidget } from '@projectstorm/react-diagrams';
import styled from '@emotion/styled';

export interface ResistorNodeWidgetProps {
	node: ResistorNodeModel;
	engine: DiagramEngine;
	size?: number;
}


export const Port = styled.div`
	width: 16px;
	height: 16px;
	z-index: 10;
	background: rgba(0, 0, 0, 0.5);
	border-radius: 8px;
	cursor: pointer;

	&:hover {
		background: rgba(0, 0, 0, 1);
	}
`;

export class ResistorNodeWidget extends React.Component<ResistorNodeWidgetProps> {
	render() {
		return (
			<div
				className={'resistor-node'}
				style={{
					position: 'relative',
					width: this.props.size,
					height: this.props.size
				}}>
				<svg
					width={this.props.size}
					height={this.props.size}
					dangerouslySetInnerHTML={{
						__html:
							`
          <g id="Layer_1">
          </g>
          <g id="Layer_2">
            <polygon fill="mediumpurple" stroke="${
							this.props.node.isSelected() ? 'white' : '#000000'
						}" stroke-width="3" stroke-miterlimit="10" points="10,` +
							this.props.size / 2 +
							` ` +
							this.props.size / 2 +
							`,10 ` +
							(this.props.size - 10) +
							`,` +
							this.props.size / 2 +
							` ` +
							this.props.size / 2 +
							`,` +
							(this.props.size - 10) +
							` "/>
          </g>
        `
					}}
				/>
				<PortWidget
					style={{
						top: this.props.size / 2 - 8,
						left: -8,
						position: 'absolute'
					}}
					port={this.props.node.getPort(PortModelAlignment.LEFT)}
					engine={this.props.engine}>
					<Port />
				</PortWidget>
				<PortWidget
					style={{
						left: this.props.size / 2 - 8,
						top: -8,
						position: 'absolute'
					}}
					port={this.props.node.getPort(PortModelAlignment.TOP)}
					engine={this.props.engine}>
					<Port />
				</PortWidget>
				<PortWidget
					style={{
						left: this.props.size - 8,
						top: this.props.size / 2 - 8,
						position: 'absolute'
					}}
					port={this.props.node.getPort(PortModelAlignment.RIGHT)}
					engine={this.props.engine}>
					<Port />
				</PortWidget>
				<PortWidget
					style={{
						left: this.props.size / 2 - 8,
						top: this.props.size - 8,
						position: 'absolute'
					}}
					port={this.props.node.getPort(PortModelAlignment.BOTTOM)}
					engine={this.props.engine}>
					<Port />
				</PortWidget>
			</div>
		);
	}
}
