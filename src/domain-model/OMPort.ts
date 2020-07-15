export interface OMPort {
  id: string;
  placement: OMPortPlacement;
  rotation: number;
}

export interface OMPortPlacement {
  bottomLeft: {
    x: number;
    y: number;
  };
}
