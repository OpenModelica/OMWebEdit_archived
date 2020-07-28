export interface OMPort {
  id: string;
  svgPath: string;
  placement: OMPortPlacement;
}

export interface OMPortPlacement {
  bottomLeft: {
    x: number;
    y: number;
  };
  rotation: number;
}
